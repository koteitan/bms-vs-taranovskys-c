// sigma2.js FROM TO [--off] : σ for arguments starting with Ω_{Ω_2}
//   a = Ω_{Ω_2} + t_2 + ... ; subscript summand s of a later term:
//   s < η: keep;  s = ψ_1(Ω_{Ω_2}+Y) ↦ ψ_2(Y');  term t_j = Ω_{Ω_2} ↦ Ω_{ψ_2((t_2+..+t_j)')}
//   Y' = Y with its m-th term Ω_{Ω_2} replaced by Ω_{ψ_1(Ω_{Ω_2}+y_1+..+y_m)}
const path = require('path');
const fs = require('fs');
const { spawnSync } = require('child_process');
const ROOT = path.join(__dirname, "..");
const E = require(path.join(ROOT, 'ebpsi.js'));
const X = require(path.join(ROOT, 'ebp2tc.js'));
const B = require(path.join(ROOT, 'bms2tc.js'));
const CLI = path.join(ROOT, 'lean/.lake/build/bin/bms2tc');
const batch = lines => {
  if (!lines.length) return [];
  const out = spawnSync(CLI, ['batch'], { input: lines.join('\n') + '\n', encoding: 'utf8', maxBuffer: 1 << 30 }).stdout.split('\n');
  return lines.map((_, i) => (out[i] || '').trim());
};
const { P, nat, terms, mk, cmp, eq, add, natValue } = E;
const W2 = P(nat(2), 0), OO2 = P(W2, 0), ETA = P(E.ONE, OO2);
const sum = ts => ts.reduce((acc, p) => add(acc, p), 0);

// Ω_{Ω_2} の段の項: 添字がちょうど Ω_2（Ω_{Ω_2} = ψ_{Ω_2}(0) と ψ_{Ω_2}(z)）
// 上限 B = ψ_2(Ω_{Ω_2})（これ以上の添字では式の像が元の項より小さくなる）
const BOUND = P(nat(2), OO2);
const isO2 = q => q !== 0 && !Array.isArray(q) && cmp(q.i, W2) >= 0 && cmp(q.i, BOUND) < 0;
// 中の可算の崩壊 ψ_0(..) にも σ を当てる
function fixAll(t) {
  let out = 0;
  for (const p of terms(t)) out = add(out, natValue(p.i) === 0 ? top(p) : P(fixAll(p.i), fixAll(p.a)));
  return out;
}
// λ(b): b の先頭の Ω_{Ω_2} を落とし、残りの Ω_{Ω_2} 段の項 y_m を Ω_{ψ_1(b_{≤m})} に置き換えた和
// 添字が Ω_2 以上の項（λ と添字の規則ではこちらを使う。最上位の置き換えは isO2 で B 未満に限る）
const isBig = q => q !== 0 && !Array.isArray(q) && cmp(q.i, W2) >= 0;
function lam(b) {
  const bs = terms(b), out = [];
  bs.forEach((y, m) => {
    if (m === 0 && eq(y, OO2)) return;
    if (isBig(y)) out.push(P(P(E.ONE, sum(bs.slice(0, m + 1))), 0));
    else out.push(y);
  });
  return sum(out);
}
function slot(s) {            // principal subscript summand s
  if (cmp(s, ETA) < 0) return s;
  if (natValue(s.i) === 1 && terms(s.a).length && isBig(terms(s.a)[0])) return P(nat(2), lam(s.a));
  return s;
}
// --low: 低い崩壊 ψ_ν(b)（ν ≥ 1）の引数 b にも同じ変換を当てる
const LOW = process.argv.includes('--low');
function argT(xs) {
  const out = [];
  let first = -1;   // 最初の Ω_{Ω_2} 段の項の位置
  for (let j = 0; j < xs.length; j++) {
    const q = xs[j];
    if (isO2(q)) {
      if (first < 0) first = j;
      if (j === first && eq(q, OO2)) out.push(q);
      else {
        const seg = xs.slice(first, j + 1);
        const pre = eq(seg[0], OO2) ? seg : [OO2, ...seg];
        out.push(P(P(nat(2), lam(sum(pre))), 0));
      }
      continue;
    }
    const n = natValue(q.i);
    if (n === 0) { out.push(q); continue; }                                  // 可算の崩壊は fixAll 済み
    const a = (LOW && q.a !== 0) ? argT(terms(q.a)) : q.a;
    if (n !== null) { out.push(P(q.i, a)); continue; }                       // 有限添字の低い項
    out.push(P(sum(terms(q.i).map(slot)), a));
  }
  return sum(out);
}
function top(t) {
  if (t.a === 0) return t;
  const xs = terms(fixAll(t.a));
  if (!xs.length) return t;
  if (!LOW && (!isO2(xs[0]) || (xs.length === 1 && eq(xs[0], OO2)))) return P(0, mk(xs));
  return P(0, argT(xs));
}

module.exports = { top, slot, lam };
if (require.main !== module) return;
const args = process.argv.slice(2);
const off = args.includes('--off');
const [from, to] = args.filter(a => !a.startsWith('--')).map(Number);
const tr = t => (off || Array.isArray(t) || t === 0 || natValue(t.i) !== 0) ? t : top(t);
const tcs = t => B.tcToString(X.iota(tr(t)), false);
const rows = JSON.parse(fs.readFileSync(path.join(ROOT, 'sheet/bms_rows.json'), 'utf8'));
const items = [];
for (let i = from; i <= to; i++) {
  const [sheet, b, u] = rows[i];
  if (sheet !== 'To psi(I)' || !b.startsWith('(') || b.split(')')[0].split(',').length !== 3) continue;
  const it = { idx: i, label: u };
  try {
    it.t = E.parseLabel(X.fixLabel(u));
    it.tc = tcs(it.t);
    if (E.dom(it.t) === 'w') it.ap = [4, 5, 6].map(n => tcs(E.fs(it.t, E.nat(n))));
  } catch (e) { it.err = e.message.slice(0, 50); }
  items.push(it);
}
const q = [], at = [];
const ask = (l, cb) => { q.push(l); at.push(cb); };
items.forEach((it, k) => {
  if (!it.tc) return;
  ask(`std ${it.tc}`, r => { it.std = r === '1'; });
  if (it.ap) {
    it.apStd = true;
    it.ap.forEach(a => ask(`std ${a}`, r => { if (r !== '1') it.apStd = false; }));
    ask(`supseq ${it.ap.join(' ')}`, r => { it.sup = r; });
  }
  const nx = items[k + 1];
  if (nx && nx.idx === it.idx + 1 && nx.tc) ask(`cmp ${it.tc} ${nx.tc}`, r => { it.order = r; });
});
batch(q).forEach((r, i) => at[i](r));
const cnt = { items: items.length, err: 0, nonstd: 0, weak: 0, supbad: 0, orderbad: 0, trusted: 0 };
const bad = [];
for (const it of items) {
  if (it.err) { cnt.err++; continue; }
  const codes = [];
  if (!it.std) { cnt.nonstd++; codes.push('nonstd'); }
  if (it.ap) {
    const ok = it.sup === it.tc;
    if (it.apStd && !ok) { cnt.supbad++; codes.push('SUP≠'); }
    if (!it.apStd) { cnt.weak++; codes.push('weak'); }
    if (it.apStd && ok && it.std) cnt.trusted++;
  }
  if (it.order && it.order !== '-1') { cnt.orderbad++; codes.push('order' + it.order); }
  if (codes.length) bad.push(`${it.idx} ${codes.join(',')} ${it.label}`);
}
console.log(off ? 'baseline' : 'sigma2', JSON.stringify(cnt));
for (const l of bad.slice(0, 70)) console.log('  ' + l.slice(0, 150));
