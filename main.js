'use strict';

// ---- UI 状態 (localStorage)
const KEY = 'bms2tc-ui';
let state = {};
try { state = JSON.parse(localStorage.getItem(KEY) || '{}'); } catch (e) { state = {}; }
function save(patch) {
  Object.assign(state, patch);
  try { localStorage.setItem(KEY, JSON.stringify(state)); } catch (e) { /* ignore */ }
}

const $ = id => document.getElementById(id);
const bmsEl = $('bms'), tcEl = $('tc');
const optDark = $('opt-dark'), optOmega = $('opt-omega');
const menuBtn = $('menu-btn'), menuPanel = $('menu-panel');

// ---- dark mode (default: on)
function applyDark(on) {
  document.documentElement.classList.toggle('dark', on);
  document.documentElement.classList.toggle('light', !on);
  optDark.checked = on;
}
applyDark(state.dark ?? true);
optDark.addEventListener('change', () => { applyDark(optDark.checked); save({ dark: optDark.checked }); });

// ---- notation (default: Ω_n)
optOmega.checked = state.omega ?? true;
optOmega.addEventListener('change', () => { save({ omega: optOmega.checked }); convert(); });

// ---- menu
menuBtn.addEventListener('click', e => {
  e.stopPropagation();
  const open = menuPanel.hidden;
  menuPanel.hidden = !open;
  menuBtn.setAttribute('aria-expanded', String(open));
});
document.addEventListener('click', e => {
  if (!menuPanel.hidden && !menuPanel.contains(e.target)) {
    menuPanel.hidden = true;
    menuBtn.setAttribute('aria-expanded', 'false');
  }
});

// ---- 3 行: シートの行の対応表（sheet/tss_web.json）を必要になったら読み込む
let tssMap = null, tssState = 'none';   // none | loading | ready | failed
function loadTss() {
  if (tssState !== 'none') return;
  tssState = 'loading';
  fetch('sheet/tss_web.json')
    .then(r => { if (!r.ok) throw new Error(r.status); return r.json(); })
    .then(j => { tssMap = j; tssState = 'ready'; convert(); })
    .catch(() => { tssState = 'failed'; convert(); });
}
function toOmega(t) {
  return t.replace(/W_(\d+)/g, 'Ω_$1').replace(/W(?!_)/g, 'Ω_1');
}

// ---- 変換
function convert() {
  const lines = bmsEl.value.split('\n');
  const out = lines.map(line => {
    if (line.trim() === '') return '';
    const r = Bms2tc.translate(line, { omega: optOmega.checked });
    if (r.tc !== null) return r.tc;
    if (r.rows === 3) {
      if (tssState === 'none' || tssState === 'loading') { loadTss(); return '(loading table…)'; }
      const e = tssMap && tssMap[r.bms];
      if (e) return (optOmega.checked ? toOmega(e[0]) : e[0]) + (e[1] ? '  ⚠ flagged' : '');
      return '3 行: シートの ψ(I) までの行のみ対応 (3 rows: only rows of the sheet up to ψ(I))';
    }
    return r.error;
  });
  tcEl.value = out.join('\n');
}

// ---- URL query
function updateQuery() {
  const url = new URL(location.href);
  if (bmsEl.value === '') url.searchParams.delete('bms');
  else url.searchParams.set('bms', bmsEl.value);
  history.replaceState(null, '', url);
}

bmsEl.addEventListener('input', () => { convert(); updateQuery(); });

(function init() {
  const q = new URL(location.href).searchParams.get('bms');
  if (q !== null) bmsEl.value = q;
  convert();
})();
