import BmsTc.TC

open TC

#guard isStandard (parse! "C(0,0)") == true
#guard isStandard (parse! "C(C(0,0),C(0,W_3))") == false
#guard isStandard (parse! "C(C(W_2,0),C(W_2,0))") == false
#guard isStandard (parse! "W") == true
#guard isStandard (parse! "0") == true
#guard isStandard (parse! "C(C(0,C(C(C(0,W),C(W,0)),C(C(0,0),W))),C(C(C(C(W,W),C(0,0)),0),C(0,C(C(W,0),0))))") == false
#guard isStandard (parse! "C(C(0,C(C(W_2,C(W_2,0)),C(W,C(W_2,W_2)))),C(0,C(C(C(W,0),0),W)))") == false
#guard isStandard (parse! "C(C(C(C(W_2,0),C(C(0,W_2),C(W_2,0))),C(C(W_2,C(W_2,0)),W_2)),0)") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),W_3),C(C(0,0),C(0,0))),C(C(C(W_2,W_3),C(0,0)),C(0,0))),C(C(C(0,C(W_3,0)),C(C(0,W_2),0)),0))") == false
#guard isStandard (parse! "C(C(0,W_2),0)") == true
#guard isStandard (parse! "C(W_2,0)") == false
#guard isStandard (parse! "C(C(0,C(0,C(0,C(W_3,0)))),C(C(W_3,0),C(0,C(C(0,W_2),C(0,W_3)))))") == false
#guard isStandard (parse! "C(W,W)") == true
#guard isStandard (parse! "C(W_2,W)") == true
#guard isStandard (parse! "C(C(0,0),C(0,0))") == false
#guard isStandard (parse! "C(C(C(C(0,W),0),C(0,W)),C(C(0,W),C(C(W,W),C(W,0))))") == false
#guard isStandard (parse! "C(0,C(0,0))") == true
#guard isStandard (parse! "C(W,C(0,0))") == false
#guard isStandard (parse! "C(C(W_2,C(C(W_3,0),C(W,0))),C(0,C(C(W_3,0),C(W_3,0))))") == false
#guard isStandard (parse! "C(W,W_3)") == true
#guard isStandard (parse! "C(W,C(C(W,W),C(W,W)))") == false
#guard isStandard (parse! "C(W,C(C(C(0,W),C(W,0)),W))") == false
#guard isStandard (parse! "C(C(W,0),C(W,W))") == true
#guard isStandard (parse! "C(0,W)") == true
#guard isStandard (parse! "C(W,0)") == true
#guard isStandard (parse! "C(W,C(C(W_2,0),C(W_2,W)))") == false
#guard isStandard (parse! "C(C(0,0),C(0,W))") == false
#guard isStandard (parse! "C(C(C(W,W),0),C(C(0,0),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(C(0,C(0,0)),C(C(W_2,0),C(W,0))),C(C(C(0,0),W_3),0)),0)") == false
#guard isStandard (parse! "C(C(C(C(C(W,W),0),C(C(W,W),W)),C(C(W,C(0,0)),0)),C(C(C(W,C(W,W)),C(C(0,0),W)),0))") == false
#guard isStandard (parse! "C(C(C(0,0),C(C(W,0),C(C(W,W),C(W,0)))),W)") == false
#guard isStandard (parse! "C(C(C(0,C(0,W_2)),C(C(W,W_2),W)),0)") == false
#guard isStandard (parse! "C(C(C(C(C(W,0),C(W,0)),C(0,W)),C(C(0,C(W,W)),C(C(0,W),C(0,W)))),W)") == false
#guard isStandard (parse! "C(0,C(C(C(C(0,0),0),C(0,W_2)),C(C(C(0,0),C(0,W_2)),0)))") == false
#guard isStandard (parse! "C(C(C(C(0,W),0),0),C(C(C(W,0),W),C(C(0,W),C(0,W))))") == false
#guard isStandard (parse! "C(C(0,W),0)") == true
#guard isStandard (parse! "C(C(C(W,0),C(0,0)),C(C(W,0),C(0,W)))") == false
#guard isStandard (parse! "C(C(C(C(W_3,W),C(0,0)),C(C(0,W_3),C(0,W))),0)") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(0,0)),C(C(0,0),0)),0),C(C(C(C(W,W),C(0,0)),C(C(0,W_2),0)),C(0,W_2)))") == false
#guard isStandard (parse! "C(C(0,C(0,0)),C(C(W,0),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(C(W,0),C(0,0)),0),0)") == false
#guard isStandard (parse! "C(W_3,W_2)") == true
#guard isStandard (parse! "C(C(C(0,0),C(C(0,0),C(0,W))),C(C(C(0,0),C(0,W)),C(0,C(0,0))))") == false
#guard isStandard (parse! "C(C(0,0),W_2)") == true
#guard isStandard (parse! "C(C(C(W_2,0),C(0,0)),C(C(0,0),0))") == false
#guard isStandard (parse! "C(C(0,C(C(0,0),C(W,0))),W)") == true
#guard isStandard (parse! "C(C(0,C(0,W)),0)") == true
#guard isStandard (parse! "C(C(0,W_2),C(0,0))") == false
#guard isStandard (parse! "C(0,C(C(C(0,W),C(0,0)),0))") == false
#guard isStandard (parse! "C(C(C(W,C(W,W)),C(0,C(0,W))),C(C(C(W,W),C(0,W)),C(C(0,0),W)))") == false
#guard isStandard (parse! "W_2") == true
#guard isStandard (parse! "C(C(0,C(0,W)),C(0,C(0,0)))") == false
#guard isStandard (parse! "C(C(C(0,0),C(0,0)),C(C(0,0),C(W,0)))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),0),C(0,C(0,0))),C(W,C(0,0))),0)") == false
#guard isStandard (parse! "C(C(0,0),C(W,C(C(W,0),C(0,W_2))))") == false
#guard isStandard (parse! "C(0,C(C(W_2,0),0))") == false
#guard isStandard (parse! "C(C(C(0,0),C(W,0)),C(C(0,W_2),0))") == true
#guard isStandard (parse! "C(C(0,C(0,0)),C(C(W_2,W_2),C(W,0)))") == false
#guard isStandard (parse! "C(C(C(0,0),0),C(C(0,0),0))") == false
#guard isStandard (parse! "C(0,C(C(W,W),C(0,0)))") == false
#guard isStandard (parse! "C(W_3,C(C(W,C(0,0)),0))") == false
#guard isStandard (parse! "C(0,C(W,0))") == true
#guard isStandard (parse! "C(C(0,0),C(C(C(0,W_2),C(W,W)),0))") == false
#guard isStandard (parse! "C(0,C(W,W))") == true
#guard isStandard (parse! "C(C(C(0,C(C(W,0),C(0,0))),C(C(0,C(W,W)),0)),0)") == false
#guard isStandard (parse! "C(0,W_2)") == true
#guard isStandard (parse! "C(C(0,C(C(0,0),C(C(0,0),0))),W_2)") == true
#guard isStandard (parse! "C(C(C(C(C(W,0),W),C(C(0,W_2),C(0,W_2))),C(C(C(0,W),C(W,W)),C(C(0,W_2),C(0,W_2)))),C(C(C(W,C(W,0)),C(C(W_2,W),C(W,W))),C(C(C(0,W),C(W,W_2)),C(C(0,0),W_2))))") == false
#guard isStandard (parse! "C(C(W_2,0),C(0,C(C(C(W_2,0),C(W_2,W)),C(W_2,C(0,0)))))") == false
#guard isStandard (parse! "C(W_2,C(W_2,C(C(0,0),C(0,W))))") == false
#guard isStandard (parse! "C(C(C(W_2,W),C(W_2,0)),W)") == false
#guard isStandard (parse! "C(W,C(C(0,0),C(W,0)))") == false
#guard isStandard (parse! "C(C(C(0,0),C(0,0)),C(C(W,0),0))") == false
#guard isStandard (parse! "C(0,C(C(C(W,W),C(W,0)),C(C(0,0),C(0,W_2))))") == false
#guard isStandard (parse! "C(C(C(C(0,W),C(W,0)),C(0,C(W,W))),W)") == false
#guard isStandard (parse! "C(W,C(C(C(C(0,W),0),0),C(C(C(0,0),C(0,0)),0)))") == false
#guard isStandard (parse! "C(C(C(0,0),C(W_2,W)),C(C(0,W_2),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(0,C(0,0)),C(C(0,0),C(0,W))),C(W_3,C(C(0,W),C(W,0))))") == false
#guard isStandard (parse! "C(W_3,C(C(W_2,C(W,0)),C(C(0,W),C(W,W))))") == false
#guard isStandard (parse! "C(0,C(C(C(C(W_2,W_2),0),W_2),W))") == false
#guard isStandard (parse! "C(C(W,W),C(W,0))") == false
#guard isStandard (parse! "C(C(C(C(W,W),C(C(W,0),C(0,W))),0),C(C(C(C(0,0),0),C(C(W,W),C(0,0))),C(C(0,C(W,W)),0)))") == false
#guard isStandard (parse! "C(C(C(C(0,W),C(W_2,W)),C(0,C(W,W_2))),C(C(C(0,0),C(0,0)),C(0,C(0,W))))") == false
#guard isStandard (parse! "C(C(0,W),C(0,W_2))") == false
#guard isStandard (parse! "C(C(0,C(0,C(0,0))),0)") == true
#guard isStandard (parse! "C(C(0,W),C(0,0))") == false
#guard isStandard (parse! "C(C(C(0,W_3),C(W_3,W_2)),C(C(0,0),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(W_3,0),C(0,0)),0)") == false
#guard isStandard (parse! "C(C(C(0,W),0),C(C(0,W),C(W,W)))") == false
#guard isStandard (parse! "C(C(W_3,W_2),C(0,W_2))") == false
#guard isStandard (parse! "C(C(C(C(W_2,0),C(W_3,W)),C(C(W_3,W),W)),W)") == false
#guard isStandard (parse! "C(C(W_2,C(W_2,C(W_2,0))),C(C(0,C(W_2,W_2)),0))") == false
#guard isStandard (parse! "C(C(C(C(W_2,0),W_2),C(0,0)),C(0,C(0,C(0,0))))") == false
#guard isStandard (parse! "C(C(0,0),C(C(C(W_2,0),C(0,W)),W))") == false
#guard isStandard (parse! "C(C(C(0,C(W,0)),0),C(0,C(0,C(0,W))))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(0,0)),W),C(C(W,C(0,0)),C(C(0,0),0)))") == false
#guard isStandard (parse! "C(W,C(W,0))") == true
#guard isStandard (parse! "C(C(W,C(W,0)),C(0,C(0,0)))") == false
#guard isStandard (parse! "C(C(0,W_3),C(C(C(C(0,0),C(W,0)),W_3),C(C(C(W,W_2),W_3),C(C(W,0),C(W_2,W)))))") == false
#guard isStandard (parse! "C(0,C(C(C(C(W_3,W_3),W_3),W),C(C(W,C(W_3,0)),C(C(0,W),C(0,0)))))") == false
#guard isStandard (parse! "C(C(C(0,0),W_2),0)") == true
#guard isStandard (parse! "C(C(0,W),C(0,W))") == false
#guard isStandard (parse! "C(C(0,C(C(0,0),C(W,0))),C(C(C(0,W),0),C(C(0,0),C(0,0))))") == false
#guard isStandard (parse! "C(C(0,0),C(W_2,W_2))") == true
#guard isStandard (parse! "C(C(C(C(0,W),C(W_2,0)),C(W_3,W)),C(C(C(0,W_2),C(W_3,0)),0))") == false
#guard isStandard (parse! "C(W_2,C(W_2,C(W,C(0,0))))") == false
#guard isStandard (parse! "C(C(C(W_3,W),C(C(0,0),C(W_3,0))),C(C(C(0,0),0),C(0,C(0,W_2))))") == false
#guard isStandard (parse! "C(C(C(C(0,0),W),C(C(0,W),C(0,0))),C(C(C(W,W),C(W,W)),C(W,C(0,0))))") == false
#guard isStandard (parse! "C(C(C(C(0,0),W),C(0,C(0,W))),W)") == false
#guard isStandard (parse! "W_3") == true
#guard isStandard (parse! "C(C(W,W),0)") == true
#guard isStandard (parse! "C(C(W,0),C(C(C(C(0,0),C(W,W)),C(0,C(0,0))),C(0,C(C(W,W),C(0,W)))))") == false
#guard isStandard (parse! "C(C(0,C(W,C(C(0,0),C(0,W)))),W)") == false
#guard isStandard (parse! "C(C(C(C(0,W),0),C(C(W,0),0)),W)") == false
#guard isStandard (parse! "C(W_3,C(C(0,0),C(W,W_3)))") == false
#guard isStandard (parse! "C(C(C(0,0),W),C(C(W,W),C(0,W)))") == false
#guard isStandard (parse! "C(C(C(C(0,W),0),W),C(C(C(0,0),C(0,0)),C(0,C(W,0))))") == false
#guard isStandard (parse! "C(C(W_2,W_3),W_3)") == true
#guard isStandard (parse! "C(C(0,0),C(W,0))") == true
#guard isStandard (parse! "C(C(W,W_3),C(W,0))") == false
#guard isStandard (parse! "C(C(C(0,0),C(W,0)),W)") == true
#guard isStandard (parse! "C(C(C(0,W_3),C(0,0)),C(C(W,W),C(0,W_2)))") == false
#guard isStandard (parse! "C(W,C(C(0,0),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(0,W_2),C(0,0)),C(C(0,0),C(W,W)))") == false
#guard isStandard (parse! "C(C(C(C(0,C(0,0)),C(C(W_2,W),C(0,W_3))),C(0,C(C(0,0),C(0,0)))),W)") == false
#guard isStandard (parse! "C(C(W,W_3),C(W_3,0))") == false
#guard isStandard (parse! "C(C(0,0),W)") == true
#guard isStandard (parse! "C(C(C(0,C(C(0,0),C(0,W_2))),C(C(C(0,0),0),C(C(0,0),C(W_2,0)))),C(C(C(C(W_2,W_2),0),C(C(0,0),C(0,W_3))),C(C(C(0,W),C(W_3,W_2)),C(C(W_2,W_3),0))))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(W_2,W)),C(0,C(0,W))),C(W,C(C(W_2,0),C(0,0))))") == false
#guard isStandard (parse! "C(C(W,C(C(W,0),C(W,W))),W)") == false
#guard isStandard (parse! "C(C(C(C(0,W),C(0,W_2)),0),0)") == false
#guard isStandard (parse! "C(C(0,C(0,0)),C(W_3,C(C(W,C(W_3,W_2)),C(C(W_2,0),0))))") == false
#guard isStandard (parse! "C(C(0,0),C(W_3,0))") == false
#guard isStandard (parse! "C(C(0,0),0)") == true
#guard isStandard (parse! "C(C(C(0,C(W,0)),C(C(W,0),C(0,W))),C(C(C(0,0),0),C(C(W,W),W)))") == false
#guard isStandard (parse! "C(0,C(C(W_2,C(W,0)),0))") == false
#guard isStandard (parse! "C(C(C(0,W),C(W_3,W_2)),C(C(0,W_3),W_2))") == false
#guard isStandard (parse! "C(C(C(C(0,0),0),C(C(0,0),C(0,W))),0)") == false
#guard isStandard (parse! "C(0,C(C(W,W),C(C(W,C(W,0)),C(C(0,0),C(0,0)))))") == false
#guard isStandard (parse! "C(0,C(C(W,0),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(C(W,0),C(0,W)),C(C(W,0),C(W,W))),C(C(0,C(0,W)),0))") == false
#guard isStandard (parse! "C(W_2,W_2)") == true
#guard isStandard (parse! "C(W,W_2)") == true
#guard isStandard (parse! "C(C(0,C(0,W_2)),C(C(W_3,W_2),W))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(0,W_3)),C(C(0,0),C(0,0))),C(0,W)),C(0,W_3))") == false
#guard isStandard (parse! "C(0,C(W_2,C(C(0,0),C(W_2,W))))") == false
#guard isStandard (parse! "C(0,C(W_3,C(C(C(W_2,0),C(0,0)),C(0,C(0,0)))))") == false
#guard isStandard (parse! "C(0,C(0,W))") == true
#guard isStandard (parse! "C(C(C(0,0),C(0,W)),0)") == false
#guard isStandard (parse! "C(C(W_2,W),C(0,C(C(0,C(W_2,W_2)),0)))") == false
#guard isStandard (parse! "C(C(0,C(0,C(W_2,W))),C(C(C(0,0),C(0,0)),C(W,W_2)))") == false
#guard isStandard (parse! "C(C(C(0,0),W_3),C(0,W_2))") == false
#guard isStandard (parse! "C(C(C(0,W_2),C(W,0)),C(W_3,C(0,0)))") == false
#guard isStandard (parse! "C(0,C(W_2,C(C(0,0),C(0,0))))") == false
#guard isStandard (parse! "C(C(C(W,C(W,C(W,0))),C(W,W)),C(C(C(C(W,W),C(W,0)),C(W,0)),C(C(0,W),C(C(W,W),C(0,0)))))") == false
#guard isStandard (parse! "C(C(0,W),C(W_3,0))") == false
#guard isStandard (parse! "C(C(C(C(0,0),0),C(C(W_3,0),C(0,0))),C(W_2,0))") == false
#guard isStandard (parse! "C(C(C(W,0),C(C(0,0),C(0,W_2))),C(W_2,C(C(0,0),C(W_2,0))))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(0,0)),C(0,W_2)),0),C(0,W_2))") == false
#guard isStandard (parse! "C(C(C(C(W,W_2),C(W_2,W)),C(C(0,0),C(W_2,0))),0)") == false
#guard isStandard (parse! "C(C(C(C(W,0),0),0),C(C(C(0,0),W),C(W,C(0,W))))") == false
#guard isStandard (parse! "C(C(C(0,0),C(C(W,W),0)),C(C(C(C(0,0),C(W,0)),C(W,0)),0))") == false
#guard isStandard (parse! "C(C(C(C(W,W),0),C(C(C(0,0),W),C(C(0,W),C(0,W)))),0)") == false
#guard isStandard (parse! "C(W_3,C(C(C(C(0,0),W_3),C(C(W_3,W),0)),0))") == false
#guard isStandard (parse! "C(C(C(0,0),C(W,0)),C(C(0,W_3),C(0,W)))") == false
#guard isStandard (parse! "C(C(W,C(C(W,0),0)),C(C(C(0,0),0),W))") == false
#guard isStandard (parse! "C(C(C(C(0,C(0,W)),C(C(W,0),C(0,0))),C(C(0,0),C(0,C(W,W)))),C(C(C(C(W,0),W),C(C(W,0),C(W,0))),0))") == false
#guard isStandard (parse! "C(C(C(C(W_2,0),C(W_2,W_2)),C(C(0,W),C(0,0))),C(0,C(C(0,0),C(W_2,0))))") == false
#guard isStandard (parse! "C(0,W_3)") == true
#guard isStandard (parse! "C(C(C(W,C(C(0,0),0)),C(W_2,C(C(0,0),C(0,W_3)))),C(0,0))") == false
#guard isStandard (parse! "C(0,C(C(C(0,W),C(0,W)),0))") == false
#guard isStandard (parse! "C(C(C(0,0),C(0,0)),C(C(0,W_2),0))") == false
#guard isStandard (parse! "C(C(W_2,0),0)") == false
#guard isStandard (parse! "C(W,C(C(C(0,0),C(C(0,W),0)),C(0,W)))") == false
#guard isStandard (parse! "C(C(C(C(0,C(0,W_2)),C(0,C(0,W_2))),W),W)") == false
#guard isStandard (parse! "C(C(0,W),C(0,W_3))") == false
#guard isStandard (parse! "C(C(C(C(0,W_2),C(0,W)),0),C(C(C(0,W_2),W_2),W))") == false
#guard isStandard (parse! "C(C(W_3,C(W_2,C(W,W))),W_2)") == false
#guard isStandard (parse! "C(C(W,C(0,0)),C(C(C(W_2,W),W_3),C(C(0,0),C(0,0))))") == false
#guard isStandard (parse! "C(C(C(W,C(C(0,W),0)),W),C(W,W))") == false
#guard isStandard (parse! "C(W_3,0)") == false
#guard isStandard (parse! "C(W,C(C(W,0),C(0,0)))") == false
#guard isStandard (parse! "C(C(0,W_2),C(C(C(0,0),C(0,0)),0))") == false
#guard isStandard (parse! "C(C(W,W),C(C(0,0),C(C(0,W),C(W,0))))") == false
#guard isStandard (parse! "C(W_2,C(C(0,W),C(W,0)))") == false
#guard isStandard (parse! "C(C(C(C(C(0,W),C(0,0)),C(C(0,0),0)),C(C(C(W,W_2),W),C(C(0,W),C(0,W_2)))),C(C(C(C(W_2,W),C(0,0)),C(0,0)),0))") == false
#guard isStandard (parse! "C(W_2,W_3)") == true
#guard isStandard (parse! "C(C(0,0),C(W,W_2))") == true
#guard isStandard (parse! "C(C(C(C(W_2,W),C(W_3,0)),0),C(0,C(C(0,0),C(0,0))))") == false
#guard isStandard (parse! "C(C(W,C(C(0,0),0)),C(W,C(C(W,C(0,W)),C(W,C(W,0)))))") == false
#guard isStandard (parse! "C(C(C(0,W),C(W,C(C(W_2,0),0))),0)") == false
#guard isStandard (parse! "C(C(W,C(0,C(W,0))),C(C(C(W,0),C(0,0)),0))") == false
#guard isStandard (parse! "C(C(W,C(C(0,0),C(C(0,W),W))),C(C(W,C(C(W,0),C(W,W))),C(0,C(C(W,W),C(0,W)))))") == false
#guard isStandard (parse! "C(C(0,C(W_3,0)),C(0,0))") == false
#guard isStandard (parse! "C(0,C(C(C(W,W),C(0,0)),C(0,C(0,0))))") == false
#guard isStandard (parse! "C(0,C(C(0,W),C(W_3,0)))") == false
#guard isStandard (parse! "C(C(C(0,C(C(W_2,0),C(W_2,W))),C(C(0,0),C(C(0,W),C(0,0)))),C(0,C(0,0)))") == false
#guard isStandard (parse! "C(W,C(C(0,C(W,W)),W))") == true
#guard isStandard (parse! "C(C(W,W),C(0,0))") == false
#guard isStandard (parse! "C(C(0,W),C(C(0,W),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(W,0),0),C(C(0,0),0))") == false
#guard isStandard (parse! "C(C(0,C(C(0,0),C(0,W_2))),0)") == false
#guard isStandard (parse! "C(C(C(C(0,W_2),C(W_2,0)),C(C(0,W),C(0,W))),C(C(C(0,0),C(0,0)),C(C(W_2,W),C(W_2,0))))") == false
#guard isStandard (parse! "C(C(W,0),C(C(W,0),C(W,W)))") == true
#guard isStandard (parse! "C(C(W,0),C(W,0))") == true
#guard isStandard (parse! "C(W,C(C(0,C(W,C(0,W))),0))") == false
#guard isStandard (parse! "C(0,C(C(C(0,0),W),C(C(W,0),W)))") == false
#guard isStandard (parse! "C(C(0,W_3),C(W,W))") == false
#guard isStandard (parse! "C(C(C(C(C(W_2,W_2),C(W_2,0)),C(C(0,W_2),C(0,0))),0),C(C(0,0),C(C(C(W_2,W),C(0,W_2)),0)))") == false
#guard isStandard (parse! "C(C(0,C(0,C(W,W_2))),C(C(C(C(0,0),C(0,0)),C(C(0,0),C(0,W))),C(C(C(W_2,0),C(W_2,W)),C(C(W_2,0),W))))") == false
#guard isStandard (parse! "C(C(C(C(C(W,0),W),W),C(C(C(W,W),W),C(C(0,W),C(0,0)))),C(W,C(C(C(W,W),C(0,0)),C(C(0,W),C(0,W)))))") == false
#guard isStandard (parse! "C(C(C(C(W,0),C(W_2,W_2)),C(W_2,C(W_2,0))),C(0,0))") == false
#guard isStandard (parse! "C(C(C(0,0),C(W,W)),W)") == true
#guard isStandard (parse! "C(C(0,W_3),0)") == true
#guard isStandard (parse! "C(C(C(C(C(0,W),0),C(0,C(W,0))),C(C(C(0,0),C(0,0)),C(C(0,0),C(0,0)))),C(C(C(0,C(W,0)),C(C(0,W),C(W,W))),C(C(C(0,0),0),C(0,C(W,W)))))") == false
#guard isStandard (parse! "C(W_2,C(C(0,0),C(W_2,W_2)))") == false
#guard isStandard (parse! "C(W_3,W_3)") == true
#guard isStandard (parse! "C(C(C(C(C(0,0),C(W,0)),C(C(W,W),W)),C(C(C(W,0),W),C(0,C(W,0)))),C(C(W,C(W,C(0,W))),0))") == false
#guard isStandard (parse! "C(C(C(W,0),C(0,W)),C(C(0,0),C(W,0)))") == false
#guard isStandard (parse! "C(C(C(0,C(W,W)),C(C(0,W),C(0,0))),C(C(C(0,0),C(0,W)),C(0,C(0,0))))") == false
#guard isStandard (parse! "C(C(C(W,0),C(0,0)),C(0,0))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(0,C(W,W))),C(C(W,C(0,0)),C(0,W))),C(C(C(0,C(W,0)),W),W))") == false
#guard isStandard (parse! "C(C(C(C(C(W,0),0),0),C(0,C(C(0,0),C(0,0)))),W)") == false
#guard isStandard (parse! "C(0,C(0,C(0,W_3)))") == true
#guard isStandard (parse! "C(C(C(0,0),C(0,0)),W_2)") == false
#guard isStandard (parse! "C(C(C(C(W_2,0),C(0,W)),C(C(0,0),C(W_3,0))),0)") == false
#guard isStandard (parse! "C(C(C(W_2,C(0,0)),0),C(C(C(C(W,W_2),W),C(0,C(W_2,0))),C(0,C(0,C(W_2,W)))))") == false
#guard isStandard (parse! "C(C(0,C(C(C(0,0),C(0,0)),C(C(0,0),C(W,0)))),C(C(C(C(W_2,W_2),C(0,0)),W_2),W))") == false
#guard isStandard (parse! "C(W_3,C(C(C(0,0),C(0,W)),C(C(0,W_2),0)))") == false
#guard isStandard (parse! "C(W,C(C(0,0),0))") == false
#guard isStandard (parse! "C(0,C(C(C(C(W,W),C(0,0)),0),C(0,C(C(W,0),W))))") == false
#guard isStandard (parse! "C(C(C(W_2,C(C(W,0),C(0,W_2))),C(0,C(C(W_2,W),C(0,0)))),C(0,C(C(C(W,W),C(0,0)),C(C(0,0),C(0,W)))))") == false
#guard isStandard (parse! "C(C(C(0,W),C(W,0)),C(C(0,0),C(W,0)))") == false
#guard isStandard (parse! "C(W_3,C(C(0,C(C(W,0),C(0,W_3))),0))") == false
#guard isStandard (parse! "C(C(W_2,C(C(W_2,W_2),C(0,0))),C(C(0,W_2),C(C(0,W_3),C(0,W_2))))") == false
#guard isStandard (parse! "C(C(C(C(C(0,W_2),C(0,0)),C(C(W_2,0),C(0,W_2))),C(C(C(0,0),C(W,0)),C(C(0,0),C(W_2,W_2)))),0)") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(0,W)),C(C(0,0),0)),C(C(C(W,0),C(0,W)),0)),C(0,C(C(C(W,W),0),C(W,0))))") == false
#guard isStandard (parse! "C(W,C(C(C(C(0,W_2),C(0,W_2)),C(C(0,W),C(W_2,0))),C(C(C(W,0),C(W,0)),C(0,C(W,0)))))") == false
#guard isStandard (parse! "C(W_3,W)") == false
#guard isStandard (parse! "C(C(C(W,C(W,W_2)),C(C(W_2,0),C(W_2,0))),C(C(C(W_2,W),C(0,W_2)),C(C(W_2,0),0)))") == false
#guard isStandard (parse! "C(0,C(C(W,W),C(0,W)))") == false
#guard isStandard (parse! "C(0,C(C(W,0),W))") == true
#guard isStandard (parse! "C(C(W,0),C(0,W))") == false
#guard isStandard (parse! "C(C(C(C(0,W_2),C(0,0)),C(C(0,0),C(0,0))),C(C(W,C(0,0)),C(C(W,0),0)))") == false
#guard isStandard (parse! "C(C(W_2,C(0,W)),C(W_2,C(0,0)))") == false
#guard isStandard (parse! "C(C(W,W_3),0)") == true
#guard isStandard (parse! "C(C(C(C(W_2,0),C(W,W_2)),C(C(0,W),C(W,0))),0)") == false
#guard isStandard (parse! "C(W,C(C(C(0,C(0,0)),C(C(W,0),W)),0))") == true
#guard isStandard (parse! "C(C(C(C(W,0),C(C(0,0),0)),0),W)") == false
#guard isStandard (parse! "C(W,C(0,W))") == false
#guard isStandard (parse! "C(C(C(C(C(W,0),C(0,W)),C(0,C(0,0))),W),C(C(C(C(W,0),C(W,W)),0),W))") == false
#guard isStandard (parse! "C(C(W_2,C(C(C(0,0),0),C(C(W,W),C(0,0)))),C(C(C(C(0,W_3),W),C(C(W_2,W),C(0,0))),C(W_2,0)))") == false
#guard isStandard (parse! "C(0,C(C(C(C(W_3,0),C(W_3,W)),C(C(W_3,0),C(0,0))),C(0,C(C(0,0),C(0,0)))))") == false
#guard isStandard (parse! "C(C(C(C(C(W_2,0),C(W,0)),C(0,C(0,0))),C(C(C(0,W_2),C(0,0)),C(W_2,C(W_2,0)))),C(C(C(C(W_2,W_2),C(0,0)),W_2),C(0,C(C(W_2,0),C(0,0)))))") == false
#guard isStandard (parse! "C(C(0,W_2),C(W_2,0))") == false
#guard isStandard (parse! "C(C(C(W_2,C(C(W_2,W_2),0)),C(C(C(0,0),W_2),C(0,W_2))),C(C(0,0),C(C(0,C(W_2,W)),W_2)))") == false
#guard isStandard (parse! "C(C(C(W,W),0),C(C(C(0,0),C(0,0)),0))") == false
#guard isStandard (parse! "C(C(0,C(C(W,0),C(0,0))),0)") == false
#guard isStandard (parse! "C(C(C(W_3,C(0,0)),0),C(C(W_2,C(W_2,0)),W_3))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(0,0)),C(W_2,0)),C(C(C(0,W_2),0),0)),0)") == false
#guard isStandard (parse! "C(C(C(C(W,0),C(W_2,W_2)),C(W_2,C(0,0))),C(0,0))") == false
#guard isStandard (parse! "C(C(0,0),C(C(0,W_2),C(W_2,W_2)))") == false
#guard isStandard (parse! "C(C(0,C(W,0)),C(C(0,W),C(0,W)))") == false
#guard isStandard (parse! "C(C(C(C(W,0),C(0,0)),C(C(W_2,0),0)),C(W,C(C(0,W_2),C(W_2,0))))") == false
#guard isStandard (parse! "C(C(C(W,C(W,0)),C(C(0,0),C(W,W))),C(C(C(0,W),C(W,W)),0))") == false
#guard isStandard (parse! "C(C(C(0,W_2),C(0,W_2)),C(C(0,W_2),C(0,W_3)))") == false
#guard isStandard (parse! "C(C(0,C(0,0)),C(C(0,C(W,0)),C(C(0,W),W)))") == true
#guard isStandard (parse! "C(W_2,C(C(C(0,0),W_2),C(C(0,W),C(W,0))))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(0,0)),C(0,C(W,W))),C(C(W,0),C(C(0,0),C(W,0))))") == false
#guard isStandard (parse! "C(C(0,C(0,0)),C(C(W_3,0),C(W_2,0)))") == false
#guard isStandard (parse! "C(0,C(C(0,W_2),W))") == false
#guard isStandard (parse! "C(C(C(W,0),0),C(W,C(0,0)))") == false
#guard isStandard (parse! "C(C(C(C(0,W_2),W_2),C(W,C(0,0))),C(C(C(W_2,W),0),0))") == false
#guard isStandard (parse! "C(C(C(C(W_2,W_2),W_2),C(C(0,W_2),C(0,W_2))),C(0,C(C(0,W),C(0,0))))") == false
#guard isStandard (parse! "C(C(C(C(C(W,0),C(0,W)),0),C(C(C(0,W),C(W,0)),C(C(W,0),C(0,0)))),C(C(C(C(0,0),W),0),W))") == false
#guard isStandard (parse! "C(C(W,C(C(W,C(0,0)),0)),C(C(C(W,C(W,W)),C(C(W,W),C(0,0))),C(0,0)))") == false
#guard isStandard (parse! "C(C(0,C(C(0,0),C(C(0,W),C(W,W)))),C(C(W,C(C(W,0),C(0,W))),C(C(C(0,W),0),C(0,W))))") == false
#guard isStandard (parse! "C(C(C(C(C(W_2,0),C(0,0)),C(C(W_2,0),C(W_2,W_2))),C(C(W,C(W,W)),C(W_2,0))),W)") == false
#guard isStandard (parse! "C(0,C(C(0,0),C(0,W)))") == false
#guard isStandard (parse! "C(C(C(C(W_2,W_3),C(0,0)),C(C(0,0),C(W,W))),W)") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(W,0)),W),C(W,0))") == false
#guard isStandard (parse! "C(W,C(C(C(0,0),C(0,0)),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(W,0),W),C(0,0))") == false
#guard isStandard (parse! "C(C(0,C(W,C(W,0))),W)") == true
#guard isStandard (parse! "C(C(C(0,W_2),W),W)") == false
#guard isStandard (parse! "C(C(C(C(0,W),C(C(0,W),0)),0),C(C(W,0),C(C(C(0,W),C(W,W)),0)))") == false
#guard isStandard (parse! "C(C(W_3,W),C(0,0))") == false
#guard isStandard (parse! "C(C(C(C(0,W_2),C(0,W_2)),C(C(0,W_2),C(0,W_2))),0)") == false
#guard isStandard (parse! "C(C(0,C(W_3,0)),C(C(0,0),C(W,W_2)))") == false
#guard isStandard (parse! "C(C(C(W_2,W),C(0,W_2)),C(0,W))") == false
#guard isStandard (parse! "C(C(C(C(W_2,0),C(0,W)),C(0,0)),C(C(C(0,0),W_3),0))") == false
#guard isStandard (parse! "C(W_2,C(W,W_2))") == false
#guard isStandard (parse! "C(C(C(W,W),0),C(0,0))") == false
#guard isStandard (parse! "C(C(W,W),C(C(W,W_2),C(0,W_2)))") == false
#guard isStandard (parse! "C(C(0,0),C(C(C(0,W_2),C(0,0)),C(C(W,W),W)))") == false
#guard isStandard (parse! "C(C(C(0,C(W,0)),0),0)") == false
#guard isStandard (parse! "C(0,C(W_3,W))") == false
#guard isStandard (parse! "C(0,C(W_2,W))") == true
#guard isStandard (parse! "C(C(C(0,C(C(W,0),W)),W_2),C(C(0,0),C(C(W_2,C(W,0)),C(C(W_3,W_2),C(W_3,0)))))") == false
#guard isStandard (parse! "C(C(C(W_2,C(0,W)),C(W,C(W_3,0))),C(C(C(W_2,W_2),C(0,W_2)),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(C(W_3,W_2),C(0,W_3)),C(W,C(0,W_2))),0)") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(0,W)),C(C(W_2,W),0)),C(C(C(W,0),W),0)),0)") == false
#guard isStandard (parse! "C(C(C(0,C(C(W_2,0),C(W_2,0))),C(W,0)),C(C(W,C(0,C(0,0))),C(0,W)))") == false
#guard isStandard (parse! "C(C(C(C(W,0),C(W,W)),C(C(W,W),0)),C(C(C(W,W),C(W,0)),C(C(W,W),C(0,0))))") == false
#guard isStandard (parse! "C(C(C(0,C(0,0)),C(0,C(W_3,W_2))),C(C(C(0,W_3),0),W))") == false
#guard isStandard (parse! "C(C(C(0,C(0,C(W,0))),C(C(C(0,0),C(W_2,0)),C(C(W,0),C(0,W_2)))),0)") == false
#guard isStandard (parse! "C(W_2,C(0,0))") == false
#guard isStandard (parse! "C(C(0,C(W,W)),C(C(W,0),C(W,0)))") == false
#guard isStandard (parse! "C(0,C(C(0,0),C(W_2,0)))") == false
#guard isStandard (parse! "C(C(W,0),0)") == false
#guard isStandard (parse! "C(C(0,C(0,W_3)),C(C(0,0),C(W_3,0)))") == false
#guard isStandard (parse! "C(C(W,0),W)") == true
#guard isStandard (parse! "C(C(C(C(0,0),C(W,0)),C(W_3,C(W,0))),W_3)") == false
#guard isStandard (parse! "C(C(C(W_2,0),C(0,0)),C(C(W,0),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(C(W,0),C(W,0)),C(W,C(0,0))),C(C(C(W,0),C(0,W)),C(0,C(0,0))))") == false
#guard isStandard (parse! "C(C(C(C(C(W_2,0),0),0),C(C(0,C(W_2,0)),W_2)),0)") == false
#guard isStandard (parse! "C(0,C(0,C(C(C(W_2,W_2),0),C(0,W))))") == false
#guard isStandard (parse! "C(C(W_3,C(0,0)),C(W,0))") == false
#guard isStandard (parse! "C(C(C(C(W_2,0),C(C(0,W),C(W_3,W_2))),W_2),0)") == false
#guard isStandard (parse! "C(0,C(0,C(0,C(C(W_3,0),0))))") == false
#guard isStandard (parse! "C(C(C(0,C(0,W)),C(C(C(0,0),C(W,0)),C(C(0,0),C(W,0)))),0)") == false
#guard isStandard (parse! "C(C(C(C(W,0),C(0,0)),C(C(0,0),C(W,0))),W)") == false
#guard isStandard (parse! "C(C(C(W_2,C(C(0,0),0)),C(W_2,0)),C(C(C(C(W,0),C(W_2,W_2)),C(C(0,0),C(W_2,W_3))),C(0,C(0,C(W,W_2)))))") == false
#guard isStandard (parse! "C(W,C(W,C(C(C(0,W),C(0,W)),C(C(W,W),C(0,0)))))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(0,0)),C(C(W,W_2),C(0,0))),C(C(C(0,W),0),W_2))") == false
#guard isStandard (parse! "C(C(W,0),C(0,C(C(W_2,0),C(0,0))))") == false
#guard isStandard (parse! "C(0,C(C(C(C(0,W),C(W,W)),C(C(W,W),0)),C(C(C(0,0),C(0,0)),0)))") == false
#guard isStandard (parse! "C(C(W_2,C(C(0,0),C(W,0))),C(C(C(0,W_2),0),C(C(W_2,W_3),C(0,0))))") == false
#guard isStandard (parse! "C(C(W_2,W),C(0,0))") == false
#guard isStandard (parse! "C(C(C(0,0),C(0,0)),0)") == false
#guard isStandard (parse! "C(C(C(0,0),C(W,W_3)),0)") == true
#guard isStandard (parse! "C(C(W_2,C(W_2,0)),C(C(0,C(C(0,0),C(0,0))),0))") == false
#guard isStandard (parse! "C(C(W,W_2),C(0,W_2))") == false
#guard isStandard (parse! "C(C(C(0,W),W_2),C(W_3,C(0,W_2)))") == false
#guard isStandard (parse! "C(C(C(C(W,W_2),C(0,0)),C(C(W,0),C(0,0))),C(C(W,C(W,0)),0))") == false
#guard isStandard (parse! "C(C(C(C(C(0,W),0),C(C(0,W),C(W,0))),C(0,C(C(W,0),C(0,W)))),C(C(C(0,C(0,0)),C(C(0,W),C(0,0))),0))") == false
#guard isStandard (parse! "C(C(C(0,0),C(0,W)),C(C(0,W_3),C(W_2,0)))") == false
#guard isStandard (parse! "C(0,C(C(W,W),C(W,0)))") == false
#guard isStandard (parse! "C(C(W,C(W_2,0)),C(0,0))") == false
#guard isStandard (parse! "C(C(C(C(C(W_2,W_2),C(W_2,0)),C(C(W_2,W_2),C(0,W_2))),C(C(C(W_2,0),C(0,W_2)),C(C(0,0),C(W_2,W_2)))),W)") == false
#guard isStandard (parse! "C(C(C(C(C(W,W_2),0),C(0,W_2)),C(C(C(W_3,W),C(W_2,0)),C(C(0,0),0))),C(C(C(0,C(0,0)),C(C(W_3,W_3),C(W_3,0))),0))") == false
#guard isStandard (parse! "C(C(C(C(C(W,W_3),0),0),C(C(0,C(W,0)),C(W_3,C(W_3,0)))),C(W,C(C(C(0,0),C(W_3,0)),C(0,W))))") == false
#guard isStandard (parse! "C(W_2,C(W_3,0))") == false
#guard isStandard (parse! "C(C(C(C(W_2,0),0),W),C(C(C(0,0),W_2),C(C(0,0),C(0,W_2))))") == false
#guard isStandard (parse! "C(C(C(C(0,W),C(W,W)),C(C(W_2,W),C(W_2,W_2))),C(C(C(0,0),C(W,W)),W_2))") == false
#guard isStandard (parse! "C(C(C(0,0),C(W,0)),C(C(0,0),C(W,0)))") == false
#guard isStandard (parse! "C(0,C(C(W_2,W),C(W_3,0)))") == false
#guard isStandard (parse! "C(C(C(0,W_2),C(0,W)),C(C(0,0),C(0,W)))") == false
#guard isStandard (parse! "C(C(C(0,C(0,W)),C(0,0)),C(C(C(W,0),C(W_2,0)),W_2))") == false
#guard isStandard (parse! "C(C(C(0,0),W),0)") == true
#guard isStandard (parse! "C(C(C(C(0,0),C(W,0)),W),C(C(W,0),C(C(0,0),W)))") == false
#guard isStandard (parse! "C(C(C(C(W,W),C(0,W)),C(C(W,0),W)),C(C(0,C(0,0)),C(C(0,W),C(W,0))))") == false
#guard isStandard (parse! "C(C(C(C(C(0,W),0),C(C(W,0),C(0,0))),C(C(C(W,0),C(0,0)),C(C(0,0),0))),C(0,C(C(C(0,0),0),C(C(W,0),W))))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(0,0)),C(C(0,W),C(0,0))),C(C(C(0,0),0),W))") == false
#guard isStandard (parse! "C(C(C(0,W),W),C(0,C(0,W)))") == false
#guard isStandard (parse! "C(C(C(0,C(C(0,0),C(0,0))),C(C(W,0),0)),0)") == false
#guard isStandard (parse! "C(C(C(W_3,0),C(0,0)),W)") == false
#guard isStandard (parse! "C(C(C(W,0),C(0,W)),C(0,C(0,0)))") == false
#guard isStandard (parse! "C(0,C(C(C(W,0),C(W,0)),C(0,0)))") == false
#guard isStandard (parse! "C(0,C(C(C(0,W_2),C(0,W)),C(C(0,0),C(0,W))))") == false
#guard isStandard (parse! "C(C(C(0,W),C(0,0)),W_2)") == false
#guard isStandard (parse! "C(C(0,W_2),C(C(C(0,0),C(C(0,W_2),0)),0))") == false
#guard isStandard (parse! "C(C(C(0,0),C(0,0)),C(C(0,0),W))") == false
#guard isStandard (parse! "C(C(C(C(0,C(0,W)),C(0,0)),C(0,C(C(W,0),0))),C(C(C(C(0,W),C(0,0)),C(0,C(W,W))),C(C(C(0,0),C(0,0)),C(C(W,0),C(0,W)))))") == false
#guard isStandard (parse! "C(C(0,0),C(W,W))") == true
#guard isStandard (parse! "C(C(W,C(C(W_2,C(0,0)),W)),0)") == false
#guard isStandard (parse! "C(C(C(0,W_3),C(W,0)),C(C(0,W_2),C(W,W)))") == false
#guard isStandard (parse! "C(W,C(W,C(W,C(0,W))))") == false
#guard isStandard (parse! "C(C(C(C(W,C(0,W)),C(C(W,0),C(0,W))),C(C(C(0,0),W),C(W,C(0,W)))),0)") == false
#guard isStandard (parse! "C(C(C(C(C(0,W_2),W_2),C(W_2,C(0,0))),C(C(C(W_2,0),W),C(C(0,0),C(W,0)))),C(C(C(C(0,W),W_2),C(C(W_2,0),C(0,W_2))),C(C(C(0,W_2),C(0,0)),C(C(0,0),0))))") == false
#guard isStandard (parse! "C(C(W,0),C(C(0,C(C(W_3,W),W_3)),C(0,W)))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(W,0)),0),0)") == false
#guard isStandard (parse! "C(0,C(C(W_2,C(C(0,W_2),C(0,W_2))),C(C(C(0,0),0),W)))") == false
#guard isStandard (parse! "C(0,C(C(0,0),C(W,C(C(0,0),C(0,0)))))") == false
#guard isStandard (parse! "C(0,C(0,C(0,C(0,W))))") == true
#guard isStandard (parse! "C(C(C(W,0),0),C(C(W_2,W_2),W_2))") == false
#guard isStandard (parse! "C(C(W,C(C(0,C(0,W)),C(0,C(0,0)))),C(C(C(0,0),C(C(W_2,0),C(W,0))),C(C(C(0,W),W),W_2)))") == false
#guard isStandard (parse! "C(C(C(W,C(W,W)),C(C(C(0,0),C(0,0)),C(C(W,0),C(0,0)))),0)") == false
#guard isStandard (parse! "C(C(C(0,C(C(0,0),C(0,W))),C(C(W,0),C(C(0,W),C(W,0)))),C(C(0,C(W,0)),C(W,0)))") == false
#guard isStandard (parse! "C(C(C(0,0),W_2),W_3)") == true
#guard isStandard (parse! "C(C(C(0,C(0,W)),C(C(W,W),C(0,W))),C(C(C(W,W),0),W))") == false
#guard isStandard (parse! "C(C(C(C(W,W),C(0,0)),0),W)") == false
#guard isStandard (parse! "C(C(C(C(W_3,0),C(W,W_2)),C(C(W,0),W_2)),C(0,C(W,C(W_3,0))))") == false
#guard isStandard (parse! "C(C(W,C(C(C(0,0),C(0,0)),C(C(W,0),0))),C(0,C(W,C(C(W,W),C(0,0)))))") == false
#guard isStandard (parse! "C(C(W,W),W)") == true
#guard isStandard (parse! "C(C(W,0),C(0,0))") == false
#guard isStandard (parse! "C(C(W,W),C(0,W))") == false
#guard isStandard (parse! "C(C(C(C(0,0),0),C(C(0,0),C(W,W))),W_2)") == false
#guard isStandard (parse! "C(C(C(C(0,0),0),C(C(0,0),C(W,0))),W)") == false
#guard isStandard (parse! "C(C(W,W_3),C(0,0))") == false
#guard isStandard (parse! "C(C(C(W,0),C(0,C(W_2,C(W,W)))),C(C(C(C(W_2,0),C(0,0)),C(0,0)),W_2))") == false
#guard isStandard (parse! "C(C(C(0,W_2),C(0,W_2)),0)") == false
#guard isStandard (parse! "C(C(C(0,0),C(W,W_2)),C(W_2,C(W_2,0)))") == false
#guard isStandard (parse! "C(C(0,W_2),C(W,0))") == false
#guard isStandard (parse! "C(C(0,0),C(C(C(C(W_2,0),C(0,0)),W_3),0))") == false
#guard isStandard (parse! "C(C(0,C(0,0)),C(C(0,W),C(0,W)))") == false
#guard isStandard (parse! "C(C(C(0,0),W_2),W_2)") == true
#guard isStandard (parse! "C(C(0,C(C(0,0),W)),C(C(C(0,0),C(W_2,0)),C(C(W_2,0),C(0,0))))") == false
#guard isStandard (parse! "C(C(W,W_2),C(0,0))") == false
#guard isStandard (parse! "C(C(C(C(0,W_2),C(0,0)),C(C(0,0),0)),C(C(C(0,W),C(0,W_3)),C(0,C(0,W_3))))") == false
#guard isStandard (parse! "C(C(C(C(C(W_2,0),C(0,0)),0),C(0,C(C(0,0),C(0,0)))),W_3)") == false
#guard isStandard (parse! "C(C(C(C(0,W),C(W,0)),C(C(W,0),C(W,W))),W)") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(W_2,0)),C(W_3,C(0,0))),0),0)") == false
#guard isStandard (parse! "C(C(0,W),W_2)") == true
#guard isStandard (parse! "C(W,C(C(0,W),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),W_2),C(C(0,0),W)),0),C(C(W,0),C(C(C(W,0),0),C(W,W))))") == false
#guard isStandard (parse! "C(0,C(W_2,0))") == false
#guard isStandard (parse! "C(C(0,C(0,0)),0)") == true
#guard isStandard (parse! "C(C(0,W_3),C(0,W_3))") == false
#guard isStandard (parse! "C(C(C(C(0,W),C(0,0)),C(0,W_2)),C(C(C(W,0),C(W,0)),C(C(0,W_2),0)))") == false
#guard isStandard (parse! "C(C(W_2,W_2),0)") == true
#guard isStandard (parse! "C(C(0,C(W,0)),C(C(0,W_3),0))") == true
#guard isStandard (parse! "C(C(0,C(0,C(0,0))),C(C(C(W_2,0),W),C(0,C(W,0))))") == false
#guard isStandard (parse! "C(C(0,C(C(C(W_2,0),C(0,0)),C(C(W,0),C(W_2,0)))),C(C(C(W_2,C(0,0)),0),0))") == false
#guard isStandard (parse! "C(C(C(C(0,C(0,W)),C(C(0,0),C(W,W))),C(C(C(W,0),C(W,W)),C(C(0,W),C(0,0)))),C(C(C(C(0,0),0),C(0,C(0,0))),C(C(C(0,0),C(0,0)),C(C(0,W),W))))") == false
#guard isStandard (parse! "C(C(0,W),C(W_2,W_2))") == true
#guard isStandard (parse! "C(C(C(C(0,0),C(0,0)),C(C(0,W_2),C(W,0))),C(C(C(W,0),0),C(W,0)))") == false
#guard isStandard (parse! "C(C(C(0,C(0,0)),C(0,0)),C(C(W,C(0,0)),C(C(0,0),C(W,0))))") == false
#guard isStandard (parse! "C(C(C(C(C(0,W),C(W,0)),C(C(0,0),C(W_3,W_3))),C(C(C(W_3,0),C(0,W_3)),W_2)),C(C(C(W,C(0,0)),C(C(0,0),W)),C(C(C(0,0),0),C(0,W_2))))") == false
#guard isStandard (parse! "C(C(C(W,W),0),C(C(0,W),C(W,0)))") == false
#guard isStandard (parse! "C(C(C(0,0),C(W,W_2)),C(C(W_3,W_2),C(0,0)))") == false
#guard isStandard (parse! "C(W,C(C(C(C(0,0),W),C(0,W)),W))") == false
#guard isStandard (parse! "C(C(C(C(C(W,0),0),C(C(W,0),0)),W),W)") == false
#guard isStandard (parse! "C(C(W,C(C(0,0),0)),W)") == false
#guard isStandard (parse! "C(0,C(W,C(C(W_2,W_2),0)))") == true
#guard isStandard (parse! "C(C(0,C(W,0)),C(0,C(0,0)))") == false
#guard isStandard (parse! "C(C(C(0,0),C(0,0)),C(C(0,0),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(C(W,W_3),C(W_3,0)),C(0,0)),W_3)") == false
#guard isStandard (parse! "C(C(C(C(W,C(W,0)),C(C(W,W),C(W,0))),0),0)") == false
#guard isStandard (parse! "C(0,C(C(W_3,W_3),C(C(0,0),C(0,W_2))))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(W_2,0)),0),C(W,C(0,W)))") == false
#guard isStandard (parse! "C(C(0,C(W_2,W_2)),C(0,W_2))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),W),C(W,C(W,0))),C(C(C(W,0),C(0,W)),C(C(W,0),C(0,W)))),0)") == false
#guard isStandard (parse! "C(C(C(0,0),C(0,0)),C(C(0,W),C(0,W)))") == false
#guard isStandard (parse! "C(W,C(C(0,C(0,0)),C(C(W,0),W)))") == false
#guard isStandard (parse! "C(C(0,C(W,0)),C(C(0,W),C(W,W)))") == false
#guard isStandard (parse! "C(0,C(C(0,C(C(0,W),C(W,W))),W))") == false
#guard isStandard (parse! "C(C(0,0),C(C(W_2,0),W))") == false
#guard isStandard (parse! "C(W_3,C(C(C(W,C(0,0)),C(0,0)),C(0,C(C(0,0),0))))") == false
#guard isStandard (parse! "C(C(C(W_2,W_2),C(W_2,0)),C(C(0,0),C(0,0)))") == false
#guard isStandard (parse! "C(C(W_2,C(C(W_2,0),C(0,0))),C(C(C(0,0),0),C(C(0,0),C(0,0))))") == false
#guard isStandard (parse! "C(0,C(C(W,0),C(0,W_3)))") == false
#guard isStandard (parse! "C(C(C(W,C(0,W)),0),C(C(C(0,W),0),W_2))") == false
#guard isStandard (parse! "C(W_2,C(C(0,0),C(W,W)))") == false
#guard isStandard (parse! "C(C(C(C(W,W_2),0),C(0,W)),0)") == false
#guard isStandard (parse! "C(C(W,0),C(W_2,W))") == true
#guard isStandard (parse! "C(C(0,C(0,0)),C(0,W_2))") == false
#guard isStandard (parse! "C(C(C(C(W_3,0),0),W),C(C(C(0,W_3),W_2),W_3))") == false
#guard isStandard (parse! "C(C(0,C(0,C(C(W,W),0))),C(0,C(C(0,W_2),0)))") == false
#guard isStandard (parse! "C(C(C(C(0,W_3),C(W_3,W)),C(C(0,0),C(0,W_3))),C(W_2,C(C(W_2,0),0)))") == false
#guard isStandard (parse! "C(C(C(0,W),0),C(C(0,0),0))") == false
#guard isStandard (parse! "C(C(0,W),C(W,0))") == false
#guard isStandard (parse! "C(0,C(C(C(0,C(0,0)),C(C(0,0),C(0,0))),C(C(0,C(W,0)),C(C(0,W),C(0,0)))))") == false
#guard isStandard (parse! "C(C(C(W_2,W_3),C(W,0)),W_3)") == false
#guard isStandard (parse! "C(C(W_2,W_2),C(0,W))") == false
#guard isStandard (parse! "C(C(C(C(W,W),C(0,0)),C(C(W_2,0),C(0,W_2))),C(W_2,0))") == false
#guard isStandard (parse! "C(C(C(C(0,0),0),C(C(0,0),C(0,0))),W)") == false
#guard isStandard (parse! "C(C(C(W,0),C(0,W)),C(W,0))") == false
#guard isStandard (parse! "C(C(W_3,C(C(C(0,0),C(W_2,0)),0)),C(C(C(C(0,0),0),W_3),C(C(C(0,0),C(0,W)),C(0,C(W_2,0)))))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(0,0)),C(C(0,0),C(0,W))),0),C(C(C(C(0,0),C(0,W)),C(C(W_2,0),C(0,0))),C(C(0,W),0)))") == false
#guard isStandard (parse! "C(C(C(0,W),W_2),C(W,C(W,0)))") == false
#guard isStandard (parse! "C(C(0,C(W,C(W,C(W,0)))),0)") == false
#guard isStandard (parse! "C(C(C(W_3,C(0,W_2)),C(C(W_2,0),C(0,0))),C(0,C(C(0,0),C(0,0))))") == false
#guard isStandard (parse! "C(C(C(W_3,0),C(0,0)),C(C(W_3,0),C(0,0)))") == false
#guard isStandard (parse! "C(C(0,C(0,0)),C(C(C(0,0),0),C(C(W_2,W_2),C(0,W_2))))") == false
#guard isStandard (parse! "C(C(C(C(C(W_2,W_3),W),W_2),C(C(C(W,W_3),C(0,W_2)),0)),C(C(C(C(W_3,0),C(0,0)),C(C(0,0),C(0,0))),C(C(C(0,0),C(0,0)),0)))") == false
#guard isStandard (parse! "C(C(C(W_3,W_3),C(W,0)),C(C(0,0),C(0,W_2)))") == false
#guard isStandard (parse! "C(0,C(C(0,0),C(W,0)))") == true
#guard isStandard (parse! "C(0,C(C(C(C(W_2,W),0),C(0,0)),C(C(W_2,C(W_2,0)),C(C(W,W_2),W))))") == false
#guard isStandard (parse! "C(C(C(0,W),C(0,0)),0)") == false
#guard isStandard (parse! "C(W_3,C(0,C(C(C(W_2,W),C(W_3,W_3)),C(C(0,W_3),0))))") == false
#guard isStandard (parse! "C(C(W,C(0,0)),C(C(0,0),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(W,0),C(W,0)),C(C(0,0),C(0,0)))") == false
#guard isStandard (parse! "C(W,C(W,W))") == true
#guard isStandard (parse! "C(C(W,0),C(W_2,0))") == false
#guard isStandard (parse! "C(C(C(C(W,0),C(W,0)),0),C(C(C(0,0),C(0,0)),C(C(0,0),0)))") == false
#guard isStandard (parse! "C(C(W_2,C(0,0)),C(C(C(W_3,0),C(W_2,0)),C(0,0)))") == false
#guard isStandard (parse! "C(C(W_3,0),C(0,0))") == false
#guard isStandard (parse! "C(C(C(C(C(0,W),C(0,0)),0),C(0,C(0,C(0,0)))),0)") == false
#guard isStandard (parse! "C(C(C(W,0),C(0,0)),0)") == false
#guard isStandard (parse! "C(C(C(0,0),C(W,W_2)),C(W_3,C(0,0)))") == false
#guard isStandard (parse! "C(C(W_2,W_3),0)") == true
#guard isStandard (parse! "C(C(C(0,C(C(W_2,0),C(0,W_2))),C(0,0)),0)") == false
#guard isStandard (parse! "C(C(0,0),C(W,C(C(C(W,0),W),C(C(W,W),C(W,0)))))") == false
#guard isStandard (parse! "C(C(0,C(C(0,0),0)),W)") == true
#guard isStandard (parse! "C(C(C(C(W,0),C(W,W_2)),C(0,W_2)),C(W_2,0))") == false
#guard isStandard (parse! "C(C(C(0,C(0,0)),C(W,C(0,W_2))),C(C(C(W,W_3),C(W_3,0)),C(W,W_3)))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(W,W)),C(C(0,0),C(0,W))),0)") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(W_2,W_2)),C(0,C(0,0))),C(W_2,C(C(W,0),0))),0)") == false
#guard isStandard (parse! "C(C(W_3,W_3),C(0,W_2))") == false
#guard isStandard (parse! "C(W_2,C(W,W))") == false
#guard isStandard (parse! "C(C(W_2,C(C(W,C(0,W_3)),C(C(W_2,0),C(W_3,W)))),C(C(0,C(C(0,0),C(W_3,W_3))),C(C(C(0,0),C(0,W)),C(C(W,W),C(0,0)))))") == false
#guard isStandard (parse! "C(C(C(W_2,0),C(C(C(W_3,0),C(W_3,0)),C(C(0,0),0))),C(C(C(C(0,W_2),C(W_3,W_3)),W),C(C(C(W_2,W_3),W),C(0,0))))") == false
#guard isStandard (parse! "C(C(W,W),C(C(W,C(C(0,0),0)),C(C(C(W,0),C(W,W)),C(W,C(W,W)))))") == false
#guard isStandard (parse! "C(0,C(0,C(W_2,0)))") == false
#guard isStandard (parse! "C(0,C(W,C(W,W)))") == true
#guard isStandard (parse! "C(C(C(W,C(W,0)),0),C(W,C(C(W,W),0)))") == false
#guard isStandard (parse! "C(C(C(C(W,0),0),0),C(C(C(0,0),C(0,W)),C(0,0)))") == false
#guard isStandard (parse! "C(W,C(C(0,W),C(W,W)))") == false
#guard isStandard (parse! "C(0,C(C(0,0),W))") == true
#guard isStandard (parse! "C(W,C(C(C(C(W,W),C(W,W)),C(0,C(0,0))),C(C(C(W,0),C(W,W)),C(W,C(0,0)))))") == false
#guard isStandard (parse! "C(C(C(C(C(W_2,0),W),C(C(0,0),C(0,W_3))),C(C(C(0,0),0),C(C(0,0),0))),W_3)") == false
#guard isStandard (parse! "C(C(C(W,W),C(W,0)),0)") == false
#guard isStandard (parse! "C(C(W_3,C(C(C(0,0),C(0,W_3)),C(0,C(0,0)))),C(C(C(C(0,0),0),C(C(0,0),C(0,W))),W))") == false
#guard isStandard (parse! "C(C(C(C(0,0),0),C(C(0,W),C(0,W_3))),W)") == false
#guard isStandard (parse! "C(C(C(W,0),C(0,0)),W_2)") == false
#guard isStandard (parse! "C(C(C(0,C(W_2,0)),C(0,C(0,W_3))),0)") == false
#guard isStandard (parse! "C(C(W,C(C(C(0,0),W),W)),C(0,W))") == false
#guard isStandard (parse! "C(C(C(C(W,W),C(0,0)),C(C(0,W),C(0,0))),W)") == false
#guard isStandard (parse! "C(C(C(W,0),C(W,0)),C(0,W))") == false
#guard isStandard (parse! "C(C(W_2,0),C(W_2,W_3))") == false
#guard isStandard (parse! "C(C(W_2,0),C(0,W))") == false
#guard isStandard (parse! "C(C(W,W_2),C(C(W_2,W),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(C(0,0),0),W_2),C(C(C(W_2,0),0),C(C(0,W),C(W,0))))") == false
#guard isStandard (parse! "C(C(C(W_2,W),C(W_2,W)),W_2)") == true
#guard isStandard (parse! "C(C(0,C(C(0,W),C(W,W))),C(0,C(C(W,0),W)))") == false
#guard isStandard (parse! "C(C(W,C(0,C(C(W,W),C(W,W)))),C(C(W,W),W))") == false
#guard isStandard (parse! "C(C(C(C(0,C(0,0)),C(C(W,W),C(0,0))),C(C(0,0),C(C(0,W_2),0))),C(C(W_2,0),C(C(C(0,W_2),C(0,0)),W_2)))") == false
#guard isStandard (parse! "C(C(C(0,W),C(C(C(0,W_2),C(W,0)),C(C(0,0),W_2))),C(C(C(C(0,W),C(0,0)),C(C(0,W_2),C(W_2,0))),C(C(C(0,0),0),C(C(0,W_2),C(0,0)))))") == false
#guard isStandard (parse! "C(W_3,C(W_2,0))") == false
#guard isStandard (parse! "C(C(C(W,0),C(0,W)),C(C(W,0),C(W,W)))") == false
#guard isStandard (parse! "C(C(C(0,C(0,W)),W_2),C(C(C(W_2,0),C(W,0)),C(0,C(W_2,0))))") == false
#guard isStandard (parse! "C(C(C(W,W),W),C(C(W,W),C(W,W)))") == false
#guard isStandard (parse! "C(C(C(W,0),0),0)") == false
#guard isStandard (parse! "C(W,C(C(0,0),C(C(C(0,W),C(0,0)),0)))") == false
#guard isStandard (parse! "C(C(0,C(W,C(C(W,0),C(0,0)))),C(C(C(C(0,0),C(0,0)),C(C(W,W),C(0,W))),C(C(C(W,W),0),C(C(0,0),C(W,0)))))") == false
#guard isStandard (parse! "C(C(0,C(C(C(0,W),C(0,0)),C(0,0))),C(C(C(0,C(0,W)),C(C(0,W),0)),C(W,0)))") == false
#guard isStandard (parse! "C(C(W_3,0),C(0,C(C(W_3,W_2),C(W,0))))") == false
#guard isStandard (parse! "C(W_2,C(C(W_3,C(0,W)),0))") == false
#guard isStandard (parse! "C(C(C(C(W,W),W),C(C(W,0),W)),C(0,C(C(W,0),C(W,W))))") == false
#guard isStandard (parse! "C(C(0,C(0,C(0,0))),C(C(0,W_3),C(C(W_2,W_2),C(0,W))))") == false
#guard isStandard (parse! "C(C(C(0,C(0,W)),C(C(W,0),C(W,W))),C(C(C(0,W),0),C(C(0,0),0)))") == false
#guard isStandard (parse! "C(C(C(C(0,W_2),C(0,W_3)),C(C(W,W),C(0,0))),C(0,C(0,C(0,W_3))))") == false
#guard isStandard (parse! "C(C(C(W,W),C(0,0)),C(C(W,0),C(W,0)))") == false
#guard isStandard (parse! "C(C(C(0,W),W),C(C(W,0),W))") == false
#guard isStandard (parse! "C(C(C(0,C(C(0,0),C(0,0))),C(C(C(0,W),C(W,0)),C(C(0,0),C(0,0)))),C(C(0,C(C(W,0),0)),C(W,C(C(0,0),C(0,0)))))") == false
#guard isStandard (parse! "C(C(0,W),C(C(0,0),0))") == false
#guard isStandard (parse! "C(C(C(0,0),W),C(C(C(W_2,0),C(0,0)),C(C(W_3,0),C(W_3,W_2))))") == false
#guard isStandard (parse! "C(C(C(0,0),0),C(C(0,W),C(0,W)))") == false
#guard isStandard (parse! "C(C(W_2,W),W)") == true
#guard isStandard (parse! "C(0,C(C(C(0,W),0),0))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(W,0)),C(C(0,W),C(0,W))),W),C(C(C(C(0,W),C(0,0)),C(C(0,W),W)),0))") == false
#guard isStandard (parse! "C(C(C(0,C(C(W_2,0),C(W_2,W))),C(C(C(0,0),C(0,0)),C(C(0,0),W))),C(C(0,W_2),C(C(C(W,W_2),W),W)))") == false
#guard isStandard (parse! "C(C(C(C(0,W_2),C(0,W_2)),C(C(W_2,0),C(0,0))),C(W,0))") == false
#guard isStandard (parse! "C(C(C(0,0),C(C(0,0),C(W_2,0))),C(C(C(W_2,W_3),C(0,0)),C(C(0,W_2),0)))") == false
#guard isStandard (parse! "C(C(C(W,0),C(0,0)),C(0,C(0,0)))") == false
#guard isStandard (parse! "C(C(W,0),C(0,W_2))") == false
#guard isStandard (parse! "C(W,C(0,C(0,W)))") == false
#guard isStandard (parse! "C(C(0,C(C(0,W_2),0)),C(W,C(C(0,W_2),C(0,0))))") == false
#guard isStandard (parse! "C(W,C(C(W_2,C(W_3,W)),C(0,C(0,0))))") == false
#guard isStandard (parse! "C(C(0,C(C(C(W_2,0),C(0,0)),0)),C(C(0,C(0,C(W_2,0))),0))") == false
#guard isStandard (parse! "C(0,C(0,C(C(C(0,0),0),C(C(W,W),C(0,0)))))") == false
#guard isStandard (parse! "C(C(0,W_3),C(0,0))") == false
#guard isStandard (parse! "C(0,C(C(0,0),0))") == true
#guard isStandard (parse! "C(0,C(C(W,C(W,0)),C(0,W)))") == false
#guard isStandard (parse! "C(0,C(0,C(C(C(0,W_2),C(0,0)),W_2)))") == false
#guard isStandard (parse! "C(C(C(0,0),0),C(C(0,W_2),0))") == true
#guard isStandard (parse! "C(C(W,C(W,0)),W)") == true
#guard isStandard (parse! "C(C(0,C(0,W_2)),C(C(W,W),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(W,W)),0),C(C(C(0,W),C(W,W)),C(C(W,W),C(W,0)))),C(C(0,C(0,C(W,0))),C(C(0,0),C(C(0,0),C(0,0)))))") == false
#guard isStandard (parse! "C(C(W,C(W,W)),0)") == true
#guard isStandard (parse! "C(C(C(0,0),0),0)") == true
#guard isStandard (parse! "C(C(W,C(W,0)),C(W,C(W,W)))") == true
#guard isStandard (parse! "C(C(C(0,C(0,0)),C(C(W_2,0),0)),C(W,W_2))") == false
#guard isStandard (parse! "C(C(C(0,C(C(0,0),0)),C(C(C(0,W_3),C(0,W_3)),W)),C(C(0,C(C(0,0),C(0,0))),C(0,C(C(W_3,0),C(0,W_3)))))") == false
#guard isStandard (parse! "C(C(C(C(W,W),0),C(C(0,W),C(0,W))),C(C(0,0),W))") == false
#guard isStandard (parse! "C(0,C(C(W_2,C(W_2,W_2)),C(C(0,W_3),0)))") == true
#guard isStandard (parse! "C(C(C(C(C(0,0),C(0,0)),C(C(W,0),C(W,0))),0),0)") == false
#guard isStandard (parse! "C(C(C(W_3,C(W_2,W_3)),C(C(0,0),C(0,W_2))),C(C(C(0,W_2),C(W_3,W_2)),C(C(W,0),C(W,W_2))))") == false
#guard isStandard (parse! "C(C(0,0),C(W_3,W))") == false
#guard isStandard (parse! "C(C(C(0,0),C(W,0)),C(C(0,0),C(0,W)))") == false
#guard isStandard (parse! "C(C(0,W),C(W,C(W,0)))") == false
#guard isStandard (parse! "C(C(0,0),C(C(C(0,0),C(0,0)),C(C(W,0),0)))") == false
#guard isStandard (parse! "C(0,C(W_3,C(C(0,W),C(W_2,W))))") == false
#guard isStandard (parse! "C(0,C(0,C(C(0,0),C(0,W))))") == false
#guard isStandard (parse! "C(C(W,C(0,0)),C(C(W_2,W_3),C(W_3,0)))") == false
#guard isStandard (parse! "C(C(C(W_2,0),0),0)") == false
#guard isStandard (parse! "C(W,C(W,C(C(0,0),C(0,W_2))))") == false
#guard isStandard (parse! "C(C(C(W,W),C(0,W)),C(C(0,W_2),C(0,0)))") == false
#guard isStandard (parse! "C(C(0,W),W)") == true
#guard isStandard (parse! "C(C(C(W,W),C(W,0)),C(W,C(0,W)))") == false
#guard isStandard (parse! "C(C(C(W,0),W),C(C(0,0),C(W,0)))") == false
#guard isStandard (parse! "C(C(C(C(C(W_3,0),C(W_2,W_3)),C(C(0,W_3),C(0,W_2))),C(0,C(0,C(0,W)))),C(C(C(C(0,0),C(0,0)),C(0,C(0,W_2))),C(C(C(W,0),C(W_3,W_3)),C(C(0,W_2),0))))") == false
#guard isStandard (parse! "C(C(C(C(C(W,0),0),C(C(0,0),C(0,0))),C(W,C(C(0,W),C(0,0)))),0)") == false
#guard isStandard (parse! "C(C(0,C(W,0)),C(C(0,0),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(W_2,0),C(0,0)),C(C(0,0),W_2))") == false
#guard isStandard (parse! "C(C(C(C(C(0,W),W_2),W),W_2),C(C(C(C(0,0),C(0,0)),C(0,0)),0))") == false
#guard isStandard (parse! "C(C(W_2,0),C(0,W_2))") == false
#guard isStandard (parse! "C(C(W_2,0),C(0,0))") == false
#guard isStandard (parse! "C(C(W_3,C(W,0)),W_2)") == false
#guard isStandard (parse! "C(C(C(0,0),0),C(0,C(0,W)))") == false
#guard isStandard (parse! "C(0,C(0,C(0,0)))") == true
#guard isStandard (parse! "C(W,C(W_2,W_3))") == true
#guard isStandard (parse! "C(C(C(C(W,0),C(0,W_2)),C(C(0,0),C(0,0))),C(C(C(W_2,0),C(0,0)),C(C(0,W),C(0,0))))") == false
#guard isStandard (parse! "C(C(C(C(0,C(0,W)),C(C(0,0),C(W,0))),C(C(C(W,W),0),W_2)),C(0,0))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(0,W_2)),0),C(C(C(0,0),C(W_3,0)),0)),W)") == false
#guard isStandard (parse! "C(C(C(0,0),C(C(0,0),C(0,0))),C(C(0,C(0,W_2)),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(C(W,W),W_2),C(C(0,0),C(W_2,W_2))),C(C(C(0,0),C(W,W_2)),W_2))") == false
#guard isStandard (parse! "C(C(W,0),C(W,W_3))") == true
#guard isStandard (parse! "C(C(C(0,C(0,0)),W_2),W)") == false
#guard isStandard (parse! "C(C(0,C(C(C(W_2,0),W),C(W_2,C(W,0)))),C(C(W,W_2),C(C(0,W_2),C(C(W,W),C(0,W_2)))))") == false
#guard isStandard (parse! "C(C(C(0,W),0),C(W,C(0,W)))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),0),C(W,C(W,0))),C(C(C(0,0),W),C(C(W,W),C(0,W)))),C(C(W,C(C(W,W),W)),0))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),0),0),C(0,W)),0)") == false
#guard isStandard (parse! "C(C(0,W),C(W_2,0))") == false
#guard isStandard (parse! "C(C(C(W,W),0),C(C(0,W),C(W_3,W_3)))") == true
#guard isStandard (parse! "C(C(W_2,0),C(C(W_3,W),0))") == false
#guard isStandard (parse! "C(C(C(W_2,0),C(0,0)),C(C(W,0),C(W,0)))") == false
#guard isStandard (parse! "C(C(0,0),C(C(C(0,0),0),0))") == true
#guard isStandard (parse! "C(C(C(C(C(0,W_2),0),W),0),C(W,C(C(C(0,0),C(0,W)),W_2)))") == false
#guard isStandard (parse! "C(C(W_3,0),W_2)") == false
#guard isStandard (parse! "C(C(W_2,C(0,0)),C(C(W_2,0),W))") == false
#guard isStandard (parse! "C(0,C(0,W_2))") == true
#guard isStandard (parse! "C(C(C(C(W,W),0),0),C(C(0,C(0,0)),C(0,C(0,W))))") == false
#guard isStandard (parse! "C(C(C(0,W_2),C(0,0)),C(C(0,0),C(0,W)))") == false
#guard isStandard (parse! "C(C(C(0,C(C(W,0),0)),C(C(C(W,W),C(0,W)),W)),C(0,W))") == false
#guard isStandard (parse! "C(C(C(0,C(0,C(0,W_2))),C(C(C(0,0),W_3),C(C(W_2,0),C(W_3,W)))),W)") == false
#guard isStandard (parse! "C(W_2,C(0,W))") == false
#guard isStandard (parse! "C(C(0,0),C(W_2,0))") == false
#guard isStandard (parse! "C(C(0,C(C(0,0),C(W,0))),C(C(0,C(0,0)),C(W,0)))") == false
#guard isStandard (parse! "C(C(0,0),C(0,C(C(W,W_2),0)))") == false
#guard isStandard (parse! "C(C(0,C(C(W_3,0),W_3)),C(C(C(W_2,0),C(0,0)),0))") == false
#guard isStandard (parse! "C(0,C(C(C(C(0,0),W),C(W,C(0,0))),C(C(C(0,0),C(0,0)),C(C(0,0),C(W,0)))))") == false
#guard isStandard (parse! "C(C(0,C(C(C(W,0),C(0,W)),C(C(W,0),C(W,0)))),0)") == false
#guard isStandard (parse! "C(C(C(W_2,0),W_2),C(C(0,0),C(W_2,0)))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),W),0),W),C(C(C(C(0,0),C(W,0)),C(0,C(W,0))),C(C(C(W,0),C(0,0)),C(0,C(0,W)))))") == false
#guard isStandard (parse! "C(W,C(C(C(C(W_2,0),C(0,W_2)),C(C(0,0),C(W,0))),C(C(0,C(0,W_2)),C(C(0,0),C(W,W)))))") == false
#guard isStandard (parse! "C(C(C(W,W),C(W,W)),W)") == false
#guard isStandard (parse! "C(C(C(C(0,C(0,W_2)),C(C(W_2,0),W)),0),C(C(0,C(C(0,0),C(0,0))),C(C(C(0,W_2),C(0,0)),C(C(0,0),C(W_2,0)))))") == false
#guard isStandard (parse! "C(C(C(W_2,C(0,0)),0),C(W,C(0,C(C(0,0),W))))") == false
#guard isStandard (parse! "C(C(C(C(W,0),C(W_2,0)),C(W_2,C(W_2,0))),C(C(C(W_2,0),C(W,0)),W_2))") == false
#guard isStandard (parse! "C(C(C(0,0),0),W)") == true
#guard isStandard (parse! "C(C(C(C(W,W),0),C(C(0,W),0)),C(W,C(C(0,0),C(W,W))))") == false
#guard isStandard (parse! "C(C(C(0,W_2),C(0,W)),C(W_3,C(W_3,0)))") == false
#guard isStandard (parse! "C(C(C(0,0),C(W_2,0)),C(C(W_2,W_3),C(W_2,0)))") == false
#guard isStandard (parse! "C(W,C(C(C(0,W),0),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(W_2,W_3),C(W_3,0)),0)") == false
#guard isStandard (parse! "C(C(C(0,C(W,0)),C(0,0)),C(C(0,C(0,W)),W_2))") == false
#guard isStandard (parse! "C(C(0,W),C(W,W_2))") == false
#guard isStandard (parse! "C(C(C(C(W_3,W),0),0),C(C(C(0,0),C(W_2,0)),C(C(W_2,0),C(W,W_3))))") == false
#guard isStandard (parse! "C(W_3,C(C(0,0),W_3))") == false
#guard isStandard (parse! "C(C(C(0,W),C(W,W)),0)") == false
#guard isStandard (parse! "C(C(C(W,C(0,C(0,0))),C(0,0)),C(C(C(C(0,W_2),C(0,W_3)),C(C(W_3,W_3),C(0,W_2))),0))") == false
#guard isStandard (parse! "C(0,C(C(W,0),C(0,W)))") == false
#guard isStandard (parse! "C(C(C(0,0),C(0,C(W_2,0))),C(W_2,C(C(0,W_2),C(W_2,W))))") == false
#guard isStandard (parse! "C(W,C(0,C(C(0,C(W,W)),C(C(0,0),C(0,W)))))") == false
#guard isStandard (parse! "C(C(0,C(C(W_2,W_2),C(0,W))),C(C(C(0,0),C(W,0)),C(0,C(W,0))))") == false
#guard isStandard (parse! "C(C(W_3,0),W_3)") == false
#guard isStandard (parse! "C(C(C(W_3,W_2),W_3),0)") == true
#guard isStandard (parse! "C(C(C(C(W,C(0,W)),C(C(0,W),C(W,0))),0),C(0,0))") == false
#guard isStandard (parse! "C(C(C(C(W_2,C(0,0)),C(W_2,C(W_3,0))),W_3),C(W_2,C(C(C(0,0),C(0,0)),C(0,C(W_2,0)))))") == false
#guard isStandard (parse! "C(C(0,C(0,C(0,W_2))),C(C(C(0,W_2),C(0,W_3)),C(W,C(0,0))))") == false
#guard isStandard (parse! "C(C(C(0,0),C(0,0)),C(C(0,W),C(0,0)))") == false
#guard isStandard (parse! "C(0,C(C(C(W,0),0),C(0,0)))") == false
#guard isStandard (parse! "C(0,C(C(C(0,0),C(0,0)),C(C(W_3,0),C(0,W_2))))") == false
#guard isStandard (parse! "C(C(0,C(C(W,W),C(0,W))),0)") == false
#guard isStandard (parse! "C(C(C(0,0),C(W,W)),0)") == true
#guard isStandard (parse! "C(0,C(0,C(W,W)))") == true
#guard isStandard (parse! "C(C(0,C(C(0,W),0)),C(C(C(0,0),C(W,W)),C(0,C(0,0))))") == false
#guard isStandard (parse! "C(C(0,0),C(0,W_2))") == false
#guard isStandard (parse! "C(C(0,0),C(C(0,0),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(0,C(C(0,W),W)),C(C(C(0,0),0),C(C(W,W),C(0,0)))),C(C(0,C(C(0,0),C(W,0))),W))") == false
#guard isStandard (parse! "C(C(W,C(W_3,C(W_2,W))),C(C(W_2,C(0,0)),C(C(0,W_2),C(0,W))))") == false
#guard isStandard (parse! "C(C(C(0,W_3),C(W,W)),W_3)") == false
#guard isStandard (parse! "C(C(C(C(C(0,W),0),C(C(W,W),C(0,W))),0),C(C(W,C(C(W,0),W)),C(C(C(0,W),W),C(C(0,W),C(0,0)))))") == false
#guard isStandard (parse! "C(W_3,C(0,0))") == false
#guard isStandard (parse! "C(C(W,C(0,C(C(0,0),W_2))),C(C(0,W_2),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),0),0),C(0,C(C(0,0),C(0,W_3)))),C(C(C(C(W,0),C(0,0)),C(C(0,W_2),C(0,0))),C(C(C(W,W_2),C(W_2,0)),C(C(0,0),C(W_2,W_3)))))") == false
#guard isStandard (parse! "C(0,C(C(C(W_3,W_3),C(W,0)),W))") == false
#guard isStandard (parse! "C(C(C(W,C(0,W_2)),C(0,C(W_2,W_2))),C(0,C(C(0,W),0)))") == false
#guard isStandard (parse! "C(C(C(W_3,W_2),0),C(W_3,0))") == false
#guard isStandard (parse! "C(C(C(0,C(C(0,0),0)),C(C(0,C(0,0)),W)),C(C(W_3,0),C(0,W_2)))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(0,0)),W_3),C(C(C(0,0),C(0,0)),C(C(W,0),C(W_2,0))))") == false
#guard isStandard (parse! "C(C(C(C(C(W,0),C(0,0)),C(C(0,W_2),C(0,W_3))),C(C(0,0),C(C(0,0),0))),0)") == false
#guard isStandard (parse! "C(C(C(0,W_2),C(W,W_2)),C(W_2,C(W_2,0)))") == false
#guard isStandard (parse! "C(C(0,C(C(W,W),W)),0)") == true
#guard isStandard (parse! "C(0,C(C(0,W),0))") == true
#guard isStandard (parse! "C(C(C(C(0,0),C(0,0)),C(C(0,0),W_2)),0)") == false
#guard isStandard (parse! "C(C(0,C(W,C(C(W,0),0))),C(C(0,C(C(0,0),W)),0))") == false
#guard isStandard (parse! "C(C(0,W_3),C(0,W_2))") == false
#guard isStandard (parse! "C(W_2,C(W_2,C(W,0)))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(0,W)),C(C(0,0),0)),C(C(C(0,W),W_2),C(C(0,W),0))),C(C(C(C(W_2,W),W),C(0,C(W_3,W))),C(C(0,C(W_2,W_2)),C(0,C(0,W)))))") == false
#guard isStandard (parse! "C(C(C(0,C(C(0,0),0)),C(0,0)),W_2)") == false
#guard isStandard (parse! "C(C(0,0),C(C(C(W,C(0,0)),C(C(W_2,W_3),0)),C(C(W_3,W_3),0)))") == false
#guard isStandard (parse! "C(C(C(C(C(W_2,0),C(0,0)),C(C(W_2,0),0)),C(0,C(C(0,W_2),0))),C(C(C(C(W,0),C(0,0)),C(C(W_2,W_3),C(0,W))),C(C(C(W_2,0),C(0,0)),C(C(0,0),C(W,0)))))") == false
#guard isStandard (parse! "C(W_3,C(W_3,W_3))") == true
#guard isStandard (parse! "C(C(C(C(C(0,0),C(0,0)),0),C(C(W_3,W_2),W)),C(C(C(C(W,0),W_2),0),C(C(C(W_2,W_3),C(0,W_3)),C(0,C(W_3,0)))))") == false
#guard isStandard (parse! "C(C(0,0),C(C(C(W,0),C(C(0,W),C(0,0))),C(C(C(0,0),C(0,W)),0)))") == false
#guard isStandard (parse! "C(C(0,C(C(C(0,W),W),C(0,C(0,W)))),C(C(C(0,C(0,W)),C(W,C(W,W))),C(C(C(W,W),C(W,0)),C(0,C(0,0)))))") == false
#guard isStandard (parse! "C(0,C(C(0,W),C(0,W)))") == false
#guard isStandard (parse! "C(C(C(0,C(W_2,W_2)),C(C(W_2,W),C(0,0))),W)") == false
#guard isStandard (parse! "C(C(0,C(C(0,0),0)),C(C(C(0,0),C(0,W)),C(C(W,0),C(0,W))))") == false
#guard isStandard (parse! "C(C(C(C(C(0,W_3),C(W,W_2)),C(C(0,0),C(0,W_3))),C(C(C(0,0),C(0,0)),C(C(0,W_3),C(W_2,0)))),C(C(C(C(W_3,0),C(0,0)),W_3),C(C(C(0,0),W),C(C(0,0),C(W,0)))))") == false
#guard isStandard (parse! "C(C(C(0,W_3),0),C(C(W,0),0))") == false
#guard isStandard (parse! "C(C(W,W),C(W,W))") == false
#guard isStandard (parse! "C(C(C(0,C(0,0)),C(C(W,0),0)),0)") == false
#guard isStandard (parse! "C(C(C(0,W_3),C(W_2,0)),0)") == false
#guard isStandard (parse! "C(W,C(C(0,C(W,0)),C(C(W,0),C(0,W))))") == false
#guard isStandard (parse! "C(W,C(W,C(0,C(C(0,W_2),C(0,0)))))") == false
#guard isStandard (parse! "C(C(C(0,C(C(0,0),C(0,0))),C(C(0,C(0,0)),C(0,0))),C(C(0,0),C(C(0,C(W,0)),C(C(W,0),0))))") == false
#guard isStandard (parse! "C(C(C(W,0),W),C(C(0,W),C(0,W_3)))") == false
#guard isStandard (parse! "C(C(C(C(0,W),C(W_2,W_2)),C(C(0,W),C(0,W_2))),W_2)") == false
#guard isStandard (parse! "C(C(W_2,C(C(0,W_2),C(0,0))),C(0,C(W,0)))") == false
#guard isStandard (parse! "C(0,C(C(0,0),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(0,C(0,W_2)),0),C(0,0))") == false
#guard isStandard (parse! "C(C(W,C(C(W,W),C(W,0))),0)") == false
#guard isStandard (parse! "C(C(0,W_2),C(0,W))") == false
#guard isStandard (parse! "C(C(W,C(0,0)),C(C(W,0),C(0,0)))") == false
#guard isStandard (parse! "C(C(W,C(0,0)),C(0,C(0,0)))") == false
#guard isStandard (parse! "C(C(C(C(0,C(W,0)),C(C(0,W),C(0,0))),C(C(C(0,0),C(0,0)),W)),C(C(C(W,C(0,W)),C(C(0,0),W_2)),W_2))") == false
#guard isStandard (parse! "C(C(C(C(W_2,0),C(W_2,0)),C(0,W_2)),C(0,W_2))") == false
#guard isStandard (parse! "C(C(C(0,C(C(0,W),C(0,W_2))),C(0,C(C(W,0),W))),C(C(W,C(0,C(0,0))),C(C(C(W,W_2),C(W_2,0)),0)))") == false
#guard isStandard (parse! "C(C(C(C(W,C(0,W)),C(C(W,0),0)),0),W)") == false
#guard isStandard (parse! "C(C(C(C(C(W,0),C(0,W_2)),C(C(W,0),0)),0),C(C(W_2,C(C(0,W),C(0,0))),C(C(C(W_2,0),W_2),C(C(0,W),C(W_2,0)))))") == false
#guard isStandard (parse! "C(C(0,C(W,0)),W_2)") == true
#guard isStandard (parse! "C(0,C(C(0,0),C(C(W,0),0)))") == false
#guard isStandard (parse! "C(C(C(0,W_2),C(0,0)),C(W,W))") == false
#guard isStandard (parse! "C(C(C(W,C(0,C(0,W))),C(C(0,0),C(C(0,0),C(W,0)))),0)") == false
#guard isStandard (parse! "C(C(C(0,C(C(0,W),C(0,0))),C(C(C(W,W),0),C(C(W,W),C(0,0)))),C(C(C(C(0,W),C(0,W)),C(W,W)),C(C(W,0),C(0,C(0,0)))))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(0,0)),C(0,W)),C(C(C(0,0),C(0,W)),C(W,C(0,W)))),C(C(0,C(0,0)),C(W,C(C(0,0),W))))") == false
#guard isStandard (parse! "C(0,C(W,C(C(C(W_2,0),C(W_2,W)),C(W_2,C(0,W_2)))))") == false
#guard isStandard (parse! "C(C(C(0,C(C(W,0),C(0,W))),C(C(W,C(0,W)),0)),C(C(C(C(0,0),C(W,0)),C(C(W,W),W)),C(C(C(W,W),C(W,0)),C(C(0,W),W))))") == false
#guard isStandard (parse! "C(C(C(C(C(0,W),C(0,0)),0),C(C(C(0,0),W),C(C(W,0),W))),C(C(C(C(W,0),C(0,0)),W),C(C(0,C(0,0)),0)))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(W,W)),W),C(C(C(0,W),0),C(W,C(W,W)))),C(0,0))") == false
#guard isStandard (parse! "C(C(W,C(0,W)),C(0,W))") == false
#guard isStandard (parse! "C(C(0,C(0,C(C(0,0),C(0,0)))),C(C(C(C(0,W_3),C(W_3,0)),0),C(C(C(0,0),C(0,0)),W_2)))") == false
#guard isStandard (parse! "C(C(C(C(0,W),C(W,W_2)),C(C(W_2,W),C(W_2,W))),C(0,C(C(0,0),C(W_2,0))))") == false
#guard isStandard (parse! "C(0,C(C(C(0,0),C(W,0)),C(0,W)))") == false
#guard isStandard (parse! "C(0,C(C(0,C(C(W_3,W_2),0)),C(0,C(C(W_2,0),0))))") == false
#guard isStandard (parse! "C(C(C(0,W),W),C(C(0,W),C(0,W)))") == false
#guard isStandard (parse! "C(C(C(C(0,0),W),W),C(0,C(C(0,W_3),C(W_2,0))))") == false
#guard isStandard (parse! "C(0,C(C(W_3,C(C(0,W_2),C(W,W_2))),0))") == false
#guard isStandard (parse! "C(C(C(C(W,0),C(0,0)),C(C(0,0),C(W,W))),C(C(C(0,W),C(0,0)),0))") == false
#guard isStandard (parse! "C(0,C(0,C(0,C(W,0))))") == true
#guard isStandard (parse! "C(W,C(W,C(C(C(0,0),0),C(W,C(W,0)))))") == false
#guard isStandard (parse! "C(W_2,C(C(C(W_2,0),C(0,0)),0))") == false
#guard isStandard (parse! "C(C(0,C(0,0)),C(C(0,0),C(W,0)))") == false
#guard isStandard (parse! "C(C(C(W,C(0,0)),C(W,C(W,W_3))),C(C(C(0,0),C(W_2,0)),0))") == false
#guard isStandard (parse! "C(W,C(C(C(C(0,0),C(0,W_2)),C(C(0,0),C(W,W_2))),C(C(C(0,0),C(0,W_2)),C(C(0,0),0))))") == false
#guard isStandard (parse! "C(C(C(C(W_2,W_2),0),C(C(0,C(W,W_2)),C(C(0,0),C(0,W)))),C(W_2,W))") == false
#guard isStandard (parse! "C(W,C(C(0,C(W,0)),C(0,0)))") == false
#guard isStandard (parse! "C(C(0,C(0,0)),C(C(0,0),0))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(0,W)),C(C(W_2,0),W_2)),C(C(C(W_3,W_3),W),C(0,C(W,W))))") == false
#guard isStandard (parse! "C(C(W,0),C(0,C(0,0)))") == false
#guard isStandard (parse! "C(C(C(0,C(C(0,W_2),W_2)),C(0,C(C(0,0),C(0,0)))),C(0,C(C(C(0,0),C(0,W)),W)))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(W,C(0,0))),C(C(W,C(0,0)),C(C(0,0),W))),0)") == false
#guard isStandard (parse! "C(C(0,C(0,W)),C(C(0,0),C(0,W)))") == false
#guard isStandard (parse! "C(C(C(W_2,0),C(0,C(W_2,0))),C(C(C(W_2,W),C(0,W)),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(0,W),W_2),C(C(0,0),C(0,W_2)))") == false
#guard isStandard (parse! "C(C(C(0,C(0,W_3)),W),C(C(W_2,C(W_3,W)),C(C(0,0),0)))") == false
#guard isStandard (parse! "C(0,C(0,C(C(C(W,W_2),C(W_2,0)),C(C(0,0),W_2))))") == false
#guard isStandard (parse! "C(C(W_2,0),C(W,0))") == false
#guard isStandard (parse! "C(C(C(0,0),C(W_3,0)),W_2)") == false
#guard isStandard (parse! "C(C(C(C(0,0),W_2),C(W,C(W,W))),0)") == false
#guard isStandard (parse! "C(0,C(C(0,W_2),0))") == true
#guard isStandard (parse! "C(C(C(C(0,W_2),C(0,0)),0),W)") == false
#guard isStandard (parse! "C(C(C(W,0),W),C(W,C(0,0)))") == false
#guard isStandard (parse! "C(C(C(W,W_2),0),C(C(W,0),C(0,W_3)))") == false
#guard isStandard (parse! "C(C(C(W,0),0),C(C(0,0),C(0,W)))") == false
#guard isStandard (parse! "C(C(W,C(C(W_3,C(W_3,0)),C(W,C(W,0)))),C(0,0))") == false
#guard isStandard (parse! "C(C(W_3,W_3),C(W,0))") == false
#guard isStandard (parse! "C(0,C(C(0,C(W,0)),C(C(W,W_2),C(0,0))))") == false
#guard isStandard (parse! "C(C(C(0,W),W),C(C(0,W),0))") == false
#guard isStandard (parse! "C(C(C(C(W,C(0,0)),C(C(W,0),C(0,0))),C(C(C(0,0),0),0)),C(C(C(C(0,W),C(0,0)),C(0,0)),C(0,C(C(0,W),C(W,W)))))") == false
#guard isStandard (parse! "C(C(C(W_3,C(W,0)),C(C(W,0),C(0,0))),0)") == false
#guard isStandard (parse! "C(C(C(C(0,W_2),0),C(C(W,W_2),C(C(0,0),C(W,0)))),C(C(C(C(W_2,0),W),C(C(W,0),C(0,0))),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(0,W),C(C(C(0,0),C(W,0)),C(W,0))),0)") == false
#guard isStandard (parse! "C(C(C(0,C(0,0)),C(C(W,0),W)),C(C(C(0,0),0),C(C(0,0),C(W_2,0))))") == false
#guard isStandard (parse! "C(0,C(C(W,0),C(W,0)))") == true
#guard isStandard (parse! "C(C(C(0,W),C(0,W)),C(W,C(0,W)))") == false
#guard isStandard (parse! "C(C(W_3,C(W_2,W_3)),C(C(W,0),0))") == false
#guard isStandard (parse! "C(C(W,C(C(0,W),C(0,W))),0)") == false
#guard isStandard (parse! "C(C(C(C(W,C(W,0)),W),C(C(C(0,0),C(0,0)),0)),C(C(0,C(C(0,0),0)),C(0,0)))") == false
#guard isStandard (parse! "C(0,C(C(C(C(W,0),C(W,0)),C(C(W,0),C(0,0))),C(C(C(W,W),C(W,0)),C(C(W,W),W))))") == false
#guard isStandard (parse! "C(C(W,C(0,0)),C(0,C(0,W_2)))") == false
#guard isStandard (parse! "C(C(C(C(W_2,0),W),C(C(0,0),C(W_2,0))),W_2)") == false
#guard isStandard (parse! "C(C(W,W),C(C(0,C(C(W_2,W_2),C(0,0))),0))") == false
#guard isStandard (parse! "C(C(C(C(C(0,W),0),C(C(0,W),W_2)),C(C(W,W_2),C(0,C(0,W)))),C(C(C(C(0,0),C(W,W_2)),0),C(C(C(W_2,0),C(W_2,W)),C(C(0,0),C(W_2,0)))))") == false
#guard isStandard (parse! "C(C(C(C(0,C(W,0)),C(0,C(W,0))),0),C(C(0,C(C(W,W),C(W,0))),0))") == false
#guard isStandard (parse! "C(C(0,C(C(0,0),0)),C(C(W_2,C(W_2,W)),C(C(0,0),C(W_2,0))))") == false
#guard isStandard (parse! "C(C(C(0,0),W),C(C(W,0),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(0,W),C(W,0)),C(W,0))") == false
#guard isStandard (parse! "C(C(C(C(W_2,0),C(W,W)),0),0)") == false
#guard isStandard (parse! "C(C(0,W_2),C(C(W,0),0))") == false
#guard isStandard (parse! "C(W_3,C(C(0,0),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(C(0,W_2),0),W_2),C(C(0,C(0,W)),0))") == false
#guard isStandard (parse! "C(C(C(C(0,C(0,W)),0),0),0)") == false
#guard isStandard (parse! "C(C(C(0,C(W_2,0)),C(C(0,0),C(0,0))),C(C(C(0,0),0),C(C(W,0),0)))") == false
#guard isStandard (parse! "C(C(0,C(C(0,0),C(C(0,0),C(0,0)))),C(C(C(C(0,0),W_2),C(0,0)),C(C(C(W,0),C(0,W_3)),C(C(W,W_2),0))))") == false
#guard isStandard (parse! "C(C(C(0,W_2),0),C(0,W))") == false
#guard isStandard (parse! "C(0,C(0,C(C(0,0),C(W,0))))") == true
#guard isStandard (parse! "C(C(W,C(W,W)),C(W,W))") == false
#guard isStandard (parse! "C(C(C(C(0,0),W_3),W_3),C(0,0))") == false
#guard isStandard (parse! "C(C(C(C(C(W_2,W_2),0),C(C(W_2,W),0)),C(C(W,C(0,0)),C(C(W,W_2),C(W,W_2)))),C(C(C(C(W_2,W_2),W_2),C(C(0,0),W_2)),C(C(C(W,W_2),C(0,0)),0)))") == false
#guard isStandard (parse! "C(C(W,C(0,0)),C(0,0))") == false
#guard isStandard (parse! "C(0,C(C(C(C(0,0),C(W,W)),W),C(0,W)))") == false
#guard isStandard (parse! "C(C(C(0,W),C(0,0)),C(C(0,W_3),0))") == false
#guard isStandard (parse! "C(C(W_3,C(W_3,C(W,C(W_3,0)))),C(W_2,C(C(W,C(0,0)),C(C(0,0),W))))") == false
#guard isStandard (parse! "C(0,C(C(W,0),W_2))") == true
#guard isStandard (parse! "C(C(W_2,C(0,C(W_2,0))),C(C(C(0,W),C(0,0)),C(W,C(0,W_2))))") == false
#guard isStandard (parse! "C(C(0,C(C(C(W_2,W),C(W,W_2)),C(C(W,0),0))),C(C(C(C(W_3,W_3),0),C(C(0,W),0)),C(C(W_2,C(W_3,W_2)),C(C(0,0),C(W,0)))))") == false
#guard isStandard (parse! "C(C(0,0),C(C(0,0),C(0,W_2)))") == false
#guard isStandard (parse! "C(C(C(C(C(W,W),C(0,W)),0),C(C(0,C(W,0)),C(C(W,W),C(W,0)))),C(C(C(C(W,0),0),C(C(0,W),W)),C(C(C(W,0),C(0,0)),C(C(0,0),C(0,W)))))") == false
#guard isStandard (parse! "C(C(C(W_2,C(0,0)),C(C(0,0),C(0,0))),C(C(C(W,W_2),C(0,W)),W_2))") == false
#guard isStandard (parse! "C(C(C(C(W,0),C(W,W)),W),C(0,C(C(W,0),0)))") == false
#guard isStandard (parse! "C(C(0,C(0,W_3)),C(C(C(W_2,0),C(0,0)),C(C(C(0,W),W),C(C(W_2,W_2),W_2))))") == false
#guard isStandard (parse! "C(C(C(0,C(C(W,0),C(W,0))),C(C(C(W,0),C(0,0)),W)),C(C(W,C(C(W,0),C(W,0))),0))") == false
#guard isStandard (parse! "C(W,C(C(C(C(0,0),C(0,W)),C(C(0,W),C(0,W))),C(C(C(0,0),C(0,0)),C(0,C(0,W)))))") == false
#guard isStandard (parse! "C(0,C(C(C(W_2,W_2),C(0,0)),0))") == false
#guard isStandard (parse! "C(C(C(W_2,0),C(C(0,0),C(0,C(W_2,W_2)))),C(W,C(C(C(W_2,W_2),C(W,W)),0)))") == false
#guard isStandard (parse! "C(W_2,C(C(0,C(0,0)),C(W_2,C(0,W))))") == false
#guard isStandard (parse! "C(W_3,C(C(0,C(C(W,W),0)),C(0,C(W_3,C(0,W_3)))))") == false
#guard isStandard (parse! "C(C(W,C(C(C(0,W_2),C(W_2,0)),C(C(0,0),C(0,0)))),C(C(C(C(W_2,W_2),C(0,0)),C(C(0,W_2),C(W,0))),W))") == false
#guard isStandard (parse! "C(C(W,C(C(W_3,C(0,W)),C(C(0,0),C(W_2,0)))),C(C(C(0,C(0,0)),C(C(W,0),C(0,W_3))),C(W_2,C(0,C(W_2,0)))))") == false
#guard isStandard (parse! "C(C(W_3,C(C(0,C(0,W)),0)),C(C(C(C(0,0),C(0,0)),C(0,C(0,W_3))),W))") == false
#guard isStandard (parse! "C(C(C(0,W_3),0),C(C(0,0),C(0,0)))") == false
#guard isStandard (parse! "C(C(W_3,W_2),0)") == true
#guard isStandard (parse! "C(C(C(0,C(0,0)),0),C(0,C(C(0,W_2),C(0,0))))") == false
#guard isStandard (parse! "C(W,C(C(0,W),C(0,W_2)))") == false
#guard isStandard (parse! "C(C(C(0,C(C(W_3,0),0)),C(0,W_2)),0)") == false
#guard isStandard (parse! "C(0,C(0,C(0,W)))") == true
#guard isStandard (parse! "C(C(W_2,C(W,0)),C(C(0,W_2),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(W_2,W_3),C(W_3,0)),C(C(0,0),C(W_2,0)))") == false
#guard isStandard (parse! "C(C(C(0,W),W),C(C(0,0),C(0,0)))") == false
#guard isStandard (parse! "C(0,C(0,C(C(C(0,0),C(0,W_2)),C(W_2,C(W_2,0)))))") == false
#guard isStandard (parse! "C(0,C(C(0,W_2),W_2))") == true
#guard isStandard (parse! "C(C(W,C(C(0,C(0,W)),C(W,W))),C(W,0))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(W_2,W_2)),C(0,0)),C(C(0,C(W_3,0)),C(C(0,W_3),C(W,W))))") == false
#guard isStandard (parse! "C(C(0,C(0,C(0,C(W_2,0)))),C(C(C(C(W_2,0),0),0),C(0,C(C(W_2,0),C(0,W)))))") == false
#guard isStandard (parse! "C(C(W_2,W_2),C(0,0))") == false
#guard isStandard (parse! "C(C(0,C(C(0,0),C(0,0))),C(C(C(W,0),C(W_2,W)),C(C(0,0),C(W,W_3))))") == false
#guard isStandard (parse! "C(C(C(C(W_3,0),C(0,0)),C(C(0,0),C(0,0))),C(C(0,0),C(C(W,W_2),C(W,W_3))))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(W,0)),W_2),W_2)") == true
#guard isStandard (parse! "C(0,C(W,C(C(W_2,0),C(0,W_3))))") == false
#guard isStandard (parse! "C(C(0,C(W_2,0)),C(C(0,W),C(0,W)))") == false
#guard isStandard (parse! "C(C(C(0,W_3),C(C(0,C(W_3,0)),C(C(0,0),C(W_3,W_2)))),C(C(C(C(0,0),0),0),C(C(C(0,W_3),C(W,W_3)),C(W_3,0))))") == false
#guard isStandard (parse! "C(W,C(C(W_2,0),C(W_2,W_2)))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),W),C(C(W,W_2),W_2)),0),W)") == true
#guard isStandard (parse! "C(C(C(C(0,0),C(W,W)),C(C(0,0),0)),W)") == false
#guard isStandard (parse! "C(C(C(0,W),C(W,W)),C(C(0,0),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(C(W,0),C(0,W_2)),C(0,C(0,W))),C(C(C(W,W),C(W_2,0)),W))") == false
#guard isStandard (parse! "C(C(C(0,W_2),C(W,0)),C(0,C(0,0)))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(0,0)),C(C(0,0),C(0,0))),C(C(C(W_2,W_2),C(W,0)),C(C(W_2,0),C(0,0))))") == false
#guard isStandard (parse! "C(C(C(W_2,W_3),0),C(C(W,W_2),W))") == false
#guard isStandard (parse! "C(C(C(W,0),C(0,C(0,C(0,0)))),C(C(C(W,W),C(C(0,W),C(0,0))),0))") == false
#guard isStandard (parse! "C(C(0,C(C(C(W,0),C(0,0)),C(C(0,W),0))),C(C(0,0),0))") == false
#guard isStandard (parse! "C(C(0,C(0,W)),C(C(W,0),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(C(W,0),C(0,0)),C(C(0,W_3),C(W_2,0))),C(C(0,C(0,0)),C(0,W_2)))") == false
#guard isStandard (parse! "C(C(C(C(0,W_2),0),W_2),C(C(W,W),C(C(0,0),C(0,W_3))))") == false
#guard isStandard (parse! "C(C(C(W,0),C(0,0)),C(C(0,0),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(W_2,0),C(0,0)),0)") == false
#guard isStandard (parse! "C(C(0,C(C(0,W),C(0,W_2))),C(W_2,C(C(W_2,0),C(0,W))))") == false
#guard isStandard (parse! "C(C(C(0,0),0),C(C(0,W),W))") == true
#guard isStandard (parse! "C(C(C(C(0,C(W_2,0)),C(W_2,C(W,0))),C(C(C(W,0),0),C(C(0,0),0))),W_2)") == false
#guard isStandard (parse! "C(C(0,0),C(C(W,C(0,W)),C(C(0,W),C(0,0))))") == false
#guard isStandard (parse! "C(0,C(C(W,C(W_2,C(0,0))),C(0,C(0,C(0,0)))))") == false
#guard isStandard (parse! "C(C(C(W,W),C(W,W)),C(0,W))") == false
#guard isStandard (parse! "C(C(W,W),C(W,C(C(C(0,0),C(0,0)),C(C(W,0),C(0,W)))))") == false
#guard isStandard (parse! "C(W,C(C(0,W),W))") == true
#guard isStandard (parse! "C(C(C(C(0,0),C(0,0)),C(0,C(W,0))),C(W_2,C(C(W,W_2),C(0,0))))") == false
#guard isStandard (parse! "C(C(C(C(0,W),C(W,W)),C(C(0,0),W_3)),C(C(C(W_3,W_2),C(W,0)),C(0,C(W,0))))") == false
#guard isStandard (parse! "C(C(C(C(0,C(W,0)),C(C(0,W_2),0)),C(0,0)),0)") == false
#guard isStandard (parse! "C(C(W,C(0,0)),W)") == false
#guard isStandard (parse! "C(C(C(C(W_2,W_2),C(0,0)),C(C(W,0),C(W_2,W))),C(C(C(0,0),W),W_2))") == false
#guard isStandard (parse! "C(C(C(C(W,W),C(C(W,0),C(0,0))),C(C(W,0),C(C(0,0),C(0,0)))),C(C(W,W),0))") == false
#guard isStandard (parse! "C(C(C(C(0,C(0,W_3)),C(C(0,0),C(0,0))),0),W)") == false
#guard isStandard (parse! "C(C(W_3,C(0,0)),C(C(0,W),C(0,0)))") == false
#guard isStandard (parse! "C(0,C(0,C(C(0,0),0)))") == true
#guard isStandard (parse! "C(C(0,W),C(C(C(C(0,W),W),C(C(0,0),C(0,W_2))),C(C(C(W_2,0),C(0,0)),C(0,0))))") == false
#guard isStandard (parse! "C(C(C(W_3,W),C(0,0)),0)") == false
#guard isStandard (parse! "C(C(C(0,C(0,0)),0),W_2)") == true
#guard isStandard (parse! "C(C(C(0,0),C(0,W)),C(C(0,0),C(0,W)))") == false
#guard isStandard (parse! "C(C(0,W_3),W_3)") == true
#guard isStandard (parse! "C(C(W_2,0),C(C(0,W_2),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(C(W_3,0),0),C(C(0,0),C(W_3,W_2))),C(0,0))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(C(W,0),C(0,W))),C(0,0)),C(C(C(W_2,C(W,0)),0),C(W_2,0)))") == false
#guard isStandard (parse! "C(C(W_2,0),C(W_2,C(C(0,0),C(0,W_2))))") == false
#guard isStandard (parse! "C(C(W,0),C(C(0,0),C(C(W,C(W,0)),W_2)))") == false
#guard isStandard (parse! "C(C(C(C(C(0,W),C(W_2,W_2)),0),C(W_2,0)),C(C(C(C(W_3,W),C(0,0)),C(0,0)),C(C(C(0,0),C(W,W_2)),C(C(0,W_2),0))))") == false
#guard isStandard (parse! "C(0,C(W_2,C(0,0)))") == false
#guard isStandard (parse! "C(C(W,C(C(W,0),W)),W)") == false
#guard isStandard (parse! "C(C(W_2,W),C(0,W_2))") == false
#guard isStandard (parse! "C(C(C(0,W),0),C(C(C(C(0,0),C(0,0)),C(0,0)),C(C(C(W,0),W),0)))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(W_2,0)),C(C(W_2,W),W)),C(C(0,0),C(C(W,0),C(0,0))))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(W,W)),0),C(C(C(W,0),C(0,0)),C(C(W,0),C(W,0))))") == false
#guard isStandard (parse! "C(C(C(0,W_2),C(W_2,W_2)),C(C(0,0),C(W_2,W_2)))") == false
#guard isStandard (parse! "C(C(0,C(C(C(0,W_3),C(W,W)),C(0,C(W_2,W)))),0)") == false
#guard isStandard (parse! "C(W_2,C(C(C(C(0,0),W_2),C(C(W,W),C(0,0))),0))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(0,W)),W_2),0)") == false
#guard isStandard (parse! "C(W,C(C(W_2,0),W_2))") == false
#guard isStandard (parse! "C(C(C(C(0,W),C(0,0)),0),C(0,C(C(0,0),C(0,0))))") == false
#guard isStandard (parse! "C(C(C(W,0),W),C(C(W,0),C(W,W)))") == false
#guard isStandard (parse! "C(C(C(C(0,W_3),C(W_3,W_2)),0),0)") == false
#guard isStandard (parse! "C(C(W,C(0,0)),C(0,C(W,W)))") == false
#guard isStandard (parse! "C(C(C(W,W),C(0,W)),C(C(W,0),0))") == false
#guard isStandard (parse! "C(C(C(0,0),C(0,0)),C(C(W,0),W))") == false
#guard isStandard (parse! "C(C(C(C(W,0),C(0,W)),C(C(0,0),W)),C(C(C(0,0),W),C(C(0,0),C(W,W))))") == false
#guard isStandard (parse! "C(W,C(W_2,0))") == false
#guard isStandard (parse! "C(C(C(W,W),C(W,0)),C(C(W,0),C(W,W)))") == false
#guard isStandard (parse! "C(C(C(C(W_3,W),C(W,W_2)),C(0,C(0,0))),C(C(C(W_2,0),C(0,W_3)),C(C(W_3,0),W_3)))") == false
#guard isStandard (parse! "C(C(C(0,W),C(W_2,0)),0)") == false
#guard isStandard (parse! "C(C(C(C(W_2,0),C(C(W_2,W_2),C(0,W))),C(W,C(C(0,0),C(W_2,0)))),C(C(0,C(0,C(0,W_2))),0))") == false
#guard isStandard (parse! "C(C(C(C(0,0),W_3),C(0,C(W_3,0))),C(C(C(0,0),0),C(C(W_3,W),W)))") == false
#guard isStandard (parse! "C(C(W,W_2),C(W,0))") == false
#guard isStandard (parse! "C(0,C(W_2,W_3))") == true
#guard isStandard (parse! "C(C(C(0,C(C(W_2,W_2),W)),W),W_3)") == false
#guard isStandard (parse! "C(C(W,W_2),W)") == false
#guard isStandard (parse! "C(C(C(C(W_2,W),0),C(C(0,0),0)),C(C(C(0,0),C(W_2,0)),C(C(0,0),C(0,0))))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(0,W)),C(C(W,0),W)),C(C(C(W,0),C(W,0)),0))") == false
#guard isStandard (parse! "C(C(W_2,0),W)") == false
#guard isStandard (parse! "C(0,C(C(C(C(0,0),C(W_2,0)),0),C(W_3,C(C(W_2,W_2),0))))") == false
#guard isStandard (parse! "C(C(C(W,W),C(0,0)),0)") == false
#guard isStandard (parse! "C(0,C(C(C(0,0),C(W,W_2)),C(C(0,0),C(0,W))))") == false
#guard isStandard (parse! "C(C(C(W_2,C(0,0)),C(C(0,0),C(0,W_2))),C(0,C(C(0,W_2),C(0,W_2))))") == false
#guard isStandard (parse! "C(C(W_3,0),C(W_3,C(0,C(0,W))))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(W,0)),C(C(W_2,W_2),0)),C(C(W,C(W,0)),0))") == false
#guard isStandard (parse! "C(C(C(C(0,0),W_3),0),W)") == false
#guard isStandard (parse! "C(0,C(C(W_2,0),C(W_2,W_2)))") == false
#guard isStandard (parse! "C(C(0,C(0,W_2)),0)") == true
#guard isStandard (parse! "C(C(0,C(W_3,W_2)),C(W,C(W_3,W_3)))") == false
#guard isStandard (parse! "C(0,C(C(W,W_2),0))") == true
#guard isStandard (parse! "C(C(0,W),C(C(W,0),W))") == false
#guard isStandard (parse! "C(C(W_3,C(C(0,0),C(W,0))),C(C(C(W,W_3),0),C(C(0,0),C(0,0))))") == false
#guard isStandard (parse! "C(C(0,C(C(W_2,W_2),C(W_2,0))),C(W_2,C(C(0,W),C(W_2,0))))") == false
#guard isStandard (parse! "C(C(C(C(0,0),0),C(C(W,0),C(0,W))),C(W,C(C(0,0),C(0,W))))") == false
#guard isStandard (parse! "C(C(W,0),C(C(0,C(C(0,0),C(0,0))),0))") == false
#guard isStandard (parse! "C(W_2,C(C(W_3,W_3),C(0,W)))") == false
#guard isStandard (parse! "C(0,C(C(0,0),W_2))") == true
#guard isStandard (parse! "C(C(C(C(W_3,0),0),C(C(0,0),C(W_3,0))),C(C(0,W),C(0,C(0,0))))") == false
#guard isStandard (parse! "C(C(0,C(0,0)),C(C(W_3,0),C(W_2,W_2)))") == false
#guard isStandard (parse! "C(C(C(W_3,0),C(0,W)),C(C(W_3,0),0))") == false
#guard isStandard (parse! "C(C(C(W,W),C(0,0)),C(C(W,0),C(0,W)))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(0,W)),0),W_2),0)") == false
#guard isStandard (parse! "C(C(C(0,0),C(W,0)),0)") == false
#guard isStandard (parse! "C(C(C(0,C(W_3,W_2)),C(W_3,C(C(0,0),W))),C(W_2,C(C(C(0,0),C(0,0)),C(C(0,0),C(0,0)))))") == false
#guard isStandard (parse! "C(C(C(W,W_2),C(W_2,W_2)),C(C(W,W),0))") == false
#guard isStandard (parse! "C(C(C(C(0,W),C(0,W)),C(C(W,W),W)),C(0,C(C(0,W),C(W,0))))") == false
#guard isStandard (parse! "C(C(C(W_2,0),C(W,0)),C(C(0,0),0))") == false
#guard isStandard (parse! "C(C(C(C(0,W_3),C(0,W)),W),C(C(0,C(0,W)),C(C(W_3,0),C(W,0))))") == false
#guard isStandard (parse! "C(C(C(C(0,W_2),C(0,0)),0),C(0,C(C(W_2,0),W)))") == false
#guard isStandard (parse! "C(C(C(C(W_2,0),C(W,W)),C(C(0,0),W)),0)") == false
#guard isStandard (parse! "C(C(C(C(C(W,W),C(0,0)),C(W,C(0,W))),C(C(C(W,0),C(0,0)),0)),C(C(C(C(W_2,W_2),W_2),W),C(W,W_2)))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),W),C(0,C(0,0))),C(0,0)),C(C(C(C(0,0),0),C(C(0,0),C(0,0))),C(0,C(C(W,0),W))))") == false
#guard isStandard (parse! "C(C(W,W_2),C(W_3,0))") == false
#guard isStandard (parse! "C(C(W_2,W_2),C(0,W_2))") == false
#guard isStandard (parse! "C(C(0,0),C(C(0,W_3),0))") == true
#guard isStandard (parse! "C(W_3,C(W,0))") == false
#guard isStandard (parse! "C(C(C(W_3,W_2),C(0,W)),C(C(W_3,0),C(0,W_2)))") == false
#guard isStandard (parse! "C(0,C(C(0,0),C(W_2,W_2)))") == true
#guard isStandard (parse! "C(C(C(W,W),0),C(C(0,W),C(0,0)))") == false
#guard isStandard (parse! "C(0,C(C(C(0,C(0,0)),0),C(C(C(0,0),W),0)))") == true
#guard isStandard (parse! "C(0,C(C(W_2,C(0,W)),C(C(0,0),C(W_2,0))))") == false
#guard isStandard (parse! "C(C(C(C(C(W,W),0),C(C(0,0),0)),C(C(C(W,0),C(0,W)),C(C(W,W),0))),C(0,C(C(C(W,0),W),C(C(0,0),C(W,W)))))") == false
#guard isStandard (parse! "C(C(C(C(0,W),C(0,W_2)),W_2),C(0,0))") == false
#guard isStandard (parse! "C(C(C(0,0),0),C(C(0,C(C(W_2,0),0)),C(C(C(W_3,0),C(W_3,W_3)),W_2)))") == false
#guard isStandard (parse! "C(C(C(0,0),W),W_2)") == true
#guard isStandard (parse! "C(W,C(C(C(W,0),C(W,0)),C(W,C(0,0))))") == false
#guard isStandard (parse! "C(C(C(0,0),C(W,W_2)),C(C(W,W_2),C(0,W_2)))") == false
#guard isStandard (parse! "C(C(0,0),W_3)") == true
#guard isStandard (parse! "C(C(W_3,0),W)") == false
#guard isStandard (parse! "C(C(0,0),C(C(0,0),0))") == true
#guard isStandard (parse! "C(C(C(0,W),C(C(0,0),C(C(W,0),C(W,0)))),C(C(W,C(C(0,0),0)),C(0,W)))") == false
#guard isStandard (parse! "C(C(C(0,C(0,W)),C(C(0,W),C(0,0))),0)") == false
#guard isStandard (parse! "C(W_3,C(W_3,C(0,W_2)))") == false
#guard isStandard (parse! "C(W_2,C(W,C(0,0)))") == false
#guard isStandard (parse! "C(C(W,W),C(C(0,0),C(W,0)))") == false
#guard isStandard (parse! "C(0,C(C(C(W,W),0),C(C(0,0),C(W,W))))") == false
#guard isStandard (parse! "C(C(W_2,C(0,C(0,0))),0)") == false
#guard isStandard (parse! "C(C(0,W),C(C(0,0),C(0,W)))") == false
#guard isStandard (parse! "C(C(C(0,0),C(0,W_2)),0)") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(0,0)),C(C(0,W_2),W)),0),C(0,W_2))") == false
#guard isStandard (parse! "C(0,C(C(C(0,W_3),C(W_3,0)),C(W,W_2)))") == false
#guard isStandard (parse! "C(C(C(W,W),0),C(C(0,W),0))") == false
#guard isStandard (parse! "C(C(C(C(W,0),0),C(C(W_2,0),0)),C(C(C(0,0),C(W,0)),C(C(0,0),C(W_2,W_2))))") == false
#guard isStandard (parse! "C(C(C(C(W,C(0,W)),0),C(0,C(W,C(0,W)))),C(C(C(C(W,0),C(0,W)),0),C(C(C(0,0),C(0,0)),C(C(0,0),C(0,W)))))") == false
#guard isStandard (parse! "C(C(0,0),C(C(C(0,0),C(0,W)),C(C(0,0),0)))") == false
#guard isStandard (parse! "C(0,C(C(C(W,W_2),C(C(0,W_2),C(0,0))),C(C(C(0,W_2),W),C(C(0,0),0))))") == false
#guard isStandard (parse! "C(C(C(W_2,C(0,C(W_2,0))),C(C(C(0,0),C(W_2,W)),W)),C(C(C(W,C(0,0)),0),C(C(0,W_2),C(C(W,0),C(0,W_2)))))") == false
#guard isStandard (parse! "C(C(0,C(0,C(0,0))),C(C(0,C(0,0)),C(C(W_2,W_2),C(0,0))))") == false
#guard isStandard (parse! "C(C(0,C(C(0,0),W)),C(0,0))") == false
#guard isStandard (parse! "C(C(C(C(W_3,0),C(W_2,W_2)),W_2),C(W_3,C(0,C(0,0))))") == false
#guard isStandard (parse! "C(C(C(W,C(C(0,0),W)),W),C(0,C(C(C(W,0),C(0,0)),C(C(0,W),C(W,W)))))") == false
#guard isStandard (parse! "C(C(0,0),C(C(C(C(W,W),W),C(C(0,W),W)),C(C(C(W,W),C(0,W)),0)))") == false
#guard isStandard (parse! "C(C(C(0,W_2),C(0,0)),C(C(0,W_2),C(W_2,W_2)))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),W),C(W_2,0)),C(C(C(W,0),C(0,0)),C(C(0,0),W))),C(C(C(W_3,C(W,0)),C(W_3,C(0,0))),C(0,C(0,C(0,W_2)))))") == false
#guard isStandard (parse! "C(C(W_3,0),C(W_2,0))") == false
#guard isStandard (parse! "C(W_2,C(C(W,C(C(0,0),C(W_2,0))),C(C(0,C(0,W_3)),C(C(0,0),C(W,0)))))") == false
#guard isStandard (parse! "C(C(0,C(0,W)),C(C(W,0),C(W,W_2)))") == false
#guard isStandard (parse! "C(C(W,C(C(0,W_2),C(0,W))),C(C(C(W,0),C(W,W_2)),0))") == false
#guard isStandard (parse! "C(C(0,C(C(0,W),C(0,C(W,0)))),W)") == false
#guard isStandard (parse! "C(C(0,W),C(W,W))") == false
#guard isStandard (parse! "C(W_2,C(0,C(0,W)))") == false
#guard isStandard (parse! "C(C(C(C(0,W),0),C(C(0,0),C(W,W))),W)") == false
#guard isStandard (parse! "C(C(C(C(0,W),C(0,0)),C(C(W_2,W_2),W_2)),0)") == false
#guard isStandard (parse! "C(C(C(C(0,0),0),C(0,C(0,W_2))),W_2)") == false
#guard isStandard (parse! "C(C(C(0,W),C(0,W)),0)") == false
#guard isStandard (parse! "C(C(W_3,W_2),C(0,0))") == false
#guard isStandard (parse! "C(C(C(0,W),C(0,0)),C(C(0,W_2),C(W_2,W)))") == false
#guard isStandard (parse! "C(W,C(C(C(C(W,W),C(0,0)),0),0))") == false
#guard isStandard (parse! "C(C(C(C(W_3,W),C(W_2,W_2)),0),C(C(C(0,0),C(W_3,0)),C(C(W_3,0),C(0,W))))") == false
#guard isStandard (parse! "C(C(C(C(0,W),W),C(C(0,0),C(W,0))),C(C(C(0,W),C(0,0)),C(C(0,0),C(W_2,W))))") == false
#guard isStandard (parse! "C(0,C(C(0,C(C(0,W),C(W,0))),0))") == false
#guard isStandard (parse! "C(C(W_2,W_2),C(W_2,W_2))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(0,0)),C(W_2,W)),0)") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(0,0)),C(C(W,0),0)),0)") == false
#guard isStandard (parse! "C(C(C(0,C(0,0)),C(C(W,0),C(W,0))),C(W,C(C(0,W),C(0,0))))") == false
#guard isStandard (parse! "C(0,C(C(C(W_2,0),C(W,0)),0))") == false
#guard isStandard (parse! "C(C(C(W,W),C(C(0,W),C(0,0))),C(C(W,C(0,0)),C(C(0,0),C(0,W))))") == false
#guard isStandard (parse! "C(C(W,0),C(W_2,W_2))") == true
#guard isStandard (parse! "C(C(C(0,0),C(W,0)),C(W_3,C(0,W_2)))") == false
#guard isStandard (parse! "C(W,C(C(W_2,0),0))") == false
#guard isStandard (parse! "C(C(W,C(0,0)),C(W_2,C(0,0)))") == false
#guard isStandard (parse! "C(C(C(C(0,0),W),C(C(W_3,0),0)),C(C(C(W,W),C(W_2,W)),C(C(W_2,0),C(0,W))))") == false
#guard isStandard (parse! "C(C(W,C(C(C(0,W_2),W),C(0,C(W_2,0)))),C(0,W))") == false
#guard isStandard (parse! "C(0,C(C(W_2,C(C(W_3,0),C(0,0))),W))") == false
#guard isStandard (parse! "C(W_3,C(C(C(0,W),C(0,0)),C(C(W,0),0)))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(W,W_3)),C(C(W_3,0),0)),C(C(C(0,0),C(W,0)),0))") == false
#guard isStandard (parse! "C(C(C(W,W),C(0,W)),C(W,C(0,W)))") == false
#guard isStandard (parse! "C(C(C(C(0,W),C(W_2,0)),0),W_3)") == false
#guard isStandard (parse! "C(C(C(C(C(W,0),C(0,0)),W),C(C(C(W,0),W),C(0,C(0,W)))),C(C(0,0),0))") == false
#guard isStandard (parse! "C(W,C(C(0,W),C(C(C(W,0),W),C(C(0,W),C(0,0)))))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(0,0)),C(0,W)),0)") == false
#guard isStandard (parse! "C(C(0,C(C(0,W_2),C(0,0))),0)") == false
#guard isStandard (parse! "C(C(0,C(C(0,0),C(W_2,W_2))),0)") == true
#guard isStandard (parse! "C(C(C(W,0),C(W,0)),W)") == true
#guard isStandard (parse! "C(C(C(C(W,W_3),C(0,W)),C(C(0,W_3),C(W,0))),C(C(C(W_2,W_3),C(0,0)),C(C(0,0),C(0,0))))") == false
#guard isStandard (parse! "C(C(C(0,C(0,C(0,W))),W),0)") == true
#guard isStandard (parse! "C(C(C(0,C(0,C(0,0))),C(W,C(C(W,0),C(W,W)))),0)") == false
#guard isStandard (parse! "C(C(C(C(C(W,W_3),C(0,W_3)),C(C(0,W),0)),C(W_2,C(C(W,W),C(W_3,W_3)))),C(C(C(C(0,W_2),C(0,0)),W_3),C(C(C(0,0),C(W_2,0)),C(W_2,W_2))))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(W_2,W)),C(W,C(W,0))),C(W_2,C(C(0,W),C(0,0))))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(W_3,W)),C(C(W_2,0),C(0,0))),C(0,C(C(0,0),C(W_3,W_2))))") == false
#guard isStandard (parse! "C(C(C(C(0,C(0,0)),C(C(W_3,W),C(0,W_2))),C(C(W,C(W_3,0)),C(0,C(0,0)))),C(C(C(W_2,C(W_3,0)),C(C(0,W),W_3)),C(C(0,C(W_3,0)),0)))") == false
#guard isStandard (parse! "C(C(W_2,0),W_2)") == false
#guard isStandard (parse! "C(C(C(0,W),C(W_2,0)),C(C(W_3,0),C(0,W)))") == false
#guard isStandard (parse! "C(C(C(W,0),C(W_2,0)),0)") == false
#guard isStandard (parse! "C(C(C(W,C(C(0,0),C(W,0))),C(C(C(0,0),C(0,W_2)),C(C(W_2,W_2),C(0,W)))),C(C(C(C(0,W_2),C(0,W)),C(C(W_2,0),C(W_2,0))),W_2))") == false
#guard isStandard (parse! "C(C(C(C(W,W_3),C(0,0)),C(C(0,W),C(0,W_2))),C(C(C(W_2,W_2),0),C(0,C(0,0))))") == false
#guard isStandard (parse! "C(C(W_3,0),0)") == false
#guard isStandard (parse! "C(0,C(C(W,W),W))") == true
#guard isStandard (parse! "C(C(W_3,0),C(W,C(W_2,0)))") == false
#guard isStandard (parse! "C(C(C(W,C(0,W)),C(C(W,0),C(W,0))),C(C(C(0,W),C(0,0)),C(C(W,0),0)))") == false
#guard isStandard (parse! "C(C(C(0,0),0),W_3)") == true
#guard isStandard (parse! "C(C(C(C(0,0),C(0,W)),C(C(0,0),C(W,W_2))),C(C(C(W,0),C(W,W_3)),C(W_2,W)))") == false
#guard isStandard (parse! "C(C(C(W,W),C(0,0)),C(W_2,C(W_2,W)))") == false
#guard isStandard (parse! "C(C(C(C(0,0),0),C(C(0,W),C(0,W))),C(0,C(0,C(W,0))))") == false
#guard isStandard (parse! "C(C(C(0,W),C(W,0)),C(C(W,0),W))") == false
#guard isStandard (parse! "C(C(0,0),C(0,C(C(0,W_3),0)))") == false
#guard isStandard (parse! "C(0,C(C(0,W),C(0,C(W,W))))") == false
#guard isStandard (parse! "C(C(C(0,0),C(C(C(0,0),C(0,W)),C(C(W,W),C(0,W)))),W)") == false
#guard isStandard (parse! "C(W,C(C(W,0),C(W,W)))") == false
#guard isStandard (parse! "C(C(0,C(W_3,W_3)),C(C(W,0),0))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(0,0)),C(0,C(W,0))),C(C(W,0),C(C(0,W),C(0,0)))),0)") == false
#guard isStandard (parse! "C(C(C(C(0,W_3),C(0,0)),C(C(0,W_3),W_2)),0)") == false
#guard isStandard (parse! "C(C(C(W,0),C(W_2,0)),W_2)") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(0,0)),C(C(W,0),C(0,W))),C(C(C(W,W),C(W,0)),0))") == false
#guard isStandard (parse! "C(C(0,C(0,W_3)),C(W_2,0))") == false
#guard isStandard (parse! "C(C(W_3,W_3),C(0,0))") == false
#guard isStandard (parse! "C(C(C(C(0,C(0,0)),C(C(0,0),C(0,0))),C(C(W,C(0,0)),0)),0)") == false
#guard isStandard (parse! "C(C(0,C(0,W)),C(C(0,W),W))") == false
#guard isStandard (parse! "C(C(0,W),C(C(C(C(0,0),C(W_2,0)),C(C(0,0),C(W,0))),C(W,W_2)))") == false
#guard isStandard (parse! "C(C(C(C(W_2,0),C(W_3,0)),C(0,W)),C(C(C(W_3,0),C(W_3,0)),C(C(0,0),C(W_3,W_3))))") == false
#guard isStandard (parse! "C(C(W_2,0),C(C(C(C(0,W_3),C(W_3,0)),0),C(C(C(0,W_3),C(0,W)),C(C(0,W_2),C(W_3,W_2)))))") == false
#guard isStandard (parse! "C(C(C(0,C(C(0,0),C(W,W_2))),C(C(C(W_2,W_2),C(W,0)),C(W_2,C(W,W_2)))),0)") == false
#guard isStandard (parse! "C(C(0,C(W,W)),C(W,0))") == false
#guard isStandard (parse! "C(C(W_3,C(0,0)),C(W,C(0,W_3)))") == false
#guard isStandard (parse! "C(C(0,W_2),C(W_2,W_3))") == false
#guard isStandard (parse! "C(C(C(W,0),0),C(C(0,W),C(W,W)))") == false
#guard isStandard (parse! "C(C(C(0,0),C(0,W_3)),C(C(0,0),C(W_2,W)))") == false
#guard isStandard (parse! "C(C(C(0,C(W,0)),C(C(W_2,0),C(0,0))),C(0,C(0,C(W,W_2))))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(0,0)),C(0,0)),C(C(C(W_2,W_2),C(0,0)),C(C(0,W),W)))") == false
#guard isStandard (parse! "C(C(C(C(W,C(W,0)),C(W_2,W_2)),C(0,C(W_2,W))),W_3)") == false
#guard isStandard (parse! "C(C(C(C(W,0),0),0),C(C(C(0,W),W),C(W,W)))") == false
#guard isStandard (parse! "C(C(C(0,W),0),C(C(0,0),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(C(0,C(0,0)),C(C(W_2,0),C(W_2,W_2))),0),C(C(W,C(C(0,0),W_2)),C(0,C(0,C(W_2,W)))))") == false
#guard isStandard (parse! "C(0,C(C(C(0,W),C(0,W)),C(0,C(0,0))))") == false
#guard isStandard (parse! "C(C(C(C(C(0,W),C(0,0)),W),C(C(C(W,0),C(0,0)),C(W,C(W,0)))),C(0,0))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),0),C(C(0,0),C(W,0))),0),0)") == false
#guard isStandard (parse! "C(C(C(W,W_3),C(0,W_3)),C(C(0,W_3),C(W,0)))") == false
#guard isStandard (parse! "C(C(C(C(C(0,W),W),C(0,0)),C(C(C(W,W),C(W,W)),C(C(0,0),0))),C(C(W,0),C(C(C(0,0),C(0,0)),C(0,W))))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),W),C(0,W)),C(C(C(0,0),C(W,W)),C(C(0,0),C(W,0)))),0)") == false
#guard isStandard (parse! "C(C(C(0,0),C(C(0,W),W)),C(0,W))") == false
#guard isStandard (parse! "C(0,C(C(C(W,W),C(0,0)),0))") == false
#guard isStandard (parse! "C(0,C(C(C(C(0,0),0),C(C(0,0),0)),C(C(W,C(0,0)),C(C(0,W),W))))") == false
#guard isStandard (parse! "C(C(0,0),C(0,C(C(0,0),0)))") == false
#guard isStandard (parse! "C(C(C(W_2,0),C(0,W_2)),C(C(0,0),C(0,W)))") == false
#guard isStandard (parse! "C(C(C(0,C(0,C(0,0))),0),0)") == true
#guard isStandard (parse! "C(C(C(C(0,W),0),C(C(0,W_2),C(C(0,W),0))),C(C(C(W,C(0,0)),C(C(0,W),C(0,0))),W))") == false
#guard isStandard (parse! "C(W,C(0,C(C(W_3,W_3),0)))") == false
#guard isStandard (parse! "C(C(C(C(W_3,0),C(0,0)),C(C(0,0),C(0,W_2))),C(C(W_3,C(W_3,0)),C(C(W_2,W_3),C(0,W_3))))") == false
#guard isStandard (parse! "C(C(C(C(C(W,0),C(0,0)),C(C(W,0),W_2)),W),C(C(C(C(0,W_2),0),0),C(C(C(0,0),C(0,0)),C(0,C(0,0)))))") == false
#guard isStandard (parse! "C(C(C(C(0,W),C(0,0)),C(C(0,0),C(0,W_2))),C(C(C(W_2,W_2),C(0,0)),C(C(0,W),C(W_2,0))))") == false
#guard isStandard (parse! "C(W,C(C(0,C(C(0,0),C(W,W_3))),C(C(W,C(W,0)),C(W_2,C(0,W_2)))))") == false
#guard isStandard (parse! "C(C(C(W,C(0,0)),C(0,C(W,0))),C(W,C(C(0,0),C(0,W))))") == false
#guard isStandard (parse! "C(C(C(0,C(C(W,0),C(0,0))),C(C(C(0,W),W),0)),C(C(W,C(W,C(W_2,W))),C(0,C(0,W_2))))") == false
#guard isStandard (parse! "C(C(C(C(0,0),W_2),0),C(C(W,C(W,0)),C(W_2,C(W_2,0))))") == false
#guard isStandard (parse! "C(C(C(0,W),W_2),C(C(W,0),C(0,0)))") == false
#guard isStandard (parse! "C(0,C(0,C(0,C(0,W_2))))") == true
#guard isStandard (parse! "C(C(C(C(C(0,0),C(0,W_3)),C(C(0,W_3),C(W_2,0))),C(C(C(W,W_2),C(0,W_2)),C(C(0,W_2),W_3))),0)") == false
#guard isStandard (parse! "C(C(C(0,W_3),C(0,0)),C(C(0,W),C(W,0)))") == false
#guard isStandard (parse! "C(C(C(W_2,C(C(W_3,W),C(0,0))),C(C(C(0,0),0),C(0,C(0,W)))),W_3)") == false
#guard isStandard (parse! "C(C(0,C(W,0)),W)") == true
#guard isStandard (parse! "C(C(C(C(C(0,0),C(0,0)),C(C(W_3,W_2),C(0,0))),0),W_2)") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(W_2,0)),0),0),C(C(C(0,C(W_2,0)),C(C(W_2,W_3),C(0,0))),C(C(C(0,W),C(0,W)),0)))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(W,0)),C(C(0,W),0)),C(0,C(0,W_2)))") == false
#guard isStandard (parse! "C(0,C(W,C(C(0,0),0)))") == false
#guard isStandard (parse! "C(C(C(C(0,0),W),0),C(C(0,C(0,0)),0))") == false
#guard isStandard (parse! "C(C(C(C(0,C(0,0)),C(W,C(W,W))),C(C(C(0,W),C(0,0)),0)),W)") == false
#guard isStandard (parse! "C(C(C(0,0),C(0,0)),C(W,C(0,W)))") == false
#guard isStandard (parse! "C(0,C(C(C(C(0,0),C(0,0)),C(0,C(0,W_2))),C(C(W_2,C(0,W)),C(C(0,W),W_3))))") == false
#guard isStandard (parse! "C(C(0,0),C(C(0,0),W_2))") == true
#guard isStandard (parse! "C(C(C(0,0),W),C(C(0,W),0))") == false
#guard isStandard (parse! "C(C(C(C(0,W),C(0,W_2)),0),C(C(C(0,W_3),C(W_3,W)),C(C(W,0),C(0,0))))") == false
#guard isStandard (parse! "C(C(0,C(C(0,W_2),W)),W)") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(0,0)),C(C(W,0),C(W,0))),C(C(C(W_2,0),C(0,0)),C(C(0,0),C(0,W)))),C(C(0,C(C(0,0),0)),C(C(0,0),W_2)))") == false
#guard isStandard (parse! "C(C(C(C(0,0),W_2),C(C(0,0),C(W,0))),C(C(C(W,0),C(0,0)),C(0,C(0,0))))") == false
#guard isStandard (parse! "C(C(C(0,W),C(C(0,C(0,0)),W_3)),C(W_2,C(C(0,C(0,W_3)),0)))") == false
#guard isStandard (parse! "C(C(W,C(0,W)),C(C(0,0),C(W,0)))") == false
#guard isStandard (parse! "C(C(W_2,0),C(W,W))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(0,0)),C(W,C(0,0))),C(C(C(0,0),C(W,0)),C(C(0,0),C(0,0)))),C(C(C(W,C(W,0)),C(C(W,0),0)),C(C(C(W,0),W),C(W,C(0,0)))))") == false
#guard isStandard (parse! "C(C(C(0,C(W,C(0,W))),C(C(0,C(W_2,0)),C(C(W,W),0))),C(C(W_2,0),C(0,C(0,C(0,0)))))") == false
#guard isStandard (parse! "C(W_3,C(0,W))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(W_2,0)),0),C(C(C(0,0),C(W_2,W_2)),C(C(0,0),C(0,W_2)))),W_2)") == false
#guard isStandard (parse! "C(W_3,C(C(C(W_2,0),0),W))") == false
#guard isStandard (parse! "C(C(W,0),C(C(C(0,C(0,0)),W),W))") == true
#guard isStandard (parse! "C(0,C(C(C(C(0,W_2),0),C(C(W,0),0)),C(W_2,C(W_2,C(W,0)))))") == false
#guard isStandard (parse! "C(0,C(C(W_2,0),C(W_2,0)))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(W_2,0)),C(C(W_3,0),C(W_3,W_3))),C(C(0,C(W,0)),W_3))") == false
#guard isStandard (parse! "C(W,C(C(C(0,0),C(W,W)),C(C(0,0),C(0,0))))") == false
#guard isStandard (parse! "C(0,C(C(W,0),0))") == false
#guard isStandard (parse! "C(C(C(C(0,0),W),C(0,C(W,0))),C(C(C(0,0),C(0,W)),W))") == false
#guard isStandard (parse! "C(C(C(C(0,0),W),C(0,W)),C(C(C(0,0),W),W))") == false
#guard isStandard (parse! "C(C(C(W,0),C(W_3,0)),C(C(W_2,W_2),C(W,0)))") == false
#guard isStandard (parse! "C(C(C(C(C(W,W),C(0,0)),0),W),0)") == false
#guard isStandard (parse! "C(0,C(C(0,C(0,0)),C(C(W,0),W_2)))") == true
#guard isStandard (parse! "C(C(C(C(0,W_2),C(W_2,0)),0),W)") == false
#guard isStandard (parse! "C(0,C(C(C(W_3,0),C(0,0)),C(C(0,0),C(0,W_3))))") == false
#guard isStandard (parse! "C(C(C(W,0),C(0,0)),C(C(0,0),C(0,W_2)))") == false
#guard isStandard (parse! "C(0,C(C(0,0),C(0,C(C(0,0),C(W_2,W_2)))))") == false
#guard isStandard (parse! "C(W,C(C(C(W,0),C(W,0)),W))") == false
#guard isStandard (parse! "C(C(W_3,C(C(0,W_2),C(W,0))),0)") == false
#guard isStandard (parse! "C(C(C(0,W_2),C(0,0)),C(C(W,W),0))") == false
#guard isStandard (parse! "C(C(C(C(C(0,W_2),C(0,W)),C(C(W_2,W_3),C(0,0))),C(C(C(0,W_2),W_3),W)),C(C(C(C(0,0),0),C(C(W,0),0)),C(C(W_3,C(0,0)),W)))") == false
#guard isStandard (parse! "C(W,C(C(C(0,C(0,W)),C(W,W)),C(0,C(0,0))))") == false
#guard isStandard (parse! "C(C(W,0),C(C(0,W),C(W,C(C(W,0),W))))") == false
#guard isStandard (parse! "C(W,C(C(W,W),C(0,W)))") == false
#guard isStandard (parse! "C(C(C(W_2,0),W),C(C(0,0),0))") == false
#guard isStandard (parse! "C(C(W,C(C(C(0,W),C(0,0)),C(0,C(W,0)))),C(C(C(C(0,0),C(W,0)),C(W,C(0,0))),0))") == false
#guard isStandard (parse! "C(C(C(C(0,W_2),C(W_3,0)),C(W_2,0)),0)") == false
#guard isStandard (parse! "C(C(W,C(C(0,W),C(0,0))),C(0,C(C(W,W),C(0,0))))") == false
#guard isStandard (parse! "C(C(C(C(W_2,W),C(0,0)),C(C(0,0),C(0,W))),C(C(C(W,W),0),C(C(0,0),C(0,W_2))))") == false
#guard isStandard (parse! "C(C(C(C(W_2,0),C(W_3,0)),W_3),C(C(C(W_3,0),W_2),C(C(0,0),C(W,0))))") == false
#guard isStandard (parse! "C(C(0,C(0,C(0,0))),C(C(0,C(W_2,0)),C(C(W_2,0),C(0,0))))") == false
#guard isStandard (parse! "C(C(0,C(C(C(0,0),W),C(C(0,0),C(0,0)))),C(C(C(C(W_2,0),C(0,0)),C(C(W_2,0),C(W,0))),C(C(C(0,W),W_2),C(C(0,0),C(0,W_2)))))") == false
#guard isStandard (parse! "C(C(C(W,C(W,0)),0),C(C(C(0,W),C(0,0)),C(C(W,W),C(0,0))))") == false
#guard isStandard (parse! "C(C(W_2,C(0,0)),C(C(0,W),C(0,0)))") == false
#guard isStandard (parse! "C(C(W_2,W_2),C(W,0))") == false
#guard isStandard (parse! "C(C(C(W_2,C(C(0,0),C(0,W_2))),C(0,W)),C(C(W_2,C(C(0,W),C(W_2,0))),C(C(C(0,0),C(W_2,0)),0)))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(0,W)),C(W,C(0,W_2))),C(0,W)),C(C(0,C(C(0,0),C(0,0))),C(C(C(0,W),C(0,0)),C(C(W_3,W),0))))") == false
#guard isStandard (parse! "C(C(C(C(C(W,0),C(0,W_3)),C(W_3,W)),W),0)") == false
#guard isStandard (parse! "C(0,C(C(W,0),W_3))") == true
#guard isStandard (parse! "C(C(C(0,0),0),C(0,C(0,0)))") == false
#guard isStandard (parse! "C(C(C(0,0),C(W_2,0)),C(C(W_3,0),C(0,0)))") == false
#guard isStandard (parse! "C(C(W,C(W,0)),C(C(W,W),W_2))") == true
#guard isStandard (parse! "C(C(0,C(C(W_2,0),0)),W)") == false
#guard isStandard (parse! "C(C(C(C(0,C(W,0)),W),0),C(C(C(0,C(0,W)),C(C(0,0),C(0,W_2))),C(C(C(0,W),C(0,0)),W)))") == false
#guard isStandard (parse! "C(C(W,W),C(C(W,0),C(0,W)))") == false
#guard isStandard (parse! "C(C(0,C(C(0,W),0)),C(C(C(0,W),C(0,0)),C(C(0,0),0)))") == false
#guard isStandard (parse! "C(C(C(W,0),C(0,0)),C(C(0,W_3),0))") == false
#guard isStandard (parse! "C(C(W,C(C(C(0,0),C(W,0)),C(W,C(0,W)))),C(C(C(W,C(W,0)),C(C(0,0),0)),C(C(C(W,W),W),0)))") == false
#guard isStandard (parse! "C(0,C(0,C(C(W,0),0)))") == false
#guard isStandard (parse! "C(C(0,C(W_2,W_2)),C(W,0))") == false
#guard isStandard (parse! "C(C(C(C(0,0),C(0,0)),W_2),0)") == false
#guard isStandard (parse! "C(C(W,C(0,0)),C(C(W,W),C(0,W)))") == false
#guard isStandard (parse! "C(C(0,C(C(0,0),C(W_2,W_2))),C(C(C(0,0),W),C(C(W_2,0),W)))") == false
#guard isStandard (parse! "C(C(W_2,W),C(W_2,0))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),0),C(C(0,0),0)),W),C(C(C(C(W,0),C(0,0)),W),C(C(0,W_2),C(C(W,0),C(0,0)))))") == false
#guard isStandard (parse! "C(C(C(W_3,C(W,0)),C(0,C(W_2,0))),W_3)") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(0,0)),W),C(0,C(C(W,0),C(W,W)))),C(C(0,C(C(W,W),C(0,0))),C(C(C(W,0),C(0,W)),C(0,C(W,0)))))") == false
#guard isStandard (parse! "C(C(C(W,W),C(W,C(C(0,0),0))),C(C(W,C(C(0,0),C(W,0))),C(C(C(0,W),C(0,W)),C(C(0,W),0))))") == false
#guard isStandard (parse! "C(C(C(C(C(W_2,0),C(0,0)),C(C(0,W_2),C(0,0))),C(C(C(0,0),0),C(C(W,W),W_2))),C(C(C(C(0,0),W),C(C(0,W_2),C(0,0))),C(C(0,C(0,0)),C(W,C(W_2,0)))))") == false
#guard isStandard (parse! "C(C(C(C(W,W_3),C(0,0)),0),0)") == false
#guard isStandard (parse! "C(C(C(W,0),0),C(C(W_3,W_3),C(W,W_2)))") == false
#guard isStandard (parse! "C(C(C(C(C(0,0),C(W,0)),C(C(0,0),0)),C(C(0,C(0,0)),C(C(W,0),0))),C(C(C(0,W),0),C(C(C(W,0),C(0,W)),C(C(0,W),W))))") == false
#guard isStandard (parse! "C(C(C(0,C(C(0,W_2),C(W_2,W_2))),C(W_2,C(0,C(W_2,0)))),0)") == false
#guard isStandard (parse! "C(W,C(C(C(C(0,W),C(W,0)),C(W,0)),C(C(C(0,W),C(0,0)),C(C(0,0),C(W,0)))))") == false
#guard isStandard (parse! "C(C(C(C(0,0),0),0),W)") == true
#guard isStandard (parse! "C(C(C(C(C(0,0),C(0,0)),C(W,C(0,W_2))),W_3),C(0,C(0,C(C(W_3,0),C(0,0)))))") == false
#guard isStandard (parse! "C(0,C(C(C(C(W,0),C(0,0)),C(C(W,W),W)),C(W,W)))") == false
#guard isStandard (parse! "C(C(C(W_3,0),0),C(C(C(W_3,W_3),C(0,0)),C(C(0,0),C(0,0))))") == false
#guard isStandard (parse! "C(C(W,C(0,W_3)),C(C(C(0,W_3),C(C(0,W),C(W_2,0))),0))") == false
#guard isStandard (parse! "C(C(0,C(0,C(0,0))),C(C(C(W_2,0),C(0,0)),C(C(W_2,W_2),C(W_2,0))))") == false
#guard isStandard (parse! "C(C(C(W_2,C(0,0)),C(C(W_2,W_3),C(0,0))),0)") == false
#guard isStandard (parse! "C(C(C(W,0),0),C(W,0))") == false
#guard isStandard (parse! "C(C(C(W_2,W),C(0,W)),0)") == false
#guard isStandard (parse! "C(C(0,C(W_2,0)),W_2)") == false
#guard isStandard (parse! "C(C(C(C(C(0,W),C(W,0)),C(C(W,0),C(0,0))),0),0)") == false
#guard isStandard (parse! "C(C(C(0,0),C(0,W)),C(C(0,W),C(0,0)))") == false
#guard isStandard (parse! "C(C(C(W_2,0),C(0,0)),C(C(0,W_2),C(W_2,W_3)))") == false
#guard isStandard (parse! "C(0,C(C(C(C(0,W),C(0,W)),C(0,C(W,W))),C(C(C(0,0),C(W_2,0)),W_2)))") == false
#guard isStandard (parse! "C(C(C(W_3,0),C(0,W_2)),0)") == false
#guard isStandard (parse! "C(0,C(C(0,W),C(C(0,W),0)))") == true
#guard isStandardN (parse! "C(0,C(C(0,W),C(C(0,W),0)))") 1 == true
#guard isStandard (parse! "C(0,C(C(C(W,C(W,0)),W),W))") == true
#guard isStandardN (parse! "C(0,C(C(C(W,C(W,0)),W),W))") 1 == true
#guard isStandard (parse! "C(0,C(C(C(C(W,W),W),W),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(C(W,W),W),W),0))") 1 == true
#guard isStandard (parse! "C(0,C(0,C(0,W)))") == true
#guard isStandardN (parse! "C(0,C(0,C(0,W)))") 1 == true
#guard isStandard (parse! "C(C(W,C(C(0,C(0,W)),0)),W)") == true
#guard isStandardN (parse! "C(C(W,C(C(0,C(0,W)),0)),W)") 1 == true
#guard isStandard (parse! "C(0,C(C(0,C(0,C(W,W))),W))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(0,C(W,W))),W))") 1 == true
#guard isStandard (parse! "C(0,C(C(W,C(W,0)),W))") == true
#guard isStandardN (parse! "C(0,C(C(W,C(W,0)),W))") 1 == true
#guard isStandard (parse! "C(C(0,0),C(C(0,C(W,0)),W))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(0,C(W,0)),W))") 1 == true
#guard isStandard (parse! "C(W,C(C(0,C(C(W,W),W)),W))") == true
#guard isStandardN (parse! "C(W,C(C(0,C(C(W,W),W)),W))") 1 == true
#guard isStandard (parse! "C(C(C(0,C(C(W,0),W)),0),W)") == true
#guard isStandardN (parse! "C(C(C(0,C(C(W,0),W)),0),W)") 1 == true
#guard isStandard (parse! "C(0,C(C(0,C(0,0)),W))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(0,0)),W))") 1 == true
#guard isStandard (parse! "C(0,C(0,C(0,C(W,C(W,0)))))") == true
#guard isStandardN (parse! "C(0,C(0,C(0,C(W,C(W,0)))))") 1 == true
#guard isStandard (parse! "C(C(C(0,C(W,C(W,0))),W),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(W,C(W,0))),W),0)") 1 == true
#guard isStandard (parse! "C(C(0,C(C(0,C(0,0)),0)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(0,C(0,0)),0)),0)") 1 == true
#guard isStandard (parse! "C(W,C(W,C(W,C(W,0))))") == true
#guard isStandardN (parse! "C(W,C(W,C(W,C(W,0))))") 1 == true
#guard isStandard (parse! "C(C(W,C(W,0)),C(C(W,W),0))") == true
#guard isStandardN (parse! "C(C(W,C(W,0)),C(C(W,W),0))") 1 == true
#guard isStandard (parse! "C(C(C(C(0,0),C(W,0)),W),0)") == true
#guard isStandardN (parse! "C(C(C(C(0,0),C(W,0)),W),0)") 1 == true
#guard isStandard (parse! "C(C(0,0),C(W,C(C(W,W),0)))") == true
#guard isStandardN (parse! "C(C(0,0),C(W,C(C(W,W),0)))") 1 == true
#guard isStandard (parse! "C(C(C(C(0,W),0),C(W,W)),0)") == true
#guard isStandardN (parse! "C(C(C(C(0,W),0),C(W,W)),0)") 1 == true
#guard isStandard (parse! "C(C(0,C(W,0)),C(W,C(W,0)))") == true
#guard isStandardN (parse! "C(C(0,C(W,0)),C(W,C(W,0)))") 1 == true
#guard isStandard (parse! "C(C(C(0,C(0,C(0,0))),W),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(0,C(0,0))),W),0)") 1 == true
#guard isStandard (parse! "C(W,C(C(C(W,C(W,W)),W),W))") == true
#guard isStandardN (parse! "C(W,C(C(C(W,C(W,W)),W),W))") 1 == true
#guard isStandard (parse! "C(C(W,C(C(C(0,W),W),W)),0)") == true
#guard isStandardN (parse! "C(C(W,C(C(C(0,W),W),W)),0)") 1 == true
#guard isStandard (parse! "C(0,C(C(W,C(W,C(W,0))),W))") == true
#guard isStandardN (parse! "C(0,C(C(W,C(W,C(W,0))),W))") 1 == true
#guard isStandard (parse! "C(C(W,0),C(C(C(0,0),W),0))") == true
#guard isStandardN (parse! "C(C(W,0),C(C(C(0,0),W),0))") 1 == true
#guard isStandard (parse! "C(C(W,W),C(C(C(0,W),W),0))") == true
#guard isStandardN (parse! "C(C(W,W),C(C(C(0,W),W),0))") 1 == true
#guard isStandard (parse! "C(C(W,W),0)") == true
#guard isStandardN (parse! "C(C(W,W),0)") 1 == true
#guard isStandard (parse! "C(W,C(C(C(C(W,0),W),W),W))") == true
#guard isStandardN (parse! "C(W,C(C(C(C(W,0),W),W),W))") 1 == true
#guard isStandard (parse! "C(C(W,0),C(C(W,C(W,W)),W))") == true
#guard isStandardN (parse! "C(C(W,0),C(C(W,C(W,W)),W))") 1 == true
#guard isStandard (parse! "C(C(C(0,C(C(0,W),0)),W),W)") == true
#guard isStandardN (parse! "C(C(C(0,C(C(0,W),0)),W),W)") 1 == true
#guard isStandard (parse! "C(0,C(C(0,C(W,W)),W))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(W,W)),W))") 1 == true
#guard isStandard (parse! "C(C(C(C(C(W,W),W),W),W),0)") == true
#guard isStandardN (parse! "C(C(C(C(C(W,W),W),W),W),0)") 1 == true
#guard isStandard (parse! "C(C(0,W),C(C(0,W),0))") == true
#guard isStandardN (parse! "C(C(0,W),C(C(0,W),0))") 1 == true
#guard isStandard (parse! "C(C(0,C(W,0)),C(W,W))") == true
#guard isStandardN (parse! "C(C(0,C(W,0)),C(W,W))") 1 == true
#guard isStandard (parse! "C(0,C(W,C(C(C(0,0),W),0)))") == true
#guard isStandardN (parse! "C(0,C(W,C(C(C(0,0),W),0)))") 1 == true
#guard isStandard (parse! "C(0,C(C(0,C(W,0)),W))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(W,0)),W))") 1 == true
#guard isStandard (parse! "C(0,C(0,C(0,C(0,W))))") == true
#guard isStandardN (parse! "C(0,C(0,C(0,C(0,W))))") 1 == true
#guard isStandard (parse! "C(C(C(C(C(W,0),W),W),W),W)") == true
#guard isStandardN (parse! "C(C(C(C(C(W,0),W),W),W),W)") 1 == true
#guard isStandard (parse! "C(W,C(W,C(C(C(W,0),W),W)))") == true
#guard isStandardN (parse! "C(W,C(W,C(C(C(W,0),W),W)))") 1 == true
#guard isStandard (parse! "C(C(C(C(0,C(W,W)),0),W),W)") == true
#guard isStandardN (parse! "C(C(C(C(0,C(W,W)),0),W),W)") 1 == true
#guard isStandard (parse! "C(0,C(0,C(W,0)))") == true
#guard isStandardN (parse! "C(0,C(0,C(W,0)))") 1 == true
#guard isStandard (parse! "C(0,C(W,C(C(W,W),0)))") == true
#guard isStandardN (parse! "C(0,C(W,C(C(W,W),0)))") 1 == true
#guard isStandard (parse! "C(W,C(C(C(C(W,W),W),W),W))") == true
#guard isStandardN (parse! "C(W,C(C(C(C(W,W),W),W),W))") 1 == true
#guard isStandard (parse! "C(C(C(C(0,W),0),C(W,W)),W)") == true
#guard isStandardN (parse! "C(C(C(C(0,W),0),C(W,W)),W)") 1 == true
#guard isStandard (parse! "C(C(0,C(W,C(W,C(W,0)))),W)") == true
#guard isStandardN (parse! "C(C(0,C(W,C(W,C(W,0)))),W)") 1 == true
#guard isStandard (parse! "C(C(W,C(W,W)),0)") == true
#guard isStandardN (parse! "C(C(W,C(W,W)),0)") 1 == true
#guard isStandard (parse! "C(C(0,C(0,0)),W)") == true
#guard isStandardN (parse! "C(C(0,C(0,0)),W)") 1 == true
#guard isStandard (parse! "C(C(0,0),C(C(0,C(0,W)),W))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(0,C(0,W)),W))") 1 == true
#guard isStandard (parse! "C(C(0,C(0,C(W,0))),C(W,0))") == true
#guard isStandardN (parse! "C(C(0,C(0,C(W,0))),C(W,0))") 1 == true
#guard isStandard (parse! "C(C(0,C(0,C(0,C(W,W)))),W)") == true
#guard isStandardN (parse! "C(C(0,C(0,C(0,C(W,W)))),W)") 1 == true
#guard isStandard (parse! "C(C(W,W),C(C(0,C(W,W)),W))") == true
#guard isStandardN (parse! "C(C(W,W),C(C(0,C(W,W)),W))") 1 == true
#guard isStandard (parse! "C(0,C(C(0,C(0,W)),W))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(0,W)),W))") 1 == true
#guard isStandard (parse! "C(C(C(0,0),C(C(0,0),W)),W)") == true
#guard isStandardN (parse! "C(C(C(0,0),C(C(0,0),W)),W)") 1 == true
#guard isStandard (parse! "C(C(W,0),C(C(W,0),C(W,W)))") == true
#guard isStandardN (parse! "C(C(W,0),C(C(W,0),C(W,W)))") 1 == true
#guard isStandard (parse! "C(0,C(0,C(C(W,0),C(W,0))))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(W,0),C(W,0))))") 1 == true
#guard isStandard (parse! "C(C(C(W,C(C(W,W),W)),W),0)") == true
#guard isStandardN (parse! "C(C(C(W,C(C(W,W),W)),W),0)") 1 == true
#guard isStandard (parse! "C(C(C(C(W,C(W,W)),W),W),W)") == true
#guard isStandardN (parse! "C(C(C(C(W,C(W,W)),W),W),W)") 1 == true
#guard isStandard (parse! "C(C(C(0,C(0,C(0,0))),0),W)") == true
#guard isStandardN (parse! "C(C(C(0,C(0,C(0,0))),0),W)") 1 == true
#guard isStandard (parse! "C(C(0,0),C(W,C(C(W,W),W)))") == true
#guard isStandardN (parse! "C(C(0,0),C(W,C(C(W,W),W)))") 1 == true
#guard isStandard (parse! "C(C(0,C(C(0,0),W)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(0,0),W)),0)") 1 == true
#guard isStandard (parse! "C(C(0,C(0,C(0,0))),C(W,W))") == true
#guard isStandardN (parse! "C(C(0,C(0,C(0,0))),C(W,W))") 1 == true
#guard isStandard (parse! "C(W,C(C(W,W),C(C(W,W),0)))") == true
#guard isStandardN (parse! "C(W,C(C(W,W),C(C(W,W),0)))") 1 == true
#guard isStandard (parse! "C(0,C(C(0,C(W,C(W,W))),W))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(W,C(W,W))),W))") 1 == true
#guard isStandard (parse! "C(C(0,C(0,C(0,C(0,0)))),0)") == true
#guard isStandardN (parse! "C(C(0,C(0,C(0,C(0,0)))),0)") 1 == true
#guard isStandard (parse! "C(C(C(C(W,W),W),0),C(W,W))") == true
#guard isStandardN (parse! "C(C(C(C(W,W),W),0),C(W,W))") 1 == true
#guard isStandard (parse! "C(C(0,0),0)") == true
#guard isStandardN (parse! "C(C(0,0),0)") 1 == true
#guard isStandard (parse! "C(C(W,W),C(C(W,W),0))") == true
#guard isStandardN (parse! "C(C(W,W),C(C(W,W),0))") 1 == true
#guard isStandard (parse! "C(0,0)") == true
#guard isStandardN (parse! "C(0,0)") 1 == true
#guard isStandard (parse! "C(C(W,C(C(C(W,0),W),0)),W)") == true
#guard isStandardN (parse! "C(C(W,C(C(C(W,0),W),0)),W)") 1 == true
#guard isStandard (parse! "C(C(0,C(0,W)),0)") == true
#guard isStandardN (parse! "C(C(0,C(0,W)),0)") 1 == true
#guard isStandard (parse! "C(C(0,C(C(0,W),0)),W)") == true
#guard isStandardN (parse! "C(C(0,C(C(0,W),0)),W)") 1 == true
#guard isStandard (parse! "C(0,C(C(0,W),W))") == true
#guard isStandardN (parse! "C(0,C(C(0,W),W))") 1 == true
#guard isStandard (parse! "C(C(C(C(0,0),C(W,W)),0),W)") == true
#guard isStandardN (parse! "C(C(C(C(0,0),C(W,W)),0),W)") 1 == true
#guard isStandard (parse! "C(C(0,0),C(C(C(W,W),0),W))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(C(W,W),0),W))") 1 == true
#guard isStandard (parse! "C(C(C(C(C(W,0),W),W),0),W)") == true
#guard isStandardN (parse! "C(C(C(C(C(W,0),W),W),0),W)") 1 == true
#guard isStandard (parse! "C(W,C(W,C(W,C(C(W,W),W))))") == true
#guard isStandardN (parse! "C(W,C(W,C(W,C(C(W,W),W))))") 1 == true
#guard isStandard (parse! "C(C(C(0,C(W,C(W,0))),W),W)") == true
#guard isStandardN (parse! "C(C(C(0,C(W,C(W,0))),W),W)") 1 == true
#guard isStandard (parse! "C(0,C(W,C(W,C(C(0,W),W))))") == true
#guard isStandardN (parse! "C(0,C(W,C(W,C(C(0,W),W))))") 1 == true
#guard isStandard (parse! "C(C(0,0),C(C(0,0),0))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(0,0),0))") 1 == true
#guard isStandard (parse! "C(C(C(C(W,W),W),W),W)") == true
#guard isStandardN (parse! "C(C(C(C(W,W),W),W),W)") 1 == true
#guard isStandard (parse! "C(C(0,0),C(C(0,W),W))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(0,W),W))") 1 == true
#guard isStandard (parse! "C(C(C(0,0),0),0)") == true
#guard isStandardN (parse! "C(C(C(0,0),0),0)") 1 == true
#guard isStandard (parse! "C(C(0,0),C(C(0,0),C(W,0)))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(0,0),C(W,0)))") 1 == true
#guard isStandard (parse! "C(C(C(C(0,C(0,W)),W),0),W)") == true
#guard isStandardN (parse! "C(C(C(C(0,C(0,W)),W),0),W)") 1 == true
#guard isStandard (parse! "C(C(C(C(0,0),W),W),W)") == true
#guard isStandardN (parse! "C(C(C(C(0,0),W),W),W)") 1 == true
#guard isStandard (parse! "C(C(C(0,0),W),C(C(W,W),W))") == true
#guard isStandardN (parse! "C(C(C(0,0),W),C(C(W,W),W))") 1 == true
#guard isStandard (parse! "C(C(W,C(C(0,W),0)),W)") == true
#guard isStandardN (parse! "C(C(W,C(C(0,W),0)),W)") 1 == true
#guard isStandard (parse! "C(C(W,C(C(C(W,0),W),W)),0)") == true
#guard isStandardN (parse! "C(C(W,C(C(C(W,0),W),W)),0)") 1 == true
#guard isStandard (parse! "C(C(C(0,C(C(W,0),W)),W),W)") == true
#guard isStandardN (parse! "C(C(C(0,C(C(W,0),W)),W),W)") 1 == true
#guard isStandard (parse! "C(C(0,0),C(C(W,0),W))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(W,0),W))") 1 == true
#guard isStandard (parse! "C(C(0,0),C(C(W,C(W,W)),0))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(W,C(W,W)),0))") 1 == true
#guard isStandard (parse! "C(0,C(0,C(0,C(W,0))))") == true
#guard isStandardN (parse! "C(0,C(0,C(0,C(W,0))))") 1 == true
#guard isStandard (parse! "C(C(C(C(0,0),C(W,W)),W),0)") == true
#guard isStandardN (parse! "C(C(C(C(0,0),C(W,W)),W),0)") 1 == true
#guard isStandard (parse! "C(0,C(W,C(C(C(W,0),W),0)))") == true
#guard isStandardN (parse! "C(0,C(W,C(C(C(W,0),W),0)))") 1 == true
#guard isStandard (parse! "C(0,C(0,C(C(0,C(0,W)),0)))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(0,C(0,W)),0)))") 1 == true
#guard isStandard (parse! "C(C(C(C(0,0),0),C(W,0)),W)") == true
#guard isStandardN (parse! "C(C(C(C(0,0),0),C(W,0)),W)") 1 == true
#guard isStandard (parse! "C(0,C(0,C(C(0,0),C(W,0))))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(0,0),C(W,0))))") 1 == true
#guard isStandard (parse! "C(C(W,C(C(C(0,W),W),0)),W)") == true
#guard isStandardN (parse! "C(C(W,C(C(C(0,W),W),0)),W)") 1 == true
#guard isStandard (parse! "C(C(0,C(0,C(C(W,W),W))),0)") == true
#guard isStandardN (parse! "C(C(0,C(0,C(C(W,W),W))),0)") 1 == true
#guard isStandard (parse! "C(0,C(W,C(W,C(W,W))))") == true
#guard isStandardN (parse! "C(0,C(W,C(W,C(W,W))))") 1 == true
#guard isStandard (parse! "C(C(C(W,C(W,C(W,W))),W),W)") == true
#guard isStandardN (parse! "C(C(C(W,C(W,C(W,W))),W),W)") 1 == true
#guard isStandard (parse! "C(0,C(C(0,0),C(W,0)))") == true
#guard isStandardN (parse! "C(0,C(C(0,0),C(W,0)))") 1 == true
#guard isStandard (parse! "C(C(C(C(C(0,0),0),0),W),0)") == true
#guard isStandardN (parse! "C(C(C(C(C(0,0),0),0),W),0)") 1 == true
#guard isStandard (parse! "C(C(C(C(C(0,0),0),0),W),W)") == true
#guard isStandardN (parse! "C(C(C(C(C(0,0),0),0),W),W)") 1 == true
#guard isStandard (parse! "C(C(W,0),C(W,C(C(W,W),0)))") == true
#guard isStandardN (parse! "C(C(W,0),C(W,C(C(W,W),0)))") 1 == true
#guard isStandard (parse! "C(C(C(0,C(0,W)),0),C(W,W))") == true
#guard isStandardN (parse! "C(C(C(0,C(0,W)),0),C(W,W))") 1 == true
#guard isStandard (parse! "C(0,C(0,C(W,C(W,0))))") == true
#guard isStandardN (parse! "C(0,C(0,C(W,C(W,0))))") 1 == true
#guard isStandard (parse! "C(C(0,0),C(W,C(C(0,W),W)))") == true
#guard isStandardN (parse! "C(C(0,0),C(W,C(C(0,W),W)))") 1 == true
#guard isStandard (parse! "C(C(C(C(W,0),W),W),W)") == true
#guard isStandardN (parse! "C(C(C(C(W,0),W),W),W)") 1 == true
#guard isStandard (parse! "C(C(0,C(C(C(0,W),0),W)),W)") == true
#guard isStandardN (parse! "C(C(0,C(C(C(0,W),0),W)),W)") 1 == true
#guard isStandard (parse! "C(W,C(W,C(W,C(C(0,W),0))))") == true
#guard isStandardN (parse! "C(W,C(W,C(W,C(C(0,W),0))))") 1 == true
#guard isStandard (parse! "C(C(C(C(W,0),W),0),C(W,W))") == true
#guard isStandardN (parse! "C(C(C(C(W,0),W),0),C(W,W))") 1 == true
#guard isStandard (parse! "C(W,C(C(C(C(W,W),W),W),0))") == true
#guard isStandardN (parse! "C(W,C(C(C(C(W,W),W),W),0))") 1 == true
#guard isStandard (parse! "C(0,C(C(C(0,C(0,0)),W),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(0,C(0,0)),W),0))") 1 == true
#guard isStandard (parse! "C(0,C(0,C(C(0,C(W,W)),0)))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(0,C(W,W)),0)))") 1 == true
#guard isStandard (parse! "C(C(W,C(C(0,W),W)),W)") == true
#guard isStandardN (parse! "C(C(W,C(C(0,W),W)),W)") 1 == true
#guard isStandard (parse! "C(W,C(C(C(W,C(W,0)),W),0))") == true
#guard isStandardN (parse! "C(W,C(C(C(W,C(W,0)),W),0))") 1 == true
#guard isStandard (parse! "C(C(C(C(0,C(W,W)),W),W),0)") == true
#guard isStandardN (parse! "C(C(C(C(0,C(W,W)),W),W),0)") 1 == true
#guard isStandard (parse! "C(C(0,0),C(C(C(W,0),W),0))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(C(W,0),W),0))") 1 == true
#guard isStandard (parse! "C(C(C(C(C(W,W),0),W),W),W)") == true
#guard isStandardN (parse! "C(C(C(C(C(W,W),0),W),W),W)") 1 == true
#guard isStandard (parse! "C(C(0,C(C(0,0),0)),W)") == true
#guard isStandardN (parse! "C(C(0,C(C(0,0),0)),W)") 1 == true
#guard isStandard (parse! "C(C(0,C(C(0,W),W)),W)") == true
#guard isStandardN (parse! "C(C(0,C(C(0,W),W)),W)") 1 == true
#guard isStandard (parse! "C(C(0,C(C(C(W,W),W),0)),W)") == true
#guard isStandardN (parse! "C(C(0,C(C(C(W,W),W),0)),W)") 1 == true
#guard isStandard (parse! "C(C(0,C(0,0)),C(W,C(W,W)))") == true
#guard isStandardN (parse! "C(C(0,C(0,0)),C(W,C(W,W)))") 1 == true
#guard isStandard (parse! "C(C(C(C(C(0,W),0),W),0),W)") == true
#guard isStandardN (parse! "C(C(C(C(C(0,W),0),W),0),W)") 1 == true
#guard isStandard (parse! "C(C(W,0),C(C(0,W),0))") == true
#guard isStandardN (parse! "C(C(W,0),C(C(0,W),0))") 1 == true
#guard isStandard (parse! "C(0,C(C(C(0,C(W,W)),W),W))") == true
#guard isStandardN (parse! "C(0,C(C(C(0,C(W,W)),W),W))") 1 == true
#guard isStandard (parse! "C(W,C(C(W,C(W,C(W,W))),W))") == true
#guard isStandardN (parse! "C(W,C(C(W,C(W,C(W,W))),W))") 1 == true
#guard isStandard (parse! "C(0,C(C(C(C(0,W),0),W),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(C(0,W),0),W),0))") 1 == true
#guard isStandard (parse! "C(C(C(C(0,W),W),W),W)") == true
#guard isStandardN (parse! "C(C(C(C(0,W),W),W),W)") 1 == true
#guard isStandard (parse! "C(C(C(C(0,0),C(W,0)),W),W)") == true
#guard isStandardN (parse! "C(C(C(C(0,0),C(W,0)),W),W)") 1 == true
#guard isStandard (parse! "C(0,C(W,C(W,C(C(W,W),W))))") == true
#guard isStandardN (parse! "C(0,C(W,C(W,C(C(W,W),W))))") 1 == true
#guard isStandard (parse! "C(0,C(C(0,C(C(W,W),W)),0))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(C(W,W),W)),0))") 1 == true
#guard isStandard (parse! "C(C(C(0,0),0),C(C(W,W),0))") == true
#guard isStandardN (parse! "C(C(C(0,0),0),C(C(W,W),0))") 1 == true
#guard isStandard (parse! "C(C(C(W,W),0),C(W,W))") == true
#guard isStandardN (parse! "C(C(C(W,W),0),C(W,W))") 1 == true
#guard isStandard (parse! "C(C(C(C(0,C(0,0)),0),W),W)") == true
#guard isStandardN (parse! "C(C(C(C(0,C(0,0)),0),W),W)") 1 == true
#guard isStandard (parse! "C(C(C(C(0,0),0),C(W,W)),W)") == true
#guard isStandardN (parse! "C(C(C(C(0,0),0),C(W,W)),W)") 1 == true
#guard isStandard (parse! "C(0,C(C(C(0,W),0),C(W,W)))") == true
#guard isStandardN (parse! "C(0,C(C(C(0,W),0),C(W,W)))") 1 == true
#guard isStandard (parse! "C(C(W,0),C(C(C(0,0),W),W))") == true
#guard isStandardN (parse! "C(C(W,0),C(C(C(0,0),W),W))") 1 == true
#guard isStandard (parse! "C(C(W,C(W,C(W,W))),0)") == true
#guard isStandardN (parse! "C(C(W,C(W,C(W,W))),0)") 1 == true
#guard isStandard (parse! "C(C(C(C(C(0,0),W),0),W),0)") == true
#guard isStandardN (parse! "C(C(C(C(C(0,0),W),0),W),0)") 1 == true
#guard isStandard (parse! "C(0,C(0,C(C(0,C(0,0)),W)))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(0,C(0,0)),W)))") 1 == true
#guard isStandard (parse! "C(W,C(C(0,C(0,C(0,W))),W))") == true
#guard isStandardN (parse! "C(W,C(C(0,C(0,C(0,W))),W))") 1 == true
#guard isStandard (parse! "C(0,C(0,W))") == true
#guard isStandardN (parse! "C(0,C(0,W))") 1 == true
#guard isStandard (parse! "C(0,C(C(C(C(0,W),W),W),W))") == true
#guard isStandardN (parse! "C(0,C(C(C(C(0,W),W),W),W))") 1 == true
#guard isStandard (parse! "C(0,C(C(C(0,0),W),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(0,0),W),0))") 1 == true
#guard isStandard (parse! "C(0,C(C(W,W),C(C(W,W),0)))") == true
#guard isStandardN (parse! "C(0,C(C(W,W),C(C(W,W),0)))") 1 == true
#guard isStandard (parse! "C(W,C(W,W))") == true
#guard isStandardN (parse! "C(W,C(W,W))") 1 == true
#guard isStandard (parse! "C(C(W,W),C(C(W,C(W,W)),0))") == true
#guard isStandardN (parse! "C(C(W,W),C(C(W,C(W,W)),0))") 1 == true
#guard isStandard (parse! "C(C(0,0),C(C(C(0,W),0),W))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(C(0,W),0),W))") 1 == true
#guard isStandard (parse! "C(W,C(W,C(C(C(0,0),W),0)))") == true
#guard isStandardN (parse! "C(W,C(W,C(C(C(0,0),W),0)))") 1 == true
#guard isStandard (parse! "C(C(0,C(0,C(C(W,W),0))),W)") == true
#guard isStandardN (parse! "C(C(0,C(0,C(C(W,W),0))),W)") 1 == true
#guard isStandard (parse! "C(C(0,C(C(W,W),W)),W)") == true
#guard isStandardN (parse! "C(C(0,C(C(W,W),W)),W)") 1 == true
#guard isStandard (parse! "C(C(C(0,C(C(0,0),W)),W),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(C(0,0),W)),W),0)") 1 == true
#guard isStandard (parse! "C(0,C(0,C(0,C(C(W,W),W))))") == true
#guard isStandardN (parse! "C(0,C(0,C(0,C(C(W,W),W))))") 1 == true
#guard isStandard (parse! "C(C(C(C(0,C(0,0)),W),0),W)") == true
#guard isStandardN (parse! "C(C(C(C(0,C(0,0)),W),0),W)") 1 == true
#guard isStandard (parse! "C(C(C(0,C(0,C(W,0))),W),W)") == true
#guard isStandardN (parse! "C(C(C(0,C(0,C(W,0))),W),W)") 1 == true
#guard isStandard (parse! "C(C(0,W),C(C(C(W,W),W),0))") == true
#guard isStandardN (parse! "C(C(0,W),C(C(C(W,W),W),0))") 1 == true
#guard isStandard (parse! "C(W,C(C(W,C(W,C(W,W))),0))") == true
#guard isStandardN (parse! "C(W,C(C(W,C(W,C(W,W))),0))") 1 == true
#guard isStandard (parse! "C(0,C(C(C(W,C(W,W)),0),W))") == true
#guard isStandardN (parse! "C(0,C(C(C(W,C(W,W)),0),W))") 1 == true
#guard isStandard (parse! "C(W,C(C(C(C(0,0),0),W),0))") == true
#guard isStandardN (parse! "C(W,C(C(C(C(0,0),0),W),0))") 1 == true
#guard isStandard (parse! "C(W,C(W,C(C(W,W),0)))") == true
#guard isStandardN (parse! "C(W,C(W,C(C(W,W),0)))") 1 == true
#guard isStandard (parse! "C(C(C(W,C(C(0,W),0)),W),0)") == true
#guard isStandardN (parse! "C(C(C(W,C(C(0,W),0)),W),0)") 1 == true
#guard isStandard (parse! "C(C(C(C(C(0,W),W),W),W),0)") == true
#guard isStandardN (parse! "C(C(C(C(C(0,W),W),W),W),0)") 1 == true
#guard isStandard (parse! "C(C(C(0,0),C(W,W)),0)") == true
#guard isStandardN (parse! "C(C(C(0,0),C(W,W)),0)") 1 == true
#guard isStandard (parse! "C(W,C(C(W,C(C(0,W),W)),W))") == true
#guard isStandardN (parse! "C(W,C(C(W,C(C(0,W),W)),W))") 1 == true
#guard isStandard (parse! "C(0,C(C(0,C(C(0,0),W)),W))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(C(0,0),W)),W))") 1 == true
#guard isStandard (parse! "C(C(0,C(C(C(W,W),W),W)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(C(W,W),W),W)),0)") 1 == true
#guard isStandard (parse! "C(C(C(W,0),C(C(W,0),W)),W)") == true
#guard isStandardN (parse! "C(C(C(W,0),C(C(W,0),W)),W)") 1 == true
#guard isStandard (parse! "C(W,C(C(C(0,C(W,0)),W),0))") == true
#guard isStandardN (parse! "C(W,C(C(C(0,C(W,0)),W),0))") 1 == true
#guard isStandard (parse! "C(W,C(C(C(W,0),W),0))") == true
#guard isStandardN (parse! "C(W,C(C(C(W,0),W),0))") 1 == true
#guard isStandard (parse! "C(0,C(W,W))") == true
#guard isStandardN (parse! "C(0,C(W,W))") 1 == true
#guard isStandard (parse! "C(0,C(0,C(0,C(C(W,W),0))))") == true
#guard isStandardN (parse! "C(0,C(0,C(0,C(C(W,W),0))))") 1 == true
#guard isStandard (parse! "C(C(C(0,C(C(0,W),W)),W),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(C(0,W),W)),W),0)") 1 == true
#guard isStandard (parse! "C(0,C(C(0,C(0,C(0,W))),W))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(0,C(0,W))),W))") 1 == true
#guard isStandard (parse! "C(W,C(C(C(0,0),W),W))") == true
#guard isStandardN (parse! "C(W,C(C(C(0,0),W),W))") 1 == true
#guard isStandard (parse! "C(C(C(0,C(0,C(W,W))),W),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(0,C(W,W))),W),0)") 1 == true
#guard isStandard (parse! "C(0,C(C(0,W),C(C(W,W),W)))") == true
#guard isStandardN (parse! "C(0,C(C(0,W),C(C(W,W),W)))") 1 == true
#guard isStandard (parse! "C(C(C(C(C(0,W),0),W),W),0)") == true
#guard isStandardN (parse! "C(C(C(C(C(0,W),0),W),W),0)") 1 == true
#guard isStandard (parse! "C(0,C(W,C(C(0,C(W,W)),W)))") == true
#guard isStandardN (parse! "C(0,C(W,C(C(0,C(W,W)),W)))") 1 == true
#guard isStandard (parse! "C(W,C(C(C(0,C(W,W)),W),W))") == true
#guard isStandardN (parse! "C(W,C(C(C(0,C(W,W)),W),W))") 1 == true
#guard isStandard (parse! "C(C(W,C(W,0)),W)") == true
#guard isStandardN (parse! "C(C(W,C(W,0)),W)") 1 == true
#guard isStandard (parse! "C(0,C(C(C(0,C(W,W)),0),W))") == true
#guard isStandardN (parse! "C(0,C(C(C(0,C(W,W)),0),W))") 1 == true
#guard isStandard (parse! "C(C(0,C(0,0)),C(C(0,W),W))") == true
#guard isStandardN (parse! "C(C(0,C(0,0)),C(C(0,W),W))") 1 == true
#guard isStandard (parse! "C(W,C(C(C(0,C(0,W)),W),W))") == true
#guard isStandardN (parse! "C(W,C(C(C(0,C(0,W)),W),W))") 1 == true
#guard isStandard (parse! "C(0,C(C(0,C(C(W,W),W)),W))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(C(W,W),W)),W))") 1 == true
#guard isStandard (parse! "C(C(C(C(C(0,0),W),W),0),W)") == true
#guard isStandardN (parse! "C(C(C(C(C(0,0),W),W),0),W)") 1 == true
#guard isStandard (parse! "C(W,C(W,C(C(C(W,W),W),0)))") == true
#guard isStandardN (parse! "C(W,C(W,C(C(C(W,W),W),0)))") 1 == true
#guard isStandard (parse! "C(C(C(C(C(W,W),0),W),W),0)") == true
#guard isStandardN (parse! "C(C(C(C(C(W,W),0),W),W),0)") 1 == true
#guard isStandard (parse! "C(C(W,C(W,0)),C(W,C(W,W)))") == true
#guard isStandardN (parse! "C(C(W,C(W,0)),C(W,C(W,W)))") 1 == true
#guard isStandard (parse! "C(0,C(0,C(C(C(0,0),W),0)))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(C(0,0),W),0)))") 1 == true
#guard isStandard (parse! "C(0,C(W,C(W,0)))") == true
#guard isStandardN (parse! "C(0,C(W,C(W,0)))") 1 == true
#guard isStandard (parse! "C(C(C(0,C(C(0,0),W)),0),W)") == true
#guard isStandardN (parse! "C(C(C(0,C(C(0,0),W)),0),W)") 1 == true
#guard isStandard (parse! "C(W,C(W,C(C(0,W),W)))") == true
#guard isStandardN (parse! "C(W,C(W,C(C(0,W),W)))") 1 == true
#guard isStandard (parse! "C(0,C(C(C(W,W),0),C(W,W)))") == true
#guard isStandardN (parse! "C(0,C(C(C(W,W),0),C(W,W)))") 1 == true
#guard isStandard (parse! "C(0,C(C(C(0,0),0),C(W,W)))") == true
#guard isStandardN (parse! "C(0,C(C(C(0,0),0),C(W,W)))") 1 == true
#guard isStandard (parse! "C(0,C(0,C(W,C(W,W))))") == true
#guard isStandardN (parse! "C(0,C(0,C(W,C(W,W))))") 1 == true
#guard isStandard (parse! "C(0,C(C(C(0,0),0),W))") == true
#guard isStandardN (parse! "C(0,C(C(C(0,0),0),W))") 1 == true
#guard isStandard (parse! "C(C(W,C(W,W)),W)") == true
#guard isStandardN (parse! "C(C(W,C(W,W)),W)") 1 == true
#guard isStandard (parse! "C(0,C(W,C(C(C(0,W),W),0)))") == true
#guard isStandardN (parse! "C(0,C(W,C(C(C(0,W),W),0)))") 1 == true
#guard isStandard (parse! "C(C(0,C(C(W,C(W,W)),0)),W)") == true
#guard isStandardN (parse! "C(C(0,C(C(W,C(W,W)),0)),W)") 1 == true
#guard isStandard (parse! "C(C(0,W),C(C(C(0,W),W),W))") == true
#guard isStandardN (parse! "C(C(0,W),C(C(C(0,W),W),W))") 1 == true
#guard isStandard (parse! "C(C(0,C(C(0,C(0,W)),W)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(0,C(0,W)),W)),0)") 1 == true
#guard isStandard (parse! "C(C(0,0),C(W,C(W,C(W,0))))") == true
#guard isStandardN (parse! "C(C(0,0),C(W,C(W,C(W,0))))") 1 == true
#guard isStandard (parse! "C(C(0,C(C(C(0,0),0),W)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(C(0,0),0),W)),0)") 1 == true
#guard isStandard (parse! "C(C(C(W,0),W),0)") == true
#guard isStandardN (parse! "C(C(C(W,0),W),0)") 1 == true
#guard isStandard (parse! "C(C(W,W),C(C(C(W,W),W),W))") == true
#guard isStandardN (parse! "C(C(W,W),C(C(C(W,W),W),W))") 1 == true
#guard isStandard (parse! "C(C(C(C(0,0),0),W),W)") == true
#guard isStandardN (parse! "C(C(C(C(0,0),0),W),W)") 1 == true
#guard isStandard (parse! "C(C(0,W),C(C(C(0,0),W),0))") == true
#guard isStandardN (parse! "C(C(0,W),C(C(C(0,0),W),0))") 1 == true
#guard isStandard (parse! "C(C(C(0,0),0),C(W,0))") == true
#guard isStandardN (parse! "C(C(C(0,0),0),C(W,0))") 1 == true
#guard isStandard (parse! "C(0,C(0,C(C(0,0),W)))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(0,0),W)))") 1 == true
#guard isStandard (parse! "C(C(0,C(0,0)),C(C(W,W),W))") == true
#guard isStandardN (parse! "C(C(0,C(0,0)),C(C(W,W),W))") 1 == true
#guard isStandard (parse! "C(C(C(W,W),W),0)") == true
#guard isStandardN (parse! "C(C(C(W,W),W),0)") 1 == true
#guard isStandard (parse! "C(0,C(C(0,C(C(0,0),W)),0))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(C(0,0),W)),0))") 1 == true
#guard isStandard (parse! "C(C(C(0,0),0),C(C(0,W),0))") == true
#guard isStandardN (parse! "C(C(C(0,0),0),C(C(0,W),0))") 1 == true
#guard isStandard (parse! "C(C(W,0),C(W,W))") == true
#guard isStandardN (parse! "C(C(W,0),C(W,W))") 1 == true
#guard isStandard (parse! "C(W,C(W,C(C(W,W),W)))") == true
#guard isStandardN (parse! "C(W,C(W,C(C(W,W),W)))") 1 == true
#guard isStandard (parse! "C(C(C(0,C(C(0,0),0)),W),W)") == true
#guard isStandardN (parse! "C(C(C(0,C(C(0,0),0)),W),W)") 1 == true
#guard isStandard (parse! "C(C(C(W,C(C(0,W),W)),W),W)") == true
#guard isStandardN (parse! "C(C(C(W,C(C(0,W),W)),W),W)") 1 == true
#guard isStandard (parse! "C(C(0,C(W,C(C(W,W),0))),W)") == true
#guard isStandardN (parse! "C(C(0,C(W,C(C(W,W),0))),W)") 1 == true
#guard isStandard (parse! "C(0,C(C(C(W,W),W),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(W,W),W),0))") 1 == true
#guard isStandard (parse! "C(0,C(C(C(0,C(0,W)),W),W))") == true
#guard isStandardN (parse! "C(0,C(C(C(0,C(0,W)),W),W))") 1 == true
#guard isStandard (parse! "C(W,C(C(0,W),C(C(W,W),W)))") == true
#guard isStandardN (parse! "C(W,C(C(0,W),C(C(W,W),W)))") 1 == true
#guard isStandard (parse! "C(C(C(W,W),0),C(C(W,W),W))") == true
#guard isStandardN (parse! "C(C(C(W,W),0),C(C(W,W),W))") 1 == true
#guard isStandard (parse! "C(0,C(C(0,C(0,0)),0))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(0,0)),0))") 1 == true
#guard isStandard (parse! "C(C(C(0,C(0,W)),W),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(0,W)),W),0)") 1 == true
#guard isStandard (parse! "C(C(C(C(W,C(W,W)),W),W),0)") == true
#guard isStandardN (parse! "C(C(C(C(W,C(W,W)),W),W),0)") 1 == true
#guard isStandard (parse! "C(0,C(C(0,C(C(0,0),0)),0))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(C(0,0),0)),0))") 1 == true
#guard isStandard (parse! "C(C(C(W,0),W),W)") == true
#guard isStandardN (parse! "C(C(C(W,0),W),W)") 1 == true
#guard isStandard (parse! "C(C(C(C(W,0),C(W,W)),0),W)") == true
#guard isStandardN (parse! "C(C(C(C(W,0),C(W,W)),0),W)") 1 == true
#guard isStandard (parse! "C(C(C(C(W,0),C(W,0)),W),W)") == true
#guard isStandardN (parse! "C(C(C(C(W,0),C(W,0)),W),W)") 1 == true
#guard isStandard (parse! "C(W,C(C(0,C(0,W)),0))") == true
#guard isStandardN (parse! "C(W,C(C(0,C(0,W)),0))") 1 == true
#guard isStandard (parse! "C(C(C(C(0,C(W,0)),W),W),W)") == true
#guard isStandardN (parse! "C(C(C(C(0,C(W,0)),W),W),W)") 1 == true
#guard isStandard (parse! "C(C(C(0,W),0),C(C(0,W),W))") == true
#guard isStandardN (parse! "C(C(C(0,W),0),C(C(0,W),W))") 1 == true
#guard isStandard (parse! "C(C(C(W,W),0),C(C(0,W),W))") == true
#guard isStandardN (parse! "C(C(C(W,W),0),C(C(0,W),W))") 1 == true
#guard isStandard (parse! "C(C(0,C(0,C(W,0))),W)") == true
#guard isStandardN (parse! "C(C(0,C(0,C(W,0))),W)") 1 == true
#guard isStandard (parse! "C(0,C(0,C(0,C(C(0,W),W))))") == true
#guard isStandardN (parse! "C(0,C(0,C(0,C(C(0,W),W))))") 1 == true
#guard isStandard (parse! "C(C(W,C(C(W,C(W,W)),W)),W)") == true
#guard isStandardN (parse! "C(C(W,C(C(W,C(W,W)),W)),W)") 1 == true
#guard isStandard (parse! "C(C(W,C(W,C(C(0,W),W))),W)") == true
#guard isStandardN (parse! "C(C(W,C(W,C(C(0,W),W))),W)") 1 == true
#guard isStandard (parse! "C(C(0,C(C(W,W),0)),C(W,W))") == true
#guard isStandardN (parse! "C(C(0,C(C(W,W),0)),C(W,W))") 1 == true
#guard isStandard (parse! "C(C(0,0),C(W,0))") == true
#guard isStandardN (parse! "C(C(0,0),C(W,0))") 1 == true
#guard isStandard (parse! "C(0,C(C(C(C(W,W),W),0),W))") == true
#guard isStandardN (parse! "C(0,C(C(C(C(W,W),W),0),W))") 1 == true
#guard isStandard (parse! "C(C(0,C(C(C(0,0),0),0)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(C(0,0),0),0)),0)") 1 == true
#guard isStandard (parse! "C(W,C(W,C(W,C(W,C(W,W)))))") == true
#guard isStandardN (parse! "C(W,C(W,C(W,C(W,C(W,W)))))") 1 == true
#guard isStandard (parse! "C(C(C(0,C(W,0)),W),W)") == true
#guard isStandardN (parse! "C(C(C(0,C(W,0)),W),W)") 1 == true
#guard isStandard (parse! "C(0,C(W,0))") == true
#guard isStandardN (parse! "C(0,C(W,0))") 1 == true
#guard isStandard (parse! "C(C(0,C(C(C(W,0),W),0)),W)") == true
#guard isStandardN (parse! "C(C(0,C(C(C(W,0),W),0)),W)") 1 == true
#guard isStandard (parse! "C(C(C(0,0),C(C(0,0),W)),0)") == true
#guard isStandardN (parse! "C(C(C(0,0),C(C(0,0),W)),0)") 1 == true
#guard isStandard (parse! "C(C(C(W,C(W,W)),W),0)") == true
#guard isStandardN (parse! "C(C(C(W,C(W,W)),W),0)") 1 == true
#guard isStandard (parse! "C(0,C(0,C(C(W,0),C(W,W))))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(W,0),C(W,W))))") 1 == true
#guard isStandard (parse! "C(C(0,C(W,0)),C(W,0))") == true
#guard isStandardN (parse! "C(C(0,C(W,0)),C(W,0))") 1 == true
#guard isStandard (parse! "C(C(C(0,C(0,0)),0),C(W,W))") == true
#guard isStandardN (parse! "C(C(C(0,C(0,0)),0),C(W,W))") 1 == true
#guard isStandard (parse! "C(0,C(0,C(C(W,C(W,0)),W)))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(W,C(W,0)),W)))") 1 == true
#guard isStandard (parse! "C(W,C(C(0,C(0,W)),W))") == true
#guard isStandardN (parse! "C(W,C(C(0,C(0,W)),W))") 1 == true
#guard isStandard (parse! "C(C(C(0,C(0,0)),C(W,W)),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(0,0)),C(W,W)),0)") 1 == true
#guard isStandard (parse! "C(C(C(C(0,0),0),W),0)") == true
#guard isStandardN (parse! "C(C(C(C(0,0),0),W),0)") 1 == true
#guard isStandard (parse! "C(C(C(C(0,C(W,W)),W),W),W)") == true
#guard isStandardN (parse! "C(C(C(C(0,C(W,W)),W),W),W)") 1 == true
#guard isStandard (parse! "C(C(0,0),C(C(W,C(W,0)),W))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(W,C(W,0)),W))") 1 == true
#guard isStandard (parse! "C(0,C(C(0,0),C(C(W,0),W)))") == true
#guard isStandardN (parse! "C(0,C(C(0,0),C(C(W,0),W)))") 1 == true
#guard isStandard (parse! "C(C(C(C(W,C(W,0)),W),W),W)") == true
#guard isStandardN (parse! "C(C(C(C(W,C(W,0)),W),W),W)") 1 == true
#guard isStandard (parse! "C(C(C(C(W,0),C(W,0)),W),0)") == true
#guard isStandardN (parse! "C(C(C(C(W,0),C(W,0)),W),0)") 1 == true
#guard isStandard (parse! "C(C(0,C(C(0,C(0,0)),0)),W)") == true
#guard isStandardN (parse! "C(C(0,C(C(0,C(0,0)),0)),W)") 1 == true
#guard isStandard (parse! "C(C(C(W,0),C(C(W,W),W)),0)") == true
#guard isStandardN (parse! "C(C(C(W,0),C(C(W,W),W)),0)") 1 == true
#guard isStandard (parse! "C(0,C(C(0,C(0,W)),0))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(0,W)),0))") 1 == true
#guard isStandard (parse! "C(C(0,C(0,C(C(0,0),W))),0)") == true
#guard isStandardN (parse! "C(C(0,C(0,C(C(0,0),W))),0)") 1 == true
#guard isStandard (parse! "C(W,C(C(C(0,C(0,W)),W),0))") == true
#guard isStandardN (parse! "C(W,C(C(C(0,C(0,W)),W),0))") 1 == true
#guard isStandard (parse! "C(0,C(C(0,C(0,C(0,W))),0))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(0,C(0,W))),0))") 1 == true
#guard isStandard (parse! "C(C(C(0,C(0,C(0,0))),W),W)") == true
#guard isStandardN (parse! "C(C(C(0,C(0,C(0,0))),W),W)") 1 == true
#guard isStandard (parse! "C(0,C(0,C(C(C(W,W),0),W)))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(C(W,W),0),W)))") 1 == true
#guard isStandard (parse! "C(0,C(C(0,C(0,0)),C(W,W)))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(0,0)),C(W,W)))") 1 == true
#guard isStandard (parse! "C(W,C(C(0,W),W))") == true
#guard isStandardN (parse! "C(W,C(C(0,W),W))") 1 == true
#guard isStandard (parse! "C(C(C(0,C(0,0)),W),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(0,0)),W),0)") 1 == true
#guard isStandard (parse! "C(C(C(0,0),C(W,C(W,W))),0)") == true
#guard isStandardN (parse! "C(C(C(0,0),C(W,C(W,W))),0)") 1 == true
#guard isStandard (parse! "C(0,C(C(C(W,0),W),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(W,0),W),0))") 1 == true
#guard isStandard (parse! "C(W,C(C(C(0,W),W),W))") == true
#guard isStandardN (parse! "C(W,C(C(C(0,W),W),W))") 1 == true
#guard isStandard (parse! "C(0,C(C(0,0),W))") == true
#guard isStandardN (parse! "C(0,C(C(0,0),W))") 1 == true
#guard isStandard (parse! "C(0,C(W,C(C(C(W,W),W),W)))") == true
#guard isStandardN (parse! "C(0,C(W,C(C(C(W,W),W),W)))") 1 == true
#guard isStandard (parse! "C(W,C(C(C(0,C(W,W)),W),0))") == true
#guard isStandardN (parse! "C(W,C(C(C(0,C(W,W)),W),0))") 1 == true
#guard isStandard (parse! "C(C(0,C(W,W)),W)") == true
#guard isStandardN (parse! "C(C(0,C(W,W)),W)") 1 == true
#guard isStandard (parse! "C(0,C(C(W,0),C(C(0,W),0)))") == true
#guard isStandardN (parse! "C(0,C(C(W,0),C(C(0,W),0)))") 1 == true
#guard isStandard (parse! "C(W,C(C(0,C(C(W,0),W)),0))") == true
#guard isStandardN (parse! "C(W,C(C(0,C(C(W,0),W)),0))") 1 == true
#guard isStandard (parse! "C(C(W,C(W,0)),C(W,C(W,0)))") == true
#guard isStandardN (parse! "C(C(W,C(W,0)),C(W,C(W,0)))") 1 == true
#guard isStandard (parse! "C(C(C(0,0),C(W,0)),C(W,W))") == true
#guard isStandardN (parse! "C(C(C(0,0),C(W,0)),C(W,W))") 1 == true
#guard isStandard (parse! "C(0,C(C(C(W,W),W),W))") == true
#guard isStandardN (parse! "C(0,C(C(C(W,W),W),W))") 1 == true
#guard isStandard (parse! "C(0,C(0,C(C(C(W,W),W),0)))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(C(W,W),W),0)))") 1 == true
#guard isStandard (parse! "C(C(C(C(0,W),0),W),W)") == true
#guard isStandardN (parse! "C(C(C(C(0,W),0),W),W)") 1 == true
#guard isStandard (parse! "C(0,C(0,C(0,C(0,C(W,0)))))") == true
#guard isStandardN (parse! "C(0,C(0,C(0,C(0,C(W,0)))))") 1 == true
#guard isStandard (parse! "C(C(C(C(W,W),0),W),W)") == true
#guard isStandardN (parse! "C(C(C(C(W,W),0),W),W)") 1 == true
#guard isStandard (parse! "C(C(0,C(W,C(C(W,W),W))),0)") == true
#guard isStandardN (parse! "C(C(0,C(W,C(C(W,W),W))),0)") 1 == true
#guard isStandard (parse! "C(0,C(C(0,W),0))") == true
#guard isStandardN (parse! "C(0,C(C(0,W),0))") 1 == true
#guard isStandard (parse! "C(0,C(C(C(C(0,0),W),W),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(C(0,0),W),W),0))") 1 == true
#guard isStandard (parse! "C(C(C(W,0),C(C(W,W),W)),W)") == true
#guard isStandardN (parse! "C(C(C(W,0),C(C(W,W),W)),W)") 1 == true
#guard isStandard (parse! "C(C(0,C(0,0)),C(W,0))") == true
#guard isStandardN (parse! "C(C(0,C(0,0)),C(W,0))") 1 == true
#guard isStandard (parse! "C(C(0,C(C(0,0),W)),W)") == true
#guard isStandardN (parse! "C(C(0,C(C(0,0),W)),W)") 1 == true
#guard isStandard (parse! "C(C(W,C(W,0)),C(C(0,W),0))") == true
#guard isStandardN (parse! "C(C(W,C(W,0)),C(C(0,W),0))") 1 == true
#guard isStandard (parse! "C(C(W,C(C(W,C(W,W)),0)),W)") == true
#guard isStandardN (parse! "C(C(W,C(C(W,C(W,W)),0)),W)") 1 == true
#guard isStandard (parse! "C(0,C(0,0))") == true
#guard isStandardN (parse! "C(0,C(0,0))") 1 == true
#guard isStandard (parse! "C(C(C(C(0,0),0),0),0)") == true
#guard isStandardN (parse! "C(C(C(C(0,0),0),0),0)") 1 == true
#guard isStandard (parse! "C(C(W,C(W,0)),C(C(0,W),W))") == true
#guard isStandardN (parse! "C(C(W,C(W,0)),C(C(0,W),W))") 1 == true
#guard isStandard (parse! "C(0,C(C(0,0),C(W,C(W,0))))") == true
#guard isStandardN (parse! "C(0,C(C(0,0),C(W,C(W,0))))") 1 == true
#guard isStandard (parse! "C(C(0,0),0)") == true
#guard isStandardN (parse! "C(C(0,0),0)") 2 == true
#guard isStandard (parse! "C(C(0,C(C(W,W_2),0)),W_2)") == true
#guard isStandardN (parse! "C(C(0,C(C(C(W_2,0),W_2),0)),W_2)") 2 == true
#guard isStandard (parse! "C(C(0,C(C(0,0),0)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(0,0),0)),0)") 2 == true
#guard isStandard (parse! "C(C(C(W,W_2),0),W)") == true
#guard isStandardN (parse! "C(C(C(C(W_2,0),W_2),0),C(W_2,0))") 2 == true
#guard isStandard (parse! "C(W,W_2)") == true
#guard isStandardN (parse! "C(C(W_2,0),W_2)") 2 == true
#guard isStandard (parse! "C(C(C(C(0,C(0,W_2)),0),W_2),0)") == true
#guard isStandardN (parse! "C(C(C(C(0,C(0,W_2)),0),W_2),0)") 2 == true
#guard isStandard (parse! "C(C(C(0,0),C(C(0,W_2),W_2)),0)") == true
#guard isStandardN (parse! "C(C(C(0,0),C(C(0,W_2),W_2)),0)") 2 == true
#guard isStandard (parse! "C(0,C(C(W_2,C(C(0,W_2),0)),W_2))") == true
#guard isStandardN (parse! "C(0,C(C(W_2,C(C(0,W_2),0)),W_2))") 2 == true
#guard isStandard (parse! "C(C(0,C(0,0)),C(W,W_2))") == true
#guard isStandardN (parse! "C(C(0,C(0,0)),C(C(W_2,0),W_2))") 2 == true
#guard isStandard (parse! "C(C(0,0),C(C(C(W_2,W_2),0),0))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(C(W_2,W_2),0),0))") 2 == true
#guard isStandard (parse! "C(C(0,C(C(C(0,0),W_2),W_2)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(C(0,0),W_2),W_2)),0)") 2 == true
#guard isStandard (parse! "C(C(C(W_2,W),W_2),W_2)") == true
#guard isStandardN (parse! "C(C(C(W_2,C(W_2,0)),W_2),W_2)") 2 == true
#guard isStandard (parse! "C(C(W_2,C(C(C(0,W_2),W_2),W_2)),W_2)") == true
#guard isStandardN (parse! "C(C(W_2,C(C(C(0,W_2),W_2),W_2)),W_2)") 2 == true
#guard isStandard (parse! "C(0,C(C(W_2,W),W))") == true
#guard isStandardN (parse! "C(0,C(C(W_2,C(W_2,0)),C(W_2,0)))") 2 == true
#guard isStandard (parse! "C(C(C(0,0),W_2),0)") == true
#guard isStandardN (parse! "C(C(C(0,0),W_2),0)") 2 == true
#guard isStandard (parse! "C(C(0,C(C(C(W_2,W_2),W_2),0)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(C(W_2,W_2),W_2),0)),0)") 2 == true
#guard isStandard (parse! "C(0,C(0,C(0,C(0,C(0,0)))))") == true
#guard isStandardN (parse! "C(0,C(0,C(0,C(0,C(0,0)))))") 2 == true
#guard isStandard (parse! "C(C(W,C(C(0,W_2),W_2)),0)") == true
#guard isStandardN (parse! "C(C(C(W_2,0),C(C(0,W_2),W_2)),0)") 2 == true
#guard isStandard (parse! "C(0,C(C(0,0),C(W,0)))") == true
#guard isStandardN (parse! "C(0,C(C(0,0),C(C(W_2,0),0)))") 2 == true
#guard isStandard (parse! "C(0,C(C(0,0),C(W,W_2)))") == true
#guard isStandardN (parse! "C(0,C(C(0,0),C(C(W_2,0),W_2)))") 2 == true
#guard isStandard (parse! "C(0,C(C(C(W_2,W_2),0),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(W_2,W_2),0),0))") 2 == true
#guard isStandard (parse! "C(C(W_2,C(C(C(W_2,W_2),W_2),W_2)),W_2)") == true
#guard isStandardN (parse! "C(C(W_2,C(C(C(W_2,W_2),W_2),W_2)),W_2)") 2 == true
#guard isStandard (parse! "C(W_2,C(C(W_2,W_2),W_2))") == true
#guard isStandardN (parse! "C(W_2,C(C(W_2,W_2),W_2))") 2 == true
#guard isStandard (parse! "C(C(0,C(C(C(0,0),W_2),W_2)),W_2)") == true
#guard isStandardN (parse! "C(C(0,C(C(C(0,0),W_2),W_2)),W_2)") 2 == true
#guard isStandard (parse! "C(C(0,C(W_2,C(C(0,W_2),0))),0)") == true
#guard isStandardN (parse! "C(C(0,C(W_2,C(C(0,W_2),0))),0)") 2 == true
#guard isStandard (parse! "0") == true
#guard isStandardN (parse! "0") 2 == true
#guard isStandard (parse! "C(0,C(C(W_2,W),0))") == true
#guard isStandardN (parse! "C(0,C(C(W_2,C(W_2,0)),0))") 2 == true
#guard isStandard (parse! "C(C(C(0,C(0,W)),W_2),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(0,C(W_2,0))),W_2),0)") 2 == true
#guard isStandard (parse! "C(0,C(C(W_2,W_2),C(C(W_2,W_2),W_2)))") == true
#guard isStandardN (parse! "C(0,C(C(W_2,W_2),C(C(W_2,W_2),W_2)))") 2 == true
#guard isStandard (parse! "C(C(0,C(W_2,C(C(0,W_2),0))),W_2)") == true
#guard isStandardN (parse! "C(C(0,C(W_2,C(C(0,W_2),0))),W_2)") 2 == true
#guard isStandard (parse! "C(C(W_2,C(C(C(0,0),W_2),0)),W_2)") == true
#guard isStandardN (parse! "C(C(W_2,C(C(C(0,0),W_2),0)),W_2)") 2 == true
#guard isStandard (parse! "C(C(W_2,C(W_2,C(C(0,W_2),0))),0)") == true
#guard isStandardN (parse! "C(C(W_2,C(W_2,C(C(0,W_2),0))),0)") 2 == true
#guard isStandard (parse! "C(0,C(W,0))") == true
#guard isStandardN (parse! "C(0,C(C(W_2,0),0))") 2 == true
#guard isStandard (parse! "C(C(W_2,C(C(W_2,W_2),0)),0)") == true
#guard isStandardN (parse! "C(C(W_2,C(C(W_2,W_2),0)),0)") 2 == true
#guard isStandard (parse! "C(C(W_2,W),C(C(0,W_2),0))") == true
#guard isStandardN (parse! "C(C(W_2,C(W_2,0)),C(C(0,W_2),0))") 2 == true
#guard isStandard (parse! "C(W_2,C(C(0,C(C(0,W_2),W_2)),W_2))") == true
#guard isStandardN (parse! "C(W_2,C(C(0,C(C(0,W_2),W_2)),W_2))") 2 == true
#guard isStandard (parse! "C(C(0,C(C(0,C(W_2,W_2)),W_2)),W_2)") == true
#guard isStandardN (parse! "C(C(0,C(C(0,C(W_2,W_2)),W_2)),W_2)") 2 == true
#guard isStandard (parse! "C(C(W,C(W_2,C(W_2,W_2))),W_2)") == true
#guard isStandardN (parse! "C(C(C(W_2,0),C(W_2,C(W_2,W_2))),W_2)") 2 == true
#guard isStandard (parse! "C(0,C(C(W,W_2),W_2))") == true
#guard isStandardN (parse! "C(0,C(C(C(W_2,0),W_2),W_2))") 2 == true
#guard isStandard (parse! "C(W_2,C(C(C(0,W),W_2),W_2))") == true
#guard isStandardN (parse! "C(W_2,C(C(C(0,C(W_2,0)),W_2),W_2))") 2 == true
#guard isStandard (parse! "C(C(0,0),C(C(0,0),W))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(0,0),C(W_2,0)))") 2 == true
#guard isStandard (parse! "C(C(W_2,W),C(W_2,W))") == true
#guard isStandardN (parse! "C(C(W_2,C(W_2,0)),C(W_2,C(W_2,0)))") 2 == true
#guard isStandard (parse! "C(C(C(C(C(0,W_2),W_2),0),0),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(C(0,W_2),W_2),0),0),W_2)") 2 == true
#guard isStandard (parse! "C(0,C(C(0,C(0,C(0,W_2))),0))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(0,C(0,W_2))),0))") 2 == true
#guard isStandard (parse! "C(C(C(C(W_2,W),W_2),0),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(W_2,C(W_2,0)),W_2),0),W_2)") 2 == true
#guard isStandard (parse! "C(C(0,C(W,W_2)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(W_2,0),W_2)),0)") 2 == true
#guard isStandard (parse! "C(C(C(0,C(C(0,W_2),0)),W_2),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(C(0,W_2),0)),W_2),0)") 2 == true
#guard isStandard (parse! "C(W_2,C(W_2,C(C(W_2,W_2),W_2)))") == true
#guard isStandardN (parse! "C(W_2,C(W_2,C(C(W_2,W_2),W_2)))") 2 == true
#guard isStandard (parse! "C(C(0,C(C(C(W_2,W_2),0),W_2)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(C(W_2,W_2),0),W_2)),0)") 2 == true
#guard isStandard (parse! "C(C(0,0),C(C(0,W_2),0))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(0,W_2),0))") 2 == true
#guard isStandard (parse! "C(0,C(C(0,C(C(0,W_2),0)),W_2))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(C(0,W_2),0)),W_2))") 2 == true
#guard isStandard (parse! "C(C(0,0),C(C(W_2,W_2),W_2))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(W_2,W_2),W_2))") 2 == true
#guard isStandard (parse! "C(W_2,C(C(C(0,C(0,0)),W_2),W_2))") == true
#guard isStandardN (parse! "C(W_2,C(C(C(0,C(0,0)),W_2),W_2))") 2 == true
#guard isStandard (parse! "C(0,C(W_2,C(C(C(0,0),W_2),0)))") == true
#guard isStandardN (parse! "C(0,C(W_2,C(C(C(0,0),W_2),0)))") 2 == true
#guard isStandard (parse! "C(0,C(C(0,0),C(C(0,0),W_2)))") == true
#guard isStandardN (parse! "C(0,C(C(0,0),C(C(0,0),W_2)))") 2 == true
#guard isStandard (parse! "C(C(0,C(C(W_2,W_2),W_2)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(W_2,W_2),W_2)),0)") 2 == true
#guard isStandard (parse! "C(C(W_2,C(C(W_2,C(W_2,W_2)),W_2)),W_2)") == true
#guard isStandardN (parse! "C(C(W_2,C(C(W_2,C(W_2,W_2)),W_2)),W_2)") 2 == true
#guard isStandard (parse! "C(C(0,C(C(C(0,W_2),W_2),W_2)),W_2)") == true
#guard isStandardN (parse! "C(C(0,C(C(C(0,W_2),W_2),W_2)),W_2)") 2 == true
#guard isStandard (parse! "C(0,C(C(0,W_2),C(C(W_2,W_2),0)))") == true
#guard isStandardN (parse! "C(0,C(C(0,W_2),C(C(W_2,W_2),0)))") 2 == true
#guard isStandard (parse! "C(C(C(W,W_2),W_2),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(W_2,0),W_2),W_2),W_2)") 2 == true
#guard isStandard (parse! "C(C(0,C(0,C(C(0,W_2),0))),W_2)") == true
#guard isStandardN (parse! "C(C(0,C(0,C(C(0,W_2),0))),W_2)") 2 == true
#guard isStandard (parse! "C(0,C(C(C(0,W_2),W_2),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(0,W_2),W_2),0))") 2 == true
#guard isStandard (parse! "C(C(C(C(0,C(0,0)),W_2),0),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(0,C(0,0)),W_2),0),W_2)") 2 == true
#guard isStandard (parse! "C(C(C(0,W),W_2),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(W_2,0)),W_2),0)") 2 == true
#guard isStandard (parse! "C(C(W_2,C(W_2,C(W_2,W))),W_2)") == true
#guard isStandardN (parse! "C(C(W_2,C(W_2,C(W_2,C(W_2,0)))),W_2)") 2 == true
#guard isStandard (parse! "C(C(C(W_2,W_2),0),C(W_2,C(W_2,W_2)))") == true
#guard isStandardN (parse! "C(C(C(W_2,W_2),0),C(W_2,C(W_2,W_2)))") 2 == true
#guard isStandard (parse! "C(W_2,C(C(C(W,W_2),W_2),0))") == true
#guard isStandardN (parse! "C(W_2,C(C(C(C(W_2,0),W_2),W_2),0))") 2 == true
#guard isStandard (parse! "C(C(C(W_2,W_2),C(C(W_2,W_2),W_2)),0)") == true
#guard isStandardN (parse! "C(C(C(W_2,W_2),C(C(W_2,W_2),W_2)),0)") 2 == true
#guard isStandard (parse! "C(0,C(C(C(W,0),W_2),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(C(W_2,0),0),W_2),0))") 2 == true
#guard isStandard (parse! "C(C(C(0,W_2),0),C(C(0,W_2),0))") == true
#guard isStandardN (parse! "C(C(C(0,W_2),0),C(C(0,W_2),0))") 2 == true
#guard isStandard (parse! "C(C(W_2,C(C(W_2,W_2),0)),W_2)") == true
#guard isStandardN (parse! "C(C(W_2,C(C(W_2,W_2),0)),W_2)") 2 == true
#guard isStandard (parse! "C(0,C(0,C(0,0)))") == true
#guard isStandardN (parse! "C(0,C(0,C(0,0)))") 2 == true
#guard isStandard (parse! "C(C(W_2,W_2),C(C(W_2,W_2),0))") == true
#guard isStandardN (parse! "C(C(W_2,W_2),C(C(W_2,W_2),0))") 2 == true
#guard isStandard (parse! "C(C(W_2,W),C(C(0,W_2),W_2))") == true
#guard isStandardN (parse! "C(C(W_2,C(W_2,0)),C(C(0,W_2),W_2))") 2 == true
#guard isStandard (parse! "C(C(C(0,C(0,W_2)),W_2),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(0,W_2)),W_2),0)") 2 == true
#guard isStandard (parse! "C(C(C(C(0,0),0),C(W_2,W_2)),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(0,0),0),C(W_2,W_2)),W_2)") 2 == true
#guard isStandard (parse! "C(0,C(C(W_2,C(C(W_2,W_2),0)),W_2))") == true
#guard isStandardN (parse! "C(0,C(C(W_2,C(C(W_2,W_2),0)),W_2))") 2 == true
#guard isStandard (parse! "C(C(C(C(0,W_2),0),0),W)") == true
#guard isStandardN (parse! "C(C(C(C(0,W_2),0),0),C(W_2,0))") 2 == true
#guard isStandard (parse! "C(0,C(W_2,C(C(0,C(W_2,W_2)),W_2)))") == true
#guard isStandardN (parse! "C(0,C(W_2,C(C(0,C(W_2,W_2)),W_2)))") 2 == true
#guard isStandard (parse! "C(C(0,C(C(0,C(W_2,W_2)),0)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(0,C(W_2,W_2)),0)),0)") 2 == true
#guard isStandard (parse! "C(C(C(0,0),0),C(W_2,C(W_2,W_2)))") == true
#guard isStandardN (parse! "C(C(C(0,0),0),C(W_2,C(W_2,W_2)))") 2 == true
#guard isStandard (parse! "C(0,C(C(0,C(0,0)),C(W_2,W_2)))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(0,0)),C(W_2,W_2)))") 2 == true
#guard isStandard (parse! "C(C(C(W_2,W_2),C(C(W_2,W_2),W_2)),W_2)") == true
#guard isStandardN (parse! "C(C(C(W_2,W_2),C(C(W_2,W_2),W_2)),W_2)") 2 == true
#guard isStandard (parse! "C(0,C(C(W_2,C(C(0,W_2),W_2)),W_2))") == true
#guard isStandardN (parse! "C(0,C(C(W_2,C(C(0,W_2),W_2)),W_2))") 2 == true
#guard isStandard (parse! "C(C(C(C(W,0),W_2),W_2),0)") == true
#guard isStandardN (parse! "C(C(C(C(C(W_2,0),0),W_2),W_2),0)") 2 == true
#guard isStandard (parse! "C(C(0,C(C(0,0),W)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(0,0),C(W_2,0))),0)") 2 == true
#guard isStandard (parse! "C(C(C(C(0,0),W_2),W_2),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(0,0),W_2),W_2),W_2)") 2 == true
#guard isStandard (parse! "C(C(C(0,C(0,0)),0),W)") == true
#guard isStandardN (parse! "C(C(C(0,C(0,0)),0),C(W_2,0))") 2 == true
#guard isStandard (parse! "C(C(C(C(C(W_2,W_2),0),0),W_2),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(C(W_2,W_2),0),0),W_2),W_2)") 2 == true
#guard isStandard (parse! "C(C(0,W),W)") == true
#guard isStandardN (parse! "C(C(0,C(W_2,0)),C(W_2,0))") 2 == true
#guard isStandard (parse! "C(C(W,0),C(W,W_2))") == true
#guard isStandardN (parse! "C(C(C(W_2,0),0),C(C(W_2,0),W_2))") 2 == true
#guard isStandard (parse! "C(C(W_2,C(C(0,W_2),0)),0)") == true
#guard isStandardN (parse! "C(C(W_2,C(C(0,W_2),0)),0)") 2 == true
#guard isStandard (parse! "C(0,C(C(C(W_2,W),W_2),W_2))") == true
#guard isStandardN (parse! "C(0,C(C(C(W_2,C(W_2,0)),W_2),W_2))") 2 == true
#guard isStandard (parse! "C(0,C(0,C(C(W_2,C(W_2,W_2)),W_2)))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(W_2,C(W_2,W_2)),W_2)))") 2 == true
#guard isStandard (parse! "C(C(W,C(C(0,W_2),W_2)),W_2)") == true
#guard isStandardN (parse! "C(C(C(W_2,0),C(C(0,W_2),W_2)),W_2)") 2 == true
#guard isStandard (parse! "C(C(C(C(W,W_2),W_2),0),0)") == true
#guard isStandardN (parse! "C(C(C(C(C(W_2,0),W_2),W_2),0),0)") 2 == true
#guard isStandard (parse! "C(W_2,C(W_2,W))") == true
#guard isStandardN (parse! "C(W_2,C(W_2,C(W_2,0)))") 2 == true
#guard isStandard (parse! "C(C(C(W_2,C(W_2,W_2)),W_2),W_2)") == true
#guard isStandardN (parse! "C(C(C(W_2,C(W_2,W_2)),W_2),W_2)") 2 == true
#guard isStandard (parse! "C(C(C(C(0,0),W),W_2),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(0,0),C(W_2,0)),W_2),W_2)") 2 == true
#guard isStandard (parse! "C(C(W,W),W)") == true
#guard isStandardN (parse! "C(C(C(W_2,0),C(W_2,0)),C(W_2,0))") 2 == true
#guard isStandard (parse! "C(C(0,C(C(0,0),C(W_2,W_2))),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(0,0),C(W_2,W_2))),0)") 2 == true
#guard isStandard (parse! "C(0,C(C(C(0,0),0),W_2))") == true
#guard isStandardN (parse! "C(0,C(C(C(0,0),0),W_2))") 2 == true
#guard isStandard (parse! "C(C(W_2,W_2),C(C(C(W_2,W_2),W_2),W_2))") == true
#guard isStandardN (parse! "C(C(W_2,W_2),C(C(C(W_2,W_2),W_2),W_2))") 2 == true
#guard isStandard (parse! "C(C(W_2,C(C(0,W_2),W_2)),W_2)") == true
#guard isStandardN (parse! "C(C(W_2,C(C(0,W_2),W_2)),W_2)") 2 == true
#guard isStandard (parse! "C(0,C(C(C(W_2,W_2),0),W))") == true
#guard isStandardN (parse! "C(0,C(C(C(W_2,W_2),0),C(W_2,0)))") 2 == true
#guard isStandard (parse! "C(C(C(C(W,W_2),0),0),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(C(W_2,0),W_2),0),0),W_2)") 2 == true
#guard isStandard (parse! "C(W_2,C(C(0,C(W,W_2)),0))") == true
#guard isStandardN (parse! "C(W_2,C(C(0,C(C(W_2,0),W_2)),0))") 2 == true
#guard isStandard (parse! "C(C(C(C(W,W_2),W_2),0),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(C(W_2,0),W_2),W_2),0),W_2)") 2 == true
#guard isStandard (parse! "C(0,C(W_2,C(W_2,C(W_2,C(W_2,W_2)))))") == true
#guard isStandardN (parse! "C(0,C(W_2,C(W_2,C(W_2,C(W_2,W_2)))))") 2 == true
#guard isStandard (parse! "C(C(W_2,W),C(C(W_2,W_2),0))") == true
#guard isStandardN (parse! "C(C(W_2,C(W_2,0)),C(C(W_2,W_2),0))") 2 == true
#guard isStandard (parse! "C(C(0,C(C(C(0,0),W_2),0)),W_2)") == true
#guard isStandardN (parse! "C(C(0,C(C(C(0,0),W_2),0)),W_2)") 2 == true
#guard isStandard (parse! "C(C(0,C(W_2,W)),W)") == true
#guard isStandardN (parse! "C(C(0,C(W_2,C(W_2,0))),C(W_2,0))") 2 == true
#guard isStandard (parse! "C(C(W_2,C(C(C(0,0),W_2),W_2)),0)") == true
#guard isStandardN (parse! "C(C(W_2,C(C(C(0,0),W_2),W_2)),0)") 2 == true
#guard isStandard (parse! "C(C(W,C(W_2,W_2)),W_2)") == true
#guard isStandardN (parse! "C(C(C(W_2,0),C(W_2,W_2)),W_2)") 2 == true
#guard isStandard (parse! "C(C(0,C(0,C(W_2,W))),0)") == true
#guard isStandardN (parse! "C(C(0,C(0,C(W_2,C(W_2,0)))),0)") 2 == true
#guard isStandard (parse! "C(0,C(C(C(C(0,0),W_2),W_2),W_2))") == true
#guard isStandardN (parse! "C(0,C(C(C(C(0,0),W_2),W_2),W_2))") 2 == true
#guard isStandard (parse! "C(C(0,C(0,W)),0)") == true
#guard isStandardN (parse! "C(C(0,C(0,C(W_2,0))),0)") 2 == true
#guard isStandard (parse! "C(C(C(0,W_2),C(C(0,W_2),0)),W_2)") == true
#guard isStandardN (parse! "C(C(C(0,W_2),C(C(0,W_2),0)),W_2)") 2 == true
#guard isStandard (parse! "C(C(C(0,W_2),0),C(W_2,C(W_2,W_2)))") == true
#guard isStandardN (parse! "C(C(C(0,W_2),0),C(W_2,C(W_2,W_2)))") 2 == true
#guard isStandard (parse! "C(C(C(0,0),W),0)") == true
#guard isStandardN (parse! "C(C(C(0,0),C(W_2,0)),0)") 2 == true
#guard isStandard (parse! "C(C(0,0),C(C(C(0,0),W_2),0))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(C(0,0),W_2),0))") 2 == true
#guard isStandard (parse! "C(W_2,C(C(C(0,C(W_2,W_2)),W_2),W_2))") == true
#guard isStandardN (parse! "C(W_2,C(C(C(0,C(W_2,W_2)),W_2),W_2))") 2 == true
#guard isStandard (parse! "C(0,C(C(0,W),W))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(W_2,0)),C(W_2,0)))") 2 == true
#guard isStandard (parse! "C(C(0,C(W,W)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(W_2,0),C(W_2,0))),0)") 2 == true
#guard isStandard (parse! "C(C(C(0,0),0),C(C(W_2,W_2),0))") == true
#guard isStandardN (parse! "C(C(C(0,0),0),C(C(W_2,W_2),0))") 2 == true
#guard isStandard (parse! "C(C(0,W_2),C(C(C(W_2,W_2),W_2),W_2))") == true
#guard isStandardN (parse! "C(C(0,W_2),C(C(C(W_2,W_2),W_2),W_2))") 2 == true
#guard isStandard (parse! "C(C(0,C(C(C(0,W_2),W_2),W_2)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(C(0,W_2),W_2),W_2)),0)") 2 == true
#guard isStandard (parse! "C(C(0,C(0,C(0,C(W_2,W_2)))),W_2)") == true
#guard isStandardN (parse! "C(C(0,C(0,C(0,C(W_2,W_2)))),W_2)") 2 == true
#guard isStandard (parse! "C(C(0,C(0,C(C(W_2,W_2),0))),0)") == true
#guard isStandardN (parse! "C(C(0,C(0,C(C(W_2,W_2),0))),0)") 2 == true
#guard isStandard (parse! "C(C(C(W_2,W),C(W_2,W_2)),W_2)") == true
#guard isStandardN (parse! "C(C(C(W_2,C(W_2,0)),C(W_2,W_2)),W_2)") 2 == true
#guard isStandard (parse! "C(W,C(W_2,W))") == true
#guard isStandardN (parse! "C(C(W_2,0),C(W_2,C(W_2,0)))") 2 == true
#guard isStandard (parse! "C(C(C(C(0,W_2),0),C(W_2,W_2)),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(0,W_2),0),C(W_2,W_2)),W_2)") 2 == true
#guard isStandard (parse! "C(0,C(C(C(0,C(0,W_2)),0),W_2))") == true
#guard isStandardN (parse! "C(0,C(C(C(0,C(0,W_2)),0),W_2))") 2 == true
#guard isStandard (parse! "C(W_2,C(W_2,C(C(0,C(0,W_2)),0)))") == true
#guard isStandardN (parse! "C(W_2,C(W_2,C(C(0,C(0,W_2)),0)))") 2 == true
#guard isStandard (parse! "C(W_2,C(C(0,C(C(W_2,W_2),W_2)),W_2))") == true
#guard isStandardN (parse! "C(W_2,C(C(0,C(C(W_2,W_2),W_2)),W_2))") 2 == true
#guard isStandard (parse! "C(W,C(W_2,C(W_2,W)))") == true
#guard isStandardN (parse! "C(C(W_2,0),C(W_2,C(W_2,C(W_2,0))))") 2 == true
#guard isStandard (parse! "C(0,C(0,C(C(C(0,W_2),W_2),W_2)))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(C(0,W_2),W_2),W_2)))") 2 == true
#guard isStandard (parse! "C(C(C(0,C(0,C(W_2,W_2))),0),W_2)") == true
#guard isStandardN (parse! "C(C(C(0,C(0,C(W_2,W_2))),0),W_2)") 2 == true
#guard isStandard (parse! "C(0,C(C(W_2,W_2),0))") == true
#guard isStandardN (parse! "C(0,C(C(W_2,W_2),0))") 2 == true
#guard isStandard (parse! "C(C(C(0,C(C(W_2,W_2),0)),W_2),W_2)") == true
#guard isStandardN (parse! "C(C(C(0,C(C(W_2,W_2),0)),W_2),W_2)") 2 == true
#guard isStandard (parse! "C(C(C(C(C(0,W_2),W_2),W_2),W_2),0)") == true
#guard isStandardN (parse! "C(C(C(C(C(0,W_2),W_2),W_2),W_2),0)") 2 == true
#guard isStandard (parse! "C(0,C(C(C(0,0),W),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(0,0),C(W_2,0)),0))") 2 == true
#guard isStandard (parse! "C(C(C(0,W_2),C(C(W_2,W_2),W_2)),0)") == true
#guard isStandardN (parse! "C(C(C(0,W_2),C(C(W_2,W_2),W_2)),0)") 2 == true
#guard isStandard (parse! "C(C(C(0,C(C(0,0),W_2)),W_2),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(C(0,0),W_2)),W_2),0)") 2 == true
#guard isStandard (parse! "C(C(C(0,0),C(W,0)),W_2)") == true
#guard isStandardN (parse! "C(C(C(0,0),C(C(W_2,0),0)),W_2)") 2 == true
#guard isStandard (parse! "C(C(0,0),C(C(0,W),0))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(0,C(W_2,0)),0))") 2 == true
#guard isStandard (parse! "C(C(0,C(0,C(0,C(0,W_2)))),0)") == true
#guard isStandardN (parse! "C(C(0,C(0,C(0,C(0,W_2)))),0)") 2 == true
#guard isStandard (parse! "C(W_2,C(C(W_2,W_2),C(C(W_2,W_2),0)))") == true
#guard isStandardN (parse! "C(W_2,C(C(W_2,W_2),C(C(W_2,W_2),0)))") 2 == true
#guard isStandard (parse! "C(0,C(W_2,C(C(W_2,C(W_2,W_2)),0)))") == true
#guard isStandardN (parse! "C(0,C(W_2,C(C(W_2,C(W_2,W_2)),0)))") 2 == true
#guard isStandard (parse! "C(C(C(0,C(C(0,W_2),W_2)),0),W_2)") == true
#guard isStandardN (parse! "C(C(C(0,C(C(0,W_2),W_2)),0),W_2)") 2 == true
#guard isStandard (parse! "C(W_2,C(W_2,C(C(W,W_2),0)))") == true
#guard isStandardN (parse! "C(W_2,C(W_2,C(C(C(W_2,0),W_2),0)))") 2 == true
#guard isStandard (parse! "C(0,C(0,C(W_2,C(W_2,W))))") == true
#guard isStandardN (parse! "C(0,C(0,C(W_2,C(W_2,C(W_2,0)))))") 2 == true
#guard isStandard (parse! "C(C(0,0),C(C(C(W_2,W_2),0),W_2))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(C(W_2,W_2),0),W_2))") 2 == true
#guard isStandard (parse! "C(C(C(0,C(0,C(W_2,W_2))),W_2),W_2)") == true
#guard isStandardN (parse! "C(C(C(0,C(0,C(W_2,W_2))),W_2),W_2)") 2 == true
#guard isStandard (parse! "C(C(W,C(C(W_2,W_2),W_2)),W_2)") == true
#guard isStandardN (parse! "C(C(C(W_2,0),C(C(W_2,W_2),W_2)),W_2)") 2 == true
#guard isStandard (parse! "C(C(0,W_2),C(C(W,W_2),W_2))") == true
#guard isStandardN (parse! "C(C(0,W_2),C(C(C(W_2,0),W_2),W_2))") 2 == true
#guard isStandard (parse! "C(C(W_2,C(C(W_2,W_2),0)),W)") == true
#guard isStandardN (parse! "C(C(W_2,C(C(W_2,W_2),0)),C(W_2,0))") 2 == true
#guard isStandard (parse! "C(W_2,W_2)") == true
#guard isStandardN (parse! "C(W_2,W_2)") 2 == true
#guard isStandard (parse! "C(0,C(C(W_2,C(C(W_2,W_2),W_2)),W_2))") == true
#guard isStandardN (parse! "C(0,C(C(W_2,C(C(W_2,W_2),W_2)),W_2))") 2 == true
#guard isStandard (parse! "C(C(C(C(0,0),0),0),0)") == true
#guard isStandardN (parse! "C(C(C(C(0,0),0),0),0)") 2 == true
#guard isStandard (parse! "C(C(0,C(0,C(C(W_2,W_2),W_2))),0)") == true
#guard isStandardN (parse! "C(C(0,C(0,C(C(W_2,W_2),W_2))),0)") 2 == true
#guard isStandard (parse! "C(C(C(0,0),W_2),C(C(W_2,W_2),0))") == true
#guard isStandardN (parse! "C(C(C(0,0),W_2),C(C(W_2,W_2),0))") 2 == true
#guard isStandard (parse! "C(C(C(0,C(W,W_2)),W_2),W_2)") == true
#guard isStandardN (parse! "C(C(C(0,C(C(W_2,0),W_2)),W_2),W_2)") 2 == true
#guard isStandard (parse! "C(0,C(C(C(W,W_2),W_2),W_2))") == true
#guard isStandardN (parse! "C(0,C(C(C(C(W_2,0),W_2),W_2),W_2))") 2 == true
#guard isStandard (parse! "C(W_2,C(C(W,C(W_2,W_2)),0))") == true
#guard isStandardN (parse! "C(W_2,C(C(C(W_2,0),C(W_2,W_2)),0))") 2 == true
#guard isStandard (parse! "C(C(W,C(W_2,W_2)),0)") == true
#guard isStandardN (parse! "C(C(C(W_2,0),C(W_2,W_2)),0)") 2 == true
#guard isStandard (parse! "C(0,C(C(0,C(0,C(W_2,W_2))),0))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(0,C(W_2,W_2))),0))") 2 == true
#guard isStandard (parse! "C(C(0,C(0,C(0,0))),C(W_2,W_2))") == true
#guard isStandardN (parse! "C(C(0,C(0,C(0,0))),C(W_2,W_2))") 2 == true
#guard isStandard (parse! "C(W_2,C(C(C(0,C(0,W_2)),W_2),0))") == true
#guard isStandardN (parse! "C(W_2,C(C(C(0,C(0,W_2)),W_2),0))") 2 == true
#guard isStandard (parse! "C(0,C(C(W,C(W_2,W_2)),W_2))") == true
#guard isStandardN (parse! "C(0,C(C(C(W_2,0),C(W_2,W_2)),W_2))") 2 == true
#guard isStandard (parse! "C(C(C(C(C(0,0),W_2),W_2),W_2),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(C(0,0),W_2),W_2),W_2),W_2)") 2 == true
#guard isStandard (parse! "C(0,C(C(C(C(0,W_2),0),W_2),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(C(0,W_2),0),W_2),0))") 2 == true
#guard isStandard (parse! "C(C(0,W_2),C(C(0,C(W_2,W_2)),W_2))") == true
#guard isStandardN (parse! "C(C(0,W_2),C(C(0,C(W_2,W_2)),W_2))") 2 == true
#guard isStandard (parse! "C(0,C(0,C(C(C(0,W_2),W_2),0)))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(C(0,W_2),W_2),0)))") 2 == true
#guard isStandard (parse! "C(C(C(C(0,C(0,0)),0),W_2),0)") == true
#guard isStandardN (parse! "C(C(C(C(0,C(0,0)),0),W_2),0)") 2 == true
#guard isStandard (parse! "C(C(C(C(0,W),W_2),W_2),0)") == true
#guard isStandardN (parse! "C(C(C(C(0,C(W_2,0)),W_2),W_2),0)") 2 == true
#guard isStandard (parse! "C(C(0,C(C(0,C(0,W_2)),0)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(0,C(0,W_2)),0)),0)") 2 == true
#guard isStandard (parse! "C(C(W_2,W),W_2)") == true
#guard isStandardN (parse! "C(C(W_2,C(W_2,0)),W_2)") 2 == true
#guard isStandard (parse! "C(0,C(W_2,C(W_2,C(C(0,W_2),0))))") == true
#guard isStandardN (parse! "C(0,C(W_2,C(W_2,C(C(0,W_2),0))))") 2 == true
#guard isStandard (parse! "C(C(C(0,0),W),C(W_2,W_2))") == true
#guard isStandardN (parse! "C(C(C(0,0),C(W_2,0)),C(W_2,W_2))") 2 == true
#guard isStandard (parse! "C(C(W_2,C(W_2,C(C(0,W_2),0))),W_2)") == true
#guard isStandardN (parse! "C(C(W_2,C(W_2,C(C(0,W_2),0))),W_2)") 2 == true
#guard isStandard (parse! "C(C(C(W,W),W_2),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(W_2,0),C(W_2,0)),W_2),W_2)") 2 == true
#guard isStandard (parse! "C(C(0,0),C(C(C(0,W_2),0),W_2))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(C(0,W_2),0),W_2))") 2 == true
#guard isStandard (parse! "C(0,C(C(0,0),0))") == true
#guard isStandardN (parse! "C(0,C(C(0,0),0))") 2 == true
#guard isStandard (parse! "C(C(0,0),C(W,W_2))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(W_2,0),W_2))") 2 == true
#guard isStandard (parse! "C(C(0,0),C(C(0,0),W_2))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(0,0),W_2))") 2 == true
#guard isStandard (parse! "C(0,C(0,C(0,C(0,W))))") == true
#guard isStandardN (parse! "C(0,C(0,C(0,C(0,C(W_2,0)))))") 2 == true
#guard isStandard (parse! "C(C(C(C(C(0,W_2),0),W_2),W_2),0)") == true
#guard isStandardN (parse! "C(C(C(C(C(0,W_2),0),W_2),W_2),0)") 2 == true
#guard isStandard (parse! "C(C(W,C(W_2,W)),0)") == true
#guard isStandardN (parse! "C(C(C(W_2,0),C(W_2,C(W_2,0))),0)") 2 == true
#guard isStandard (parse! "C(C(C(C(0,W_2),0),W_2),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(0,W_2),0),W_2),W_2)") 2 == true
#guard isStandard (parse! "C(W_2,C(C(0,C(C(0,0),W_2)),0))") == true
#guard isStandardN (parse! "C(W_2,C(C(0,C(C(0,0),W_2)),0))") 2 == true
#guard isStandard (parse! "C(C(0,C(C(W_2,W),W_2)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(W_2,C(W_2,0)),W_2)),0)") 2 == true
#guard isStandard (parse! "C(C(W,W_2),C(C(W_2,W_2),W_2))") == true
#guard isStandardN (parse! "C(C(C(W_2,0),W_2),C(C(W_2,W_2),W_2))") 2 == true
#guard isStandard (parse! "C(0,C(0,C(0,C(0,0))))") == true
#guard isStandardN (parse! "C(0,C(0,C(0,C(0,0))))") 2 == true
#guard isStandard (parse! "C(C(C(W_2,W_2),C(C(W_2,W_2),0)),W_2)") == true
#guard isStandardN (parse! "C(C(C(W_2,W_2),C(C(W_2,W_2),0)),W_2)") 2 == true
#guard isStandard (parse! "C(C(0,W),C(C(W_2,W_2),0))") == true
#guard isStandardN (parse! "C(C(0,C(W_2,0)),C(C(W_2,W_2),0))") 2 == true
#guard isStandard (parse! "C(C(C(0,0),0),0)") == true
#guard isStandardN (parse! "C(C(C(0,0),0),0)") 2 == true
#guard isStandard (parse! "C(C(0,C(0,W)),C(W_2,W_2))") == true
#guard isStandardN (parse! "C(C(0,C(0,C(W_2,0))),C(W_2,W_2))") 2 == true
#guard isStandard (parse! "C(0,C(0,C(C(C(0,0),0),W_2)))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(C(0,0),0),W_2)))") 2 == true
#guard isStandard (parse! "C(C(W_2,W),W)") == true
#guard isStandardN (parse! "C(C(W_2,C(W_2,0)),C(W_2,0))") 2 == true
#guard isStandard (parse! "C(C(W,W),W_2)") == true
#guard isStandardN (parse! "C(C(C(W_2,0),C(W_2,0)),W_2)") 2 == true
#guard isStandard (parse! "C(W_2,C(W_2,C(C(0,C(0,W_2)),W_2)))") == true
#guard isStandardN (parse! "C(W_2,C(W_2,C(C(0,C(0,W_2)),W_2)))") 2 == true
#guard isStandard (parse! "C(C(W_2,C(C(W_2,C(W_2,W_2)),W_2)),0)") == true
#guard isStandardN (parse! "C(C(W_2,C(C(W_2,C(W_2,W_2)),W_2)),0)") 2 == true
#guard isStandard (parse! "C(W,C(C(C(W_2,W_2),0),0))") == true
#guard isStandardN (parse! "C(C(W_2,0),C(C(C(W_2,W_2),0),0))") 2 == true
#guard isStandard (parse! "C(C(C(C(W_2,C(W_2,W_2)),0),W_2),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(W_2,C(W_2,W_2)),0),W_2),W_2)") 2 == true
#guard isStandard (parse! "C(C(0,C(C(0,W_2),0)),W_2)") == true
#guard isStandardN (parse! "C(C(0,C(C(0,W_2),0)),W_2)") 2 == true
#guard isStandard (parse! "C(C(C(C(0,W_2),W_2),0),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(0,W_2),W_2),0),W_2)") 2 == true
#guard isStandard (parse! "C(C(W_2,C(W_2,C(C(W_2,W_2),W_2))),W_2)") == true
#guard isStandardN (parse! "C(C(W_2,C(W_2,C(C(W_2,W_2),W_2))),W_2)") 2 == true
#guard isStandard (parse! "C(C(0,C(0,C(W_2,C(W_2,W_2)))),0)") == true
#guard isStandardN (parse! "C(C(0,C(0,C(W_2,C(W_2,W_2)))),0)") 2 == true
#guard isStandard (parse! "C(0,C(C(W,W_2),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(W_2,0),W_2),0))") 2 == true
#guard isStandard (parse! "C(0,C(0,C(C(C(0,W_2),0),0)))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(C(0,W_2),0),0)))") 2 == true
#guard isStandard (parse! "C(C(0,W_2),C(C(W_2,C(W_2,W_2)),W_2))") == true
#guard isStandardN (parse! "C(C(0,W_2),C(C(W_2,C(W_2,W_2)),W_2))") 2 == true
#guard isStandard (parse! "C(W,C(W,0))") == true
#guard isStandardN (parse! "C(C(W_2,0),C(C(W_2,0),0))") 2 == true
#guard isStandard (parse! "C(0,C(0,C(C(W,W_2),0)))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(C(W_2,0),W_2),0)))") 2 == true
#guard isStandard (parse! "C(C(0,W),C(W_2,C(W_2,W_2)))") == true
#guard isStandardN (parse! "C(C(0,C(W_2,0)),C(W_2,C(W_2,W_2)))") 2 == true
#guard isStandard (parse! "C(C(0,W_2),W_2)") == true
#guard isStandardN (parse! "C(C(0,W_2),W_2)") 2 == true
#guard isStandard (parse! "C(C(C(W,W_2),W_2),0)") == true
#guard isStandardN (parse! "C(C(C(C(W_2,0),W_2),W_2),0)") 2 == true
#guard isStandard (parse! "C(W_2,C(C(C(C(W_2,W_2),W_2),W_2),W_2))") == true
#guard isStandardN (parse! "C(W_2,C(C(C(C(W_2,W_2),W_2),W_2),W_2))") 2 == true
#guard isStandard (parse! "C(0,C(C(0,0),W_2))") == true
#guard isStandardN (parse! "C(0,C(C(0,0),W_2))") 2 == true
#guard isStandard (parse! "C(C(0,0),C(C(C(0,0),W_2),W_2))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(C(0,0),W_2),W_2))") 2 == true
#guard isStandard (parse! "C(0,C(C(W_2,W),W_2))") == true
#guard isStandardN (parse! "C(0,C(C(W_2,C(W_2,0)),W_2))") 2 == true
#guard isStandard (parse! "C(C(C(C(0,W),W_2),0),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(0,C(W_2,0)),W_2),0),W_2)") 2 == true
#guard isStandard (parse! "C(C(C(0,C(C(W_2,W_2),0)),0),W_2)") == true
#guard isStandardN (parse! "C(C(C(0,C(C(W_2,W_2),0)),0),W_2)") 2 == true
#guard isStandard (parse! "C(C(0,C(C(0,W_2),0)),W)") == true
#guard isStandardN (parse! "C(C(0,C(C(0,W_2),0)),C(W_2,0))") 2 == true
#guard isStandard (parse! "C(W_2,C(C(C(C(0,W_2),0),W_2),W_2))") == true
#guard isStandardN (parse! "C(W_2,C(C(C(C(0,W_2),0),W_2),W_2))") 2 == true
#guard isStandard (parse! "C(C(W,W_2),0)") == true
#guard isStandardN (parse! "C(C(C(W_2,0),W_2),0)") 2 == true
#guard isStandard (parse! "C(C(C(W_2,C(W_2,W_2)),0),0)") == true
#guard isStandardN (parse! "C(C(C(W_2,C(W_2,W_2)),0),0)") 2 == true
#guard isStandard (parse! "C(C(C(C(0,W_2),0),W),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(0,W_2),0),C(W_2,0)),W_2)") 2 == true
#guard isStandard (parse! "C(C(C(C(W,W_2),W_2),W_2),0)") == true
#guard isStandardN (parse! "C(C(C(C(C(W_2,0),W_2),W_2),W_2),0)") 2 == true
#guard isStandard (parse! "C(C(C(0,0),C(C(W_2,W_2),0)),0)") == true
#guard isStandardN (parse! "C(C(C(0,0),C(C(W_2,W_2),0)),0)") 2 == true
#guard isStandard (parse! "C(C(C(W_2,W_2),0),C(C(W_2,W_2),W_2))") == true
#guard isStandardN (parse! "C(C(C(W_2,W_2),0),C(C(W_2,W_2),W_2))") 2 == true
#guard isStandard (parse! "C(C(0,C(C(W_2,W_2),0)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(W_2,W_2),0)),0)") 2 == true
#guard isStandard (parse! "C(0,C(0,C(C(0,0),W)))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(0,0),C(W_2,0))))") 2 == true
#guard isStandard (parse! "C(C(C(0,0),0),C(W,0))") == true
#guard isStandardN (parse! "C(C(C(0,0),0),C(C(W_2,0),0))") 2 == true
#guard isStandard (parse! "C(C(W_2,C(C(0,C(W_2,W_2)),0)),0)") == true
#guard isStandardN (parse! "C(C(W_2,C(C(0,C(W_2,W_2)),0)),0)") 2 == true
#guard isStandard (parse! "C(C(C(0,W_2),0),C(W_2,W_2))") == true
#guard isStandardN (parse! "C(C(C(0,W_2),0),C(W_2,W_2))") 2 == true
#guard isStandard (parse! "C(0,C(C(C(0,0),C(W_2,W_2)),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(0,0),C(W_2,W_2)),0))") 2 == true
#guard isStandard (parse! "C(C(C(0,C(W_2,W_2)),0),W)") == true
#guard isStandardN (parse! "C(C(C(0,C(W_2,W_2)),0),C(W_2,0))") 2 == true
#guard isStandard (parse! "C(C(C(C(0,W_2),0),C(W_2,W_2)),0)") == true
#guard isStandardN (parse! "C(C(C(C(0,W_2),0),C(W_2,W_2)),0)") 2 == true
#guard isStandard (parse! "C(C(C(C(0,0),W),0),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(0,0),C(W_2,0)),0),W_2)") 2 == true
#guard isStandard (parse! "C(C(0,0),C(C(C(0,W_2),W_2),W_2))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(C(0,W_2),W_2),W_2))") 2 == true
#guard isStandard (parse! "C(C(C(C(C(0,W_2),W_2),W_2),0),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(C(0,W_2),W_2),W_2),0),W_2)") 2 == true
#guard isStandard (parse! "C(C(C(W_2,C(C(0,W_2),0)),0),W_2)") == true
#guard isStandardN (parse! "C(C(C(W_2,C(C(0,W_2),0)),0),W_2)") 2 == true
#guard isStandard (parse! "C(0,C(C(W_2,W),C(W_2,W_2)))") == true
#guard isStandardN (parse! "C(0,C(C(W_2,C(W_2,0)),C(W_2,W_2)))") 2 == true
#guard isStandard (parse! "C(W_2,C(C(W_2,W_2),0))") == true
#guard isStandardN (parse! "C(W_2,C(C(W_2,W_2),0))") 2 == true
#guard isStandard (parse! "C(W_2,C(C(C(C(0,W_2),W_2),W_2),W_2))") == true
#guard isStandardN (parse! "C(W_2,C(C(C(C(0,W_2),W_2),W_2),W_2))") 2 == true
#guard isStandard (parse! "C(C(0,C(C(C(0,W_2),W_2),0)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(C(0,W_2),W_2),0)),0)") 2 == true
#guard isStandard (parse! "C(0,C(0,C(0,W_2)))") == true
#guard isStandardN (parse! "C(0,C(0,C(0,W_2)))") 2 == true
#guard isStandard (parse! "C(0,C(C(0,C(C(W_2,W_2),W_2)),W_2))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(C(W_2,W_2),W_2)),W_2))") 2 == true
#guard isStandard (parse! "C(C(0,W_2),C(C(0,W_2),0))") == true
#guard isStandardN (parse! "C(C(0,W_2),C(C(0,W_2),0))") 2 == true
#guard isStandard (parse! "C(C(0,C(C(0,0),C(W_2,W_2))),W_2)") == true
#guard isStandardN (parse! "C(C(0,C(C(0,0),C(W_2,W_2))),W_2)") 2 == true
#guard isStandard (parse! "C(C(0,C(C(C(0,0),0),W_2)),W_2)") == true
#guard isStandardN (parse! "C(C(0,C(C(C(0,0),0),W_2)),W_2)") 2 == true
#guard isStandard (parse! "C(C(W,W_2),C(C(W_2,W_2),0))") == true
#guard isStandardN (parse! "C(C(C(W_2,0),W_2),C(C(W_2,W_2),0))") 2 == true
#guard isStandard (parse! "C(C(C(0,C(W,W_2)),0),W_2)") == true
#guard isStandardN (parse! "C(C(C(0,C(C(W_2,0),W_2)),0),W_2)") 2 == true
#guard isStandard (parse! "C(C(0,C(0,0)),C(C(W_2,W_2),W_2))") == true
#guard isStandardN (parse! "C(C(0,C(0,0)),C(C(W_2,W_2),W_2))") 2 == true
#guard isStandard (parse! "C(C(W_2,C(W_2,C(C(0,W_2),W_2))),0)") == true
#guard isStandardN (parse! "C(C(W_2,C(W_2,C(C(0,W_2),W_2))),0)") 2 == true
#guard isStandard (parse! "C(W_2,C(W_2,W_2))") == true
#guard isStandardN (parse! "C(W_2,C(W_2,W_2))") 2 == true
#guard isStandard (parse! "C(W_2,C(C(C(W_2,W),W_2),W_2))") == true
#guard isStandardN (parse! "C(W_2,C(C(C(W_2,C(W_2,0)),W_2),W_2))") 2 == true
#guard isStandard (parse! "C(C(C(C(C(W_2,W_2),0),0),W_2),0)") == true
#guard isStandardN (parse! "C(C(C(C(C(W_2,W_2),0),0),W_2),0)") 2 == true
#guard isStandard (parse! "C(0,C(0,C(0,C(C(0,W_2),0))))") == true
#guard isStandardN (parse! "C(0,C(0,C(0,C(C(0,W_2),0))))") 2 == true
#guard isStandard (parse! "C(C(C(C(0,C(0,W_2)),W_2),W_2),0)") == true
#guard isStandardN (parse! "C(C(C(C(0,C(0,W_2)),W_2),W_2),0)") 2 == true
#guard isStandard (parse! "C(C(0,W_2),C(C(C(W_2,W_2),W_2),0))") == true
#guard isStandardN (parse! "C(C(0,W_2),C(C(C(W_2,W_2),W_2),0))") 2 == true
#guard isStandard (parse! "C(C(C(0,C(0,C(0,0))),0),W_2)") == true
#guard isStandardN (parse! "C(C(C(0,C(0,C(0,0))),0),W_2)") 2 == true
#guard isStandard (parse! "C(C(C(0,0),W_2),W_2)") == true
#guard isStandardN (parse! "C(C(C(0,0),W_2),W_2)") 2 == true
#guard isStandard (parse! "C(C(C(W,C(W_2,W_2)),0),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(W_2,0),C(W_2,W_2)),0),W_2)") 2 == true
#guard isStandard (parse! "C(W_2,C(W_2,C(W_2,C(W_2,W_2))))") == true
#guard isStandardN (parse! "C(W_2,C(W_2,C(W_2,C(W_2,W_2))))") 2 == true
#guard isStandard (parse! "C(0,C(W_2,C(C(C(0,W_2),W_2),0)))") == true
#guard isStandardN (parse! "C(0,C(W_2,C(C(C(0,W_2),W_2),0)))") 2 == true
#guard isStandard (parse! "C(C(0,0),C(C(W_2,W_2),0))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(W_2,W_2),0))") 2 == true
#guard isStandard (parse! "C(W_2,C(W_2,C(C(C(W_2,W_2),W_2),0)))") == true
#guard isStandardN (parse! "C(W_2,C(W_2,C(C(C(W_2,W_2),W_2),0)))") 2 == true
#guard isStandard (parse! "C(C(C(0,W_2),0),0)") == true
#guard isStandardN (parse! "C(C(C(0,W_2),0),0)") 2 == true
#guard isStandard (parse! "C(W,0)") == true
#guard isStandardN (parse! "C(C(W_2,0),0)") 2 == true
#guard isStandard (parse! "C(0,C(C(C(W_2,W_2),W_2),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(W_2,W_2),W_2),0))") 2 == true
#guard isStandard (parse! "C(W,C(C(W_2,W),0))") == true
#guard isStandardN (parse! "C(C(W_2,0),C(C(W_2,C(W_2,0)),0))") 2 == true
#guard isStandard (parse! "C(0,C(C(C(C(0,W_2),W_2),W_2),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(C(0,W_2),W_2),W_2),0))") 2 == true
#guard isStandard (parse! "C(C(0,0),C(W_2,C(C(W_2,W_2),W_2)))") == true
#guard isStandardN (parse! "C(C(0,0),C(W_2,C(C(W_2,W_2),W_2)))") 2 == true
#guard isStandard (parse! "C(C(C(W_2,W),W),W_2)") == true
#guard isStandardN (parse! "C(C(C(W_2,C(W_2,0)),C(W_2,0)),W_2)") 2 == true
#guard isStandard (parse! "C(W,C(C(C(0,W_2),0),W_2))") == true
#guard isStandardN (parse! "C(C(W_2,0),C(C(C(0,W_2),0),W_2))") 2 == true
#guard isStandard (parse! "C(0,C(0,C(C(C(0,0),W_2),0)))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(C(0,0),W_2),0)))") 2 == true
#guard isStandard (parse! "C(W_2,C(C(0,C(W,W_2)),W_2))") == true
#guard isStandardN (parse! "C(W_2,C(C(0,C(C(W_2,0),W_2)),W_2))") 2 == true
#guard isStandard (parse! "C(0,C(C(0,W_2),C(C(0,W_2),W_2)))") == true
#guard isStandardN (parse! "C(0,C(C(0,W_2),C(C(0,W_2),W_2)))") 2 == true
#guard isStandard (parse! "C(0,C(0,C(W_2,C(C(W_2,W_2),0))))") == true
#guard isStandardN (parse! "C(0,C(0,C(W_2,C(C(W_2,W_2),0))))") 2 == true
#guard isStandard (parse! "C(C(C(0,C(C(0,W_2),0)),0),W_2)") == true
#guard isStandardN (parse! "C(C(C(0,C(C(0,W_2),0)),0),W_2)") 2 == true
#guard isStandard (parse! "C(C(C(W_2,W),W_2),0)") == true
#guard isStandardN (parse! "C(C(C(W_2,C(W_2,0)),W_2),0)") 2 == true
#guard isStandard (parse! "C(C(C(0,C(C(0,0),W_2)),0),W_2)") == true
#guard isStandardN (parse! "C(C(C(0,C(C(0,0),W_2)),0),W_2)") 2 == true
#guard isStandard (parse! "C(C(W_2,C(C(C(W_2,W_2),W_2),0)),W_2)") == true
#guard isStandardN (parse! "C(C(W_2,C(C(C(W_2,W_2),W_2),0)),W_2)") 2 == true
#guard isStandard (parse! "C(C(C(C(C(0,0),W_2),0),W_2),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(C(0,0),W_2),0),W_2),W_2)") 2 == true
#guard isStandard (parse! "C(0,C(0,C(C(C(0,0),W_2),W_2)))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(C(0,0),W_2),W_2)))") 2 == true
#guard isStandard (parse! "C(C(0,C(0,C(W,W_2))),W_2)") == true
#guard isStandardN (parse! "C(C(0,C(0,C(C(W_2,0),W_2))),W_2)") 2 == true
#guard isStandard (parse! "C(C(C(C(C(0,0),W_2),W_2),0),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(C(0,0),W_2),W_2),0),W_2)") 2 == true
#guard isStandard (parse! "C(0,C(C(0,C(C(0,0),0)),W_2))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(C(0,0),0)),W_2))") 2 == true
#guard isStandard (parse! "C(0,C(0,C(0,C(C(W_2,W_2),0))))") == true
#guard isStandardN (parse! "C(0,C(0,C(0,C(C(W_2,W_2),0))))") 2 == true
#guard isStandard (parse! "C(C(C(W_2,C(W_2,W_2)),0),W_2)") == true
#guard isStandardN (parse! "C(C(C(W_2,C(W_2,W_2)),0),W_2)") 2 == true
#guard isStandard (parse! "C(C(0,0),W)") == true
#guard isStandardN (parse! "C(C(0,0),C(W_2,0))") 2 == true
#guard isStandard (parse! "C(0,C(W_2,C(W_2,C(C(0,W_2),W_2))))") == true
#guard isStandardN (parse! "C(0,C(W_2,C(W_2,C(C(0,W_2),W_2))))") 2 == true
#guard isStandard (parse! "C(C(C(W_2,C(C(0,W_2),W_2)),W_2),W_2)") == true
#guard isStandardN (parse! "C(C(C(W_2,C(C(0,W_2),W_2)),W_2),W_2)") 2 == true
#guard isStandard (parse! "C(C(C(0,C(0,W)),W_2),W_2)") == true
#guard isStandardN (parse! "C(C(C(0,C(0,C(W_2,0))),W_2),W_2)") 2 == true
#guard isStandard (parse! "C(C(0,0),C(C(0,C(W_2,W_2)),W_2))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(0,C(W_2,W_2)),W_2))") 2 == true
#guard isStandard (parse! "C(C(C(0,C(0,0)),0),W_2)") == true
#guard isStandardN (parse! "C(C(C(0,C(0,0)),0),W_2)") 2 == true
#guard isStandard (parse! "C(0,C(C(0,C(0,C(0,W_2))),W_2))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(0,C(0,W_2))),W_2))") 2 == true
#guard isStandard (parse! "C(C(0,W_2),C(C(C(0,0),W_2),W_2))") == true
#guard isStandardN (parse! "C(C(0,W_2),C(C(C(0,0),W_2),W_2))") 2 == true
#guard isStandard (parse! "C(C(0,C(C(W_3,W_2),W_3)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(W_3,C(W_3,0)),W_3)),0)") 3 == true
#guard isStandard (parse! "C(C(0,C(W_2,W_2)),W_3)") == true
#guard isStandardN (parse! "C(C(0,C(C(W_3,0),C(W_3,0))),W_3)") 3 == true
#guard isStandard (parse! "C(C(W_3,C(C(C(0,W_3),W_3),0)),W_3)") == true
#guard isStandardN (parse! "C(C(W_3,C(C(C(0,W_3),W_3),0)),W_3)") 3 == true
#guard isStandard (parse! "C(C(C(W_3,C(C(W_3,W_3),W_3)),W_3),W_3)") == true
#guard isStandardN (parse! "C(C(C(W_3,C(C(W_3,W_3),W_3)),W_3),W_3)") 3 == true
#guard isStandard (parse! "C(C(0,C(C(C(W_3,W_3),0),0)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(C(W_3,W_3),0),0)),0)") 3 == true
#guard isStandard (parse! "C(W_3,C(W_3,C(W_3,C(C(W_3,W_3),0))))") == true
#guard isStandardN (parse! "C(W_3,C(W_3,C(W_3,C(C(W_3,W_3),0))))") 3 == true
#guard isStandard (parse! "C(0,C(C(0,W_3),C(C(0,W_3),0)))") == true
#guard isStandardN (parse! "C(0,C(C(0,W_3),C(C(0,W_3),0)))") 3 == true
#guard isStandard (parse! "C(0,C(C(0,C(0,C(0,W_3))),0))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(0,C(0,W_3))),0))") 3 == true
#guard isStandard (parse! "C(W_3,C(C(0,C(W_2,W_3)),0))") == true
#guard isStandardN (parse! "C(W_3,C(C(0,C(C(W_3,0),W_3)),0))") 3 == true
#guard isStandard (parse! "C(0,C(C(C(C(W_3,W_3),W_3),W_3),W_3))") == true
#guard isStandardN (parse! "C(0,C(C(C(C(W_3,W_3),W_3),W_3),W_3))") 3 == true
#guard isStandard (parse! "C(W_3,C(C(W_3,C(C(0,W_3),W_3)),W_3))") == true
#guard isStandardN (parse! "C(W_3,C(C(W_3,C(C(0,W_3),W_3)),W_3))") 3 == true
#guard isStandard (parse! "C(0,C(C(0,0),C(C(0,0),0)))") == true
#guard isStandardN (parse! "C(0,C(C(0,0),C(C(0,0),0)))") 3 == true
#guard isStandard (parse! "C(C(0,C(C(0,C(W_3,W_3)),0)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(0,C(W_3,W_3)),0)),0)") 3 == true
#guard isStandard (parse! "C(C(W_3,C(W_3,C(C(W_3,W_3),0))),W_3)") == true
#guard isStandardN (parse! "C(C(W_3,C(W_3,C(C(W_3,W_3),0))),W_3)") 3 == true
#guard isStandard (parse! "C(C(C(C(C(W_3,W_3),W_3),W_3),0),W_3)") == true
#guard isStandardN (parse! "C(C(C(C(C(W_3,W_3),W_3),W_3),0),W_3)") 3 == true
#guard isStandard (parse! "C(C(C(C(0,W_2),W_3),W_3),W_3)") == true
#guard isStandardN (parse! "C(C(C(C(0,C(W_3,0)),W_3),W_3),W_3)") 3 == true
#guard isStandard (parse! "C(C(W,0),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(W_3,0),0),0),C(W_3,0))") 3 == true
#guard isStandard (parse! "C(C(C(C(C(0,0),0),0),W_3),W_3)") == true
#guard isStandardN (parse! "C(C(C(C(C(0,0),0),0),W_3),W_3)") 3 == true
#guard isStandard (parse! "C(0,C(W_2,C(W_3,C(W_3,W_3))))") == true
#guard isStandardN (parse! "C(0,C(C(W_3,0),C(W_3,C(W_3,W_3))))") 3 == true
#guard isStandard (parse! "C(C(C(C(0,C(0,W_3)),0),0),0)") == true
#guard isStandardN (parse! "C(C(C(C(0,C(0,W_3)),0),0),0)") 3 == true
#guard isStandard (parse! "C(C(0,0),C(W_3,W_3))") == true
#guard isStandardN (parse! "C(C(0,0),C(W_3,W_3))") 3 == true
#guard isStandard (parse! "C(0,C(C(C(0,W_3),0),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(0,W_3),0),0))") 3 == true
#guard isStandard (parse! "C(W_2,C(C(C(0,0),W_3),W_3))") == true
#guard isStandardN (parse! "C(C(W_3,0),C(C(C(0,0),W_3),W_3))") 3 == true
#guard isStandard (parse! "C(W_3,C(C(C(0,W_2),W_3),W_3))") == true
#guard isStandardN (parse! "C(W_3,C(C(C(0,C(W_3,0)),W_3),W_3))") 3 == true
#guard isStandard (parse! "C(C(C(C(0,0),0),W_2),0)") == true
#guard isStandardN (parse! "C(C(C(C(0,0),0),C(W_3,0)),0)") 3 == true
#guard isStandard (parse! "C(C(C(C(W_2,W_3),W_3),0),0)") == true
#guard isStandardN (parse! "C(C(C(C(C(W_3,0),W_3),W_3),0),0)") 3 == true
#guard isStandard (parse! "C(C(0,C(0,C(C(0,W_3),0))),W_3)") == true
#guard isStandardN (parse! "C(C(0,C(0,C(C(0,W_3),0))),W_3)") 3 == true
#guard isStandard (parse! "C(C(0,C(0,C(0,0))),W_3)") == true
#guard isStandardN (parse! "C(C(0,C(0,C(0,0))),W_3)") 3 == true
#guard isStandard (parse! "C(C(W_2,C(W_3,W_2)),0)") == true
#guard isStandardN (parse! "C(C(C(W_3,0),C(W_3,C(W_3,0))),0)") 3 == true
#guard isStandard (parse! "C(C(C(C(W_3,W_3),W_3),W_3),W_3)") == true
#guard isStandardN (parse! "C(C(C(C(W_3,W_3),W_3),W_3),W_3)") 3 == true
#guard isStandard (parse! "C(C(0,C(C(C(0,W_3),W_3),W_3)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(C(0,W_3),W_3),W_3)),0)") 3 == true
#guard isStandard (parse! "C(0,C(0,C(C(C(W_3,W_3),0),W_3)))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(C(W_3,W_3),0),W_3)))") 3 == true
#guard isStandard (parse! "C(C(C(0,C(W_2,W_3)),0),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(C(W_3,0),W_3)),0),0)") 3 == true
#guard isStandard (parse! "C(C(W_3,C(W_3,W_3)),0)") == true
#guard isStandardN (parse! "C(C(W_3,C(W_3,W_3)),0)") 3 == true
#guard isStandard (parse! "C(C(C(C(C(0,W_3),W_3),0),0),0)") == true
#guard isStandardN (parse! "C(C(C(C(C(0,W_3),W_3),0),0),0)") 3 == true
#guard isStandard (parse! "C(0,C(C(0,C(0,W_3)),W_3))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(0,W_3)),W_3))") 3 == true
#guard isStandard (parse! "C(C(C(C(W_2,W_3),W_3),0),W_3)") == true
#guard isStandardN (parse! "C(C(C(C(C(W_3,0),W_3),W_3),0),W_3)") 3 == true
#guard isStandard (parse! "C(W_2,C(C(C(W_3,W_3),0),0))") == true
#guard isStandardN (parse! "C(C(W_3,0),C(C(C(W_3,W_3),0),0))") 3 == true
#guard isStandard (parse! "C(C(C(0,0),0),C(C(0,W_3),0))") == true
#guard isStandardN (parse! "C(C(C(0,0),0),C(C(0,W_3),0))") 3 == true
#guard isStandard (parse! "C(C(0,0),C(C(C(0,W_3),0),0))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(C(0,W_3),0),0))") 3 == true
#guard isStandard (parse! "C(C(W_3,C(C(C(W_3,W_3),W_3),W_3)),W_3)") == true
#guard isStandardN (parse! "C(C(W_3,C(C(C(W_3,W_3),W_3),W_3)),W_3)") 3 == true
#guard isStandard (parse! "C(C(C(0,C(W_3,W_3)),0),W_3)") == true
#guard isStandardN (parse! "C(C(C(0,C(W_3,W_3)),0),W_3)") 3 == true
#guard isStandard (parse! "C(0,C(C(C(C(0,0),W_3),0),W_3))") == true
#guard isStandardN (parse! "C(0,C(C(C(C(0,0),W_3),0),W_3))") 3 == true
#guard isStandard (parse! "C(C(C(0,C(C(0,0),W_3)),0),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(C(0,0),W_3)),0),0)") 3 == true
#guard isStandard (parse! "C(C(C(C(0,0),W_2),0),W_3)") == true
#guard isStandardN (parse! "C(C(C(C(0,0),C(W_3,0)),0),W_3)") 3 == true
#guard isStandard (parse! "C(C(C(C(W_3,W_3),W_3),0),C(W_3,W_3))") == true
#guard isStandardN (parse! "C(C(C(C(W_3,W_3),W_3),0),C(W_3,W_3))") 3 == true
#guard isStandard (parse! "C(W_3,C(C(0,C(0,W_3)),0))") == true
#guard isStandardN (parse! "C(W_3,C(C(0,C(0,W_3)),0))") 3 == true
#guard isStandard (parse! "C(W_2,C(W_3,C(C(W_3,W_3),0)))") == true
#guard isStandardN (parse! "C(C(W_3,0),C(W_3,C(C(W_3,W_3),0)))") 3 == true
#guard isStandard (parse! "C(0,C(C(0,C(0,C(W_3,W_3))),W_3))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(0,C(W_3,W_3))),W_3))") 3 == true
#guard isStandard (parse! "C(C(C(0,W_3),C(C(0,W_3),W_3)),W_3)") == true
#guard isStandardN (parse! "C(C(C(0,W_3),C(C(0,W_3),W_3)),W_3)") 3 == true
#guard isStandard (parse! "C(C(C(C(C(0,0),W_3),0),0),W_3)") == true
#guard isStandardN (parse! "C(C(C(C(C(0,0),W_3),0),0),W_3)") 3 == true
#guard isStandard (parse! "C(C(C(0,C(0,W_3)),0),W_3)") == true
#guard isStandardN (parse! "C(C(C(0,C(0,W_3)),0),W_3)") 3 == true
#guard isStandard (parse! "C(0,C(C(W_3,C(C(0,W_3),W_3)),0))") == true
#guard isStandardN (parse! "C(0,C(C(W_3,C(C(0,W_3),W_3)),0))") 3 == true
#guard isStandard (parse! "C(W_2,C(C(0,W_2),0))") == true
#guard isStandardN (parse! "C(C(W_3,0),C(C(0,C(W_3,0)),0))") 3 == true
#guard isStandard (parse! "C(0,C(C(C(0,0),W_2),W_3))") == true
#guard isStandardN (parse! "C(0,C(C(C(0,0),C(W_3,0)),W_3))") 3 == true
#guard isStandard (parse! "C(C(C(C(0,W_2),W_3),0),0)") == true
#guard isStandardN (parse! "C(C(C(C(0,C(W_3,0)),W_3),0),0)") 3 == true
#guard isStandard (parse! "C(C(C(0,C(W_3,C(W_3,W_3))),W_3),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(W_3,C(W_3,W_3))),W_3),0)") 3 == true
#guard isStandard (parse! "C(0,C(C(C(0,0),C(W_3,W_3)),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(0,0),C(W_3,W_3)),0))") 3 == true
#guard isStandard (parse! "C(W_3,C(C(W_3,C(C(0,W_3),W_3)),0))") == true
#guard isStandardN (parse! "C(W_3,C(C(W_3,C(C(0,W_3),W_3)),0))") 3 == true
#guard isStandard (parse! "C(C(C(C(C(0,W_3),0),W_3),W_3),W_3)") == true
#guard isStandardN (parse! "C(C(C(C(C(0,W_3),0),W_3),W_3),W_3)") 3 == true
#guard isStandard (parse! "C(C(C(C(0,0),C(W_3,W_3)),0),0)") == true
#guard isStandardN (parse! "C(C(C(C(0,0),C(W_3,W_3)),0),0)") 3 == true
#guard isStandard (parse! "C(C(C(W_3,C(W_3,C(W_3,W_3))),0),0)") == true
#guard isStandardN (parse! "C(C(C(W_3,C(W_3,C(W_3,W_3))),0),0)") 3 == true
#guard isStandard (parse! "C(C(0,C(W_3,C(W_3,W_3))),W_3)") == true
#guard isStandardN (parse! "C(C(0,C(W_3,C(W_3,W_3))),W_3)") 3 == true
#guard isStandard (parse! "C(C(W_2,W),W_3)") == true
#guard isStandardN (parse! "C(C(C(W_3,0),C(C(W_3,0),0)),W_3)") 3 == true
#guard isStandard (parse! "C(C(0,C(C(W_3,W_3),0)),W_2)") == true
#guard isStandardN (parse! "C(C(0,C(C(W_3,W_3),0)),C(W_3,0))") 3 == true
#guard isStandard (parse! "C(C(0,0),C(C(0,0),C(W_3,W_3)))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(0,0),C(W_3,W_3)))") 3 == true
#guard isStandard (parse! "C(0,C(C(C(C(W_3,W_3),W_3),W_3),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(C(W_3,W_3),W_3),W_3),0))") 3 == true
#guard isStandard (parse! "C(0,C(C(C(W_2,W_3),0),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(C(W_3,0),W_3),0),0))") 3 == true
#guard isStandard (parse! "C(0,C(C(0,W),W_3))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(C(W_3,0),0)),W_3))") 3 == true
#guard isStandard (parse! "C(W_3,C(W_3,C(C(0,C(0,W_3)),0)))") == true
#guard isStandardN (parse! "C(W_3,C(W_3,C(C(0,C(0,W_3)),0)))") 3 == true
#guard isStandard (parse! "C(C(W_3,C(W_3,C(W_3,W_3))),0)") == true
#guard isStandardN (parse! "C(C(W_3,C(W_3,C(W_3,W_3))),0)") 3 == true
#guard isStandard (parse! "C(C(0,0),C(W_3,W_2))") == true
#guard isStandardN (parse! "C(C(0,0),C(W_3,C(W_3,0)))") 3 == true
#guard isStandard (parse! "C(C(C(0,C(0,0)),0),W_3)") == true
#guard isStandardN (parse! "C(C(C(0,C(0,0)),0),W_3)") 3 == true
#guard isStandard (parse! "C(C(C(W_3,W_3),C(C(W_3,W_3),0)),W_3)") == true
#guard isStandardN (parse! "C(C(C(W_3,W_3),C(C(W_3,W_3),0)),W_3)") 3 == true
#guard isStandard (parse! "C(W_3,C(C(C(0,0),W_3),W_3))") == true
#guard isStandardN (parse! "C(W_3,C(C(C(0,0),W_3),W_3))") 3 == true
#guard isStandard (parse! "C(C(C(W_3,W_2),C(W_3,W_3)),0)") == true
#guard isStandardN (parse! "C(C(C(W_3,C(W_3,0)),C(W_3,W_3)),0)") 3 == true
#guard isStandard (parse! "C(0,C(W_3,C(C(W_3,C(W_3,W_3)),0)))") == true
#guard isStandardN (parse! "C(0,C(W_3,C(C(W_3,C(W_3,W_3)),0)))") 3 == true
#guard isStandard (parse! "C(0,C(C(W_3,C(C(W_3,W_3),0)),0))") == true
#guard isStandardN (parse! "C(0,C(C(W_3,C(C(W_3,W_3),0)),0))") 3 == true
#guard isStandard (parse! "C(W_3,C(C(0,C(C(0,0),W_3)),W_3))") == true
#guard isStandardN (parse! "C(W_3,C(C(0,C(C(0,0),W_3)),W_3))") 3 == true
#guard isStandard (parse! "C(0,C(0,C(W_3,C(C(0,W_3),0))))") == true
#guard isStandardN (parse! "C(0,C(0,C(W_3,C(C(0,W_3),0))))") 3 == true
#guard isStandard (parse! "C(W_3,C(W_3,C(C(C(W_3,W_3),W_3),W_3)))") == true
#guard isStandardN (parse! "C(W_3,C(W_3,C(C(C(W_3,W_3),W_3),W_3)))") 3 == true
#guard isStandard (parse! "C(W,C(C(0,W_3),0))") == true
#guard isStandardN (parse! "C(C(C(W_3,0),0),C(C(0,W_3),0))") 3 == true
#guard isStandard (parse! "C(0,C(W_3,C(C(C(W_3,W_3),W_3),0)))") == true
#guard isStandardN (parse! "C(0,C(W_3,C(C(C(W_3,W_3),W_3),0)))") 3 == true
#guard isStandard (parse! "C(0,W)") == true
#guard isStandardN (parse! "C(0,C(C(W_3,0),0))") 3 == true
#guard isStandard (parse! "C(C(C(W_3,C(C(0,W_3),0)),W_3),W_3)") == true
#guard isStandardN (parse! "C(C(C(W_3,C(C(0,W_3),0)),W_3),W_3)") 3 == true
#guard isStandard (parse! "C(C(C(C(C(0,0),0),0),0),0)") == true
#guard isStandardN (parse! "C(C(C(C(C(0,0),0),0),0),0)") 3 == true
#guard isStandard (parse! "C(C(W_2,C(C(0,W_3),W_3)),W_3)") == true
#guard isStandardN (parse! "C(C(C(W_3,0),C(C(0,W_3),W_3)),W_3)") 3 == true
#guard isStandard (parse! "C(C(C(C(C(W_3,W_3),W_3),W_3),W_3),0)") == true
#guard isStandardN (parse! "C(C(C(C(C(W_3,W_3),W_3),W_3),W_3),0)") 3 == true
#guard isStandard (parse! "C(C(0,C(0,C(W_3,W_2))),0)") == true
#guard isStandardN (parse! "C(C(0,C(0,C(W_3,C(W_3,0)))),0)") 3 == true
#guard isStandard (parse! "C(0,C(C(C(W_3,C(W_3,W_3)),0),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(W_3,C(W_3,W_3)),0),0))") 3 == true
#guard isStandard (parse! "C(C(C(0,0),W_3),0)") == true
#guard isStandardN (parse! "C(C(C(0,0),W_3),0)") 3 == true
#guard isStandard (parse! "C(C(0,W_2),C(W_3,W_2))") == true
#guard isStandardN (parse! "C(C(0,C(W_3,0)),C(W_3,C(W_3,0)))") 3 == true
#guard isStandard (parse! "C(C(C(C(W_3,C(W_3,W_3)),W_3),W_3),0)") == true
#guard isStandardN (parse! "C(C(C(C(W_3,C(W_3,W_3)),W_3),W_3),0)") 3 == true
#guard isStandard (parse! "C(C(0,C(C(W_3,W_3),0)),W_3)") == true
#guard isStandardN (parse! "C(C(0,C(C(W_3,W_3),0)),W_3)") 3 == true
#guard isStandard (parse! "C(0,C(C(W_2,C(W_3,W_3)),W_3))") == true
#guard isStandardN (parse! "C(0,C(C(C(W_3,0),C(W_3,W_3)),W_3))") 3 == true
#guard isStandard (parse! "C(W_3,C(C(0,C(0,W_3)),W_3))") == true
#guard isStandardN (parse! "C(W_3,C(C(0,C(0,W_3)),W_3))") 3 == true
#guard isStandard (parse! "C(C(0,0),C(C(W_2,W_3),0))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(C(W_3,0),W_3),0))") 3 == true
#guard isStandard (parse! "C(C(C(W_2,C(W_3,W_3)),0),0)") == true
#guard isStandardN (parse! "C(C(C(C(W_3,0),C(W_3,W_3)),0),0)") 3 == true
#guard isStandard (parse! "C(C(W_3,C(C(W_2,W_3),W_3)),0)") == true
#guard isStandardN (parse! "C(C(W_3,C(C(C(W_3,0),W_3),W_3)),0)") 3 == true
#guard isStandard (parse! "C(C(W_3,C(W_3,W_3)),W_3)") == true
#guard isStandardN (parse! "C(C(W_3,C(W_3,W_3)),W_3)") 3 == true
#guard isStandard (parse! "C(0,C(C(W_3,W_2),C(W_3,W_3)))") == true
#guard isStandardN (parse! "C(0,C(C(W_3,C(W_3,0)),C(W_3,W_3)))") 3 == true
#guard isStandard (parse! "C(0,C(C(C(0,W_3),0),W_2))") == true
#guard isStandardN (parse! "C(0,C(C(C(0,W_3),0),C(W_3,0)))") 3 == true
#guard isStandard (parse! "C(C(C(0,W_3),0),C(W_3,W_3))") == true
#guard isStandardN (parse! "C(C(C(0,W_3),0),C(W_3,W_3))") 3 == true
#guard isStandard (parse! "C(C(0,C(W_3,C(C(W_3,W_3),0))),0)") == true
#guard isStandardN (parse! "C(C(0,C(W_3,C(C(W_3,W_3),0))),0)") 3 == true
#guard isStandard (parse! "C(C(0,C(W_2,W_3)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(W_3,0),W_3)),0)") 3 == true
#guard isStandard (parse! "C(C(C(W_3,C(W_3,W_2)),W_3),0)") == true
#guard isStandardN (parse! "C(C(C(W_3,C(W_3,C(W_3,0))),W_3),0)") 3 == true
#guard isStandard (parse! "C(C(C(C(0,C(0,0)),0),0),W_3)") == true
#guard isStandardN (parse! "C(C(C(C(0,C(0,0)),0),0),W_3)") 3 == true
#guard isStandard (parse! "C(W_2,C(W_3,C(W_3,W_3)))") == true
#guard isStandardN (parse! "C(C(W_3,0),C(W_3,C(W_3,W_3)))") 3 == true
#guard isStandard (parse! "C(C(C(C(0,0),W_3),0),0)") == true
#guard isStandardN (parse! "C(C(C(C(0,0),W_3),0),0)") 3 == true
#guard isStandard (parse! "C(0,C(0,C(C(W_2,W_3),W_3)))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(C(W_3,0),W_3),W_3)))") 3 == true
#guard isStandard (parse! "C(C(C(0,C(0,C(W_3,W_3))),0),W_3)") == true
#guard isStandardN (parse! "C(C(C(0,C(0,C(W_3,W_3))),0),W_3)") 3 == true
#guard isStandard (parse! "C(C(0,0),C(C(0,W_3),W_3))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(0,W_3),W_3))") 3 == true
#guard isStandard (parse! "C(C(C(0,0),0),C(W_3,C(W_3,W_3)))") == true
#guard isStandardN (parse! "C(C(C(0,0),0),C(W_3,C(W_3,W_3)))") 3 == true
#guard isStandard (parse! "C(C(W_3,C(W_3,C(C(W_3,W_3),0))),0)") == true
#guard isStandardN (parse! "C(C(W_3,C(W_3,C(C(W_3,W_3),0))),0)") 3 == true
#guard isStandard (parse! "C(C(0,C(W_3,C(C(0,W_3),W_3))),W_3)") == true
#guard isStandardN (parse! "C(C(0,C(W_3,C(C(0,W_3),W_3))),W_3)") 3 == true
#guard isStandard (parse! "C(W,W_3)") == true
#guard isStandardN (parse! "C(C(C(W_3,0),0),W_3)") 3 == true
#guard isStandard (parse! "C(C(C(C(C(W_3,W_3),W_3),0),0),W_3)") == true
#guard isStandardN (parse! "C(C(C(C(C(W_3,W_3),W_3),0),0),W_3)") 3 == true
#guard isStandard (parse! "C(W_3,C(C(0,C(W_3,W_3)),0))") == true
#guard isStandardN (parse! "C(W_3,C(C(0,C(W_3,W_3)),0))") 3 == true
#guard isStandard (parse! "C(C(C(W_2,W_2),W_3),0)") == true
#guard isStandardN (parse! "C(C(C(C(W_3,0),C(W_3,0)),W_3),0)") 3 == true
#guard isStandard (parse! "C(C(0,W_2),W_2)") == true
#guard isStandardN (parse! "C(C(0,C(W_3,0)),C(W_3,0))") 3 == true
#guard isStandard (parse! "C(C(C(W_3,C(C(W_3,W_3),W_3)),0),W_3)") == true
#guard isStandardN (parse! "C(C(C(W_3,C(C(W_3,W_3),W_3)),0),W_3)") 3 == true
#guard isStandard (parse! "C(W_2,C(C(0,C(W_3,W_3)),W_3))") == true
#guard isStandardN (parse! "C(C(W_3,0),C(C(0,C(W_3,W_3)),W_3))") 3 == true
#guard isStandard (parse! "C(C(C(0,W_2),W_3),W_3)") == true
#guard isStandardN (parse! "C(C(C(0,C(W_3,0)),W_3),W_3)") 3 == true
#guard isStandard (parse! "C(C(C(0,0),W_2),0)") == true
#guard isStandardN (parse! "C(C(C(0,0),C(W_3,0)),0)") 3 == true
#guard isStandard (parse! "C(C(0,0),C(C(0,C(W_3,W_3)),0))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(0,C(W_3,W_3)),0))") 3 == true
#guard isStandard (parse! "C(C(C(W_3,C(W_3,W_2)),W_3),W_3)") == true
#guard isStandardN (parse! "C(C(C(W_3,C(W_3,C(W_3,0))),W_3),W_3)") 3 == true
#guard isStandard (parse! "C(C(W_3,C(C(C(0,W_3),W_3),W_3)),0)") == true
#guard isStandardN (parse! "C(C(W_3,C(C(C(0,W_3),W_3),W_3)),0)") 3 == true
#guard isStandard (parse! "C(C(0,0),C(C(0,C(0,0)),0))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(0,C(0,0)),0))") 3 == true
#guard isStandard (parse! "C(0,C(W_3,C(C(C(0,0),W_3),0)))") == true
#guard isStandardN (parse! "C(0,C(W_3,C(C(C(0,0),W_3),0)))") 3 == true
#guard isStandard (parse! "C(W_3,C(C(C(0,0),W_3),0))") == true
#guard isStandardN (parse! "C(W_3,C(C(C(0,0),W_3),0))") 3 == true
#guard isStandard (parse! "C(C(W_3,C(W_3,W_2)),W_2)") == true
#guard isStandardN (parse! "C(C(W_3,C(W_3,C(W_3,0))),C(W_3,0))") 3 == true
#guard isStandard (parse! "C(C(0,0),C(C(C(W_3,W_3),W_3),0))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(C(W_3,W_3),W_3),0))") 3 == true
#guard isStandard (parse! "C(0,C(C(0,C(W_3,W_2)),W_3))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(W_3,C(W_3,0))),W_3))") 3 == true
#guard isStandard (parse! "C(C(C(0,C(W_3,C(W_3,W_3))),0),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(W_3,C(W_3,W_3))),0),0)") 3 == true
#guard isStandard (parse! "C(W_3,C(C(0,C(0,C(W_3,W_3))),W_3))") == true
#guard isStandardN (parse! "C(W_3,C(C(0,C(0,C(W_3,W_3))),W_3))") 3 == true
#guard isStandard (parse! "C(0,C(C(C(0,C(0,0)),0),W_3))") == true
#guard isStandardN (parse! "C(0,C(C(C(0,C(0,0)),0),W_3))") 3 == true
#guard isStandard (parse! "C(0,C(C(C(C(0,0),0),W_3),W_3))") == true
#guard isStandardN (parse! "C(0,C(C(C(C(0,0),0),W_3),W_3))") 3 == true
#guard isStandard (parse! "C(0,C(W_3,C(C(0,C(0,W_3)),W_3)))") == true
#guard isStandardN (parse! "C(0,C(W_3,C(C(0,C(0,W_3)),W_3)))") 3 == true
#guard isStandard (parse! "C(C(0,W_3),C(C(0,C(0,W_3)),0))") == true
#guard isStandardN (parse! "C(C(0,W_3),C(C(0,C(0,W_3)),0))") 3 == true
#guard isStandard (parse! "C(0,C(0,C(C(W_3,C(W_3,W_3)),0)))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(W_3,C(W_3,W_3)),0)))") 3 == true
#guard isStandard (parse! "C(C(C(W_3,W_2),0),0)") == true
#guard isStandardN (parse! "C(C(C(W_3,C(W_3,0)),0),0)") 3 == true
#guard isStandard (parse! "C(C(0,C(C(0,W_3),0)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(0,W_3),0)),0)") 3 == true
#guard isStandard (parse! "C(0,C(C(W_3,C(W_3,W_3)),W_3))") == true
#guard isStandardN (parse! "C(0,C(C(W_3,C(W_3,W_3)),W_3))") 3 == true
#guard isStandard (parse! "C(W_3,C(C(0,C(0,C(W_3,W_3))),0))") == true
#guard isStandardN (parse! "C(W_3,C(C(0,C(0,C(W_3,W_3))),0))") 3 == true
#guard isStandard (parse! "C(C(W_2,W_2),0)") == true
#guard isStandardN (parse! "C(C(C(W_3,0),C(W_3,0)),0)") 3 == true
#guard isStandard (parse! "C(0,C(C(0,C(W_3,W_3)),W_3))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(W_3,W_3)),W_3))") 3 == true
#guard isStandard (parse! "C(C(C(C(0,C(0,0)),W_3),W_3),W_3)") == true
#guard isStandardN (parse! "C(C(C(C(0,C(0,0)),W_3),W_3),W_3)") 3 == true
#guard isStandard (parse! "C(C(0,C(C(0,0),0)),W_2)") == true
#guard isStandardN (parse! "C(C(0,C(C(0,0),0)),C(W_3,0))") 3 == true
#guard isStandard (parse! "C(C(C(0,W_3),C(C(W_3,W_3),W_3)),W_3)") == true
#guard isStandardN (parse! "C(C(C(0,W_3),C(C(W_3,W_3),W_3)),W_3)") 3 == true
#guard isStandard (parse! "C(0,C(C(C(0,C(0,W_3)),0),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(0,C(0,W_3)),0),0))") 3 == true
#guard isStandard (parse! "C(C(C(W_3,W_2),W_3),0)") == true
#guard isStandardN (parse! "C(C(C(W_3,C(W_3,0)),W_3),0)") 3 == true
#guard isStandard (parse! "C(C(C(C(C(0,W_3),0),W_3),0),W_3)") == true
#guard isStandardN (parse! "C(C(C(C(C(0,W_3),0),W_3),0),W_3)") 3 == true
#guard isStandard (parse! "C(0,C(C(C(W_3,C(W_3,W_3)),0),W_3))") == true
#guard isStandardN (parse! "C(0,C(C(C(W_3,C(W_3,W_3)),0),W_3))") 3 == true
#guard isStandard (parse! "C(C(C(W_3,W_3),0),0)") == true
#guard isStandardN (parse! "C(C(C(W_3,W_3),0),0)") 3 == true
#guard isStandard (parse! "C(C(C(0,0),C(C(W_3,W_3),W_3)),0)") == true
#guard isStandardN (parse! "C(C(C(0,0),C(C(W_3,W_3),W_3)),0)") 3 == true
#guard isStandard (parse! "C(W_2,C(C(W_3,W_3),0))") == true
#guard isStandardN (parse! "C(C(W_3,0),C(C(W_3,W_3),0))") 3 == true
#guard isStandard (parse! "C(0,C(C(W_3,C(C(W_3,W_3),0)),W_3))") == true
#guard isStandardN (parse! "C(0,C(C(W_3,C(C(W_3,W_3),0)),W_3))") 3 == true
#guard isStandard (parse! "C(W_2,C(C(W_2,W_3),W_3))") == true
#guard isStandardN (parse! "C(C(W_3,0),C(C(C(W_3,0),W_3),W_3))") 3 == true
#guard isStandard (parse! "C(C(C(0,C(0,W_3)),0),C(W_3,W_3))") == true
#guard isStandardN (parse! "C(C(C(0,C(0,W_3)),0),C(W_3,W_3))") 3 == true
#guard isStandard (parse! "C(C(0,C(0,C(W_3,C(W_3,W_3)))),0)") == true
#guard isStandardN (parse! "C(C(0,C(0,C(W_3,C(W_3,W_3)))),0)") 3 == true
#guard isStandard (parse! "C(C(C(W_3,C(C(0,W_3),W_3)),0),W_3)") == true
#guard isStandardN (parse! "C(C(C(W_3,C(C(0,W_3),W_3)),0),W_3)") 3 == true
#guard isStandard (parse! "C(0,C(C(W,0),W_3))") == true
#guard isStandardN (parse! "C(0,C(C(C(C(W_3,0),0),0),W_3))") 3 == true
#guard isStandard (parse! "C(C(C(0,0),C(W_3,C(W_3,W_3))),0)") == true
#guard isStandardN (parse! "C(C(C(0,0),C(W_3,C(W_3,W_3))),0)") 3 == true
#guard isStandard (parse! "C(W_3,C(C(W_2,W_3),W_3))") == true
#guard isStandardN (parse! "C(W_3,C(C(C(W_3,0),W_3),W_3))") 3 == true
#guard isStandard (parse! "C(C(C(W_2,C(W_3,W_3)),0),W_3)") == true
#guard isStandardN (parse! "C(C(C(C(W_3,0),C(W_3,W_3)),0),W_3)") 3 == true
#guard isStandard (parse! "C(W_2,C(C(W_3,C(W_3,W_3)),0))") == true
#guard isStandardN (parse! "C(C(W_3,0),C(C(W_3,C(W_3,W_3)),0))") 3 == true
#guard isStandard (parse! "C(C(C(C(0,0),0),0),C(W_3,W_3))") == true
#guard isStandardN (parse! "C(C(C(C(0,0),0),0),C(W_3,W_3))") 3 == true
#guard isStandard (parse! "C(0,C(W_3,C(W_3,C(W_3,W_2))))") == true
#guard isStandardN (parse! "C(0,C(W_3,C(W_3,C(W_3,C(W_3,0)))))") 3 == true
#guard isStandard (parse! "C(C(C(W_3,W_2),W_2),0)") == true
#guard isStandardN (parse! "C(C(C(W_3,C(W_3,0)),C(W_3,0)),0)") 3 == true
#guard isStandard (parse! "C(W_3,C(C(W_2,C(W_3,W_3)),W_3))") == true
#guard isStandardN (parse! "C(W_3,C(C(C(W_3,0),C(W_3,W_3)),W_3))") 3 == true
#guard isStandard (parse! "C(C(C(C(W_3,W_3),0),W_3),0)") == true
#guard isStandardN (parse! "C(C(C(C(W_3,W_3),0),W_3),0)") 3 == true
#guard isStandard (parse! "C(C(0,C(0,0)),W_2)") == true
#guard isStandardN (parse! "C(C(0,C(0,0)),C(W_3,0))") 3 == true
#guard isStandard (parse! "C(W_2,C(C(C(0,W_3),W_3),W_3))") == true
#guard isStandardN (parse! "C(C(W_3,0),C(C(C(0,W_3),W_3),W_3))") 3 == true
#guard isStandard (parse! "C(C(0,0),C(W_2,C(W_3,W_3)))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(W_3,0),C(W_3,W_3)))") 3 == true
#guard isStandard (parse! "C(0,C(C(0,0),W_2))") == true
#guard isStandardN (parse! "C(0,C(C(0,0),C(W_3,0)))") 3 == true
#guard isStandard (parse! "C(C(0,W_3),W_3)") == true
#guard isStandardN (parse! "C(C(0,W_3),W_3)") 3 == true
#guard isStandard (parse! "C(0,C(0,C(C(0,C(0,0)),W_3)))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(0,C(0,0)),W_3)))") 3 == true
#guard isStandard (parse! "C(C(W_3,W_3),C(C(C(W_3,W_3),W_3),W_3))") == true
#guard isStandardN (parse! "C(C(W_3,W_3),C(C(C(W_3,W_3),W_3),W_3))") 3 == true
#guard isStandard (parse! "C(C(C(0,W),W_3),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(C(W_3,0),0)),W_3),0)") 3 == true
#guard isStandard (parse! "C(W_3,C(C(0,C(W_3,W_3)),W_3))") == true
#guard isStandardN (parse! "C(W_3,C(C(0,C(W_3,W_3)),W_3))") 3 == true
#guard isStandard (parse! "C(C(0,C(C(W_3,W_3),0)),C(W_3,W_3))") == true
#guard isStandardN (parse! "C(C(0,C(C(W_3,W_3),0)),C(W_3,W_3))") 3 == true
#guard isStandard (parse! "C(C(W_2,W_3),0)") == true
#guard isStandardN (parse! "C(C(C(W_3,0),W_3),0)") 3 == true
#guard isStandard (parse! "C(C(C(C(W_3,C(W_3,W_3)),0),W_3),W_3)") == true
#guard isStandardN (parse! "C(C(C(C(W_3,C(W_3,W_3)),0),W_3),W_3)") 3 == true
#guard isStandard (parse! "C(C(0,C(C(0,C(0,W_3)),0)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(0,C(0,W_3)),0)),0)") 3 == true
#guard isStandard (parse! "C(C(0,W_2),C(C(0,W_3),W_3))") == true
#guard isStandardN (parse! "C(C(0,C(W_3,0)),C(C(0,W_3),W_3))") 3 == true
#guard isStandard (parse! "C(W_2,C(C(0,C(0,W_3)),0))") == true
#guard isStandardN (parse! "C(C(W_3,0),C(C(0,C(0,W_3)),0))") 3 == true
#guard isStandard (parse! "C(C(C(C(C(W_3,W_3),W_3),0),0),0)") == true
#guard isStandardN (parse! "C(C(C(C(C(W_3,W_3),W_3),0),0),0)") 3 == true
#guard isStandard (parse! "C(C(0,0),C(C(C(W_3,W_3),W_3),W_3))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(C(W_3,W_3),W_3),W_3))") 3 == true
#guard isStandard (parse! "C(W_3,C(W_3,C(C(C(0,W_3),W_3),W_3)))") == true
#guard isStandardN (parse! "C(W_3,C(W_3,C(C(C(0,W_3),W_3),W_3)))") 3 == true
#guard isStandard (parse! "C(C(W_3,C(C(C(0,0),W_3),0)),0)") == true
#guard isStandardN (parse! "C(C(W_3,C(C(C(0,0),W_3),0)),0)") 3 == true
#guard isStandard (parse! "C(C(0,0),C(C(W_3,W_3),W_3))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(W_3,W_3),W_3))") 3 == true
#guard isStandard (parse! "C(C(C(C(C(W_3,W_3),W_3),W_3),W_3),W_3)") == true
#guard isStandardN (parse! "C(C(C(C(C(W_3,W_3),W_3),W_3),W_3),W_3)") 3 == true
#guard isStandard (parse! "C(C(W_3,C(C(C(W_3,W_3),W_3),0)),0)") == true
#guard isStandardN (parse! "C(C(W_3,C(C(C(W_3,W_3),W_3),0)),0)") 3 == true
#guard isStandard (parse! "C(W_3,C(C(W_3,W_3),C(C(W_3,W_3),W_3)))") == true
#guard isStandardN (parse! "C(W_3,C(C(W_3,W_3),C(C(W_3,W_3),W_3)))") 3 == true
#guard isStandard (parse! "C(W_3,C(W_3,C(W_3,C(C(0,W_3),W_3))))") == true
#guard isStandardN (parse! "C(W_3,C(W_3,C(W_3,C(C(0,W_3),W_3))))") 3 == true
#guard isStandard (parse! "C(C(W_3,C(C(W_3,C(W_3,W_3)),0)),0)") == true
#guard isStandardN (parse! "C(C(W_3,C(C(W_3,C(W_3,W_3)),0)),0)") 3 == true
#guard isStandard (parse! "C(C(C(0,C(0,W_3)),0),W_2)") == true
#guard isStandardN (parse! "C(C(C(0,C(0,W_3)),0),C(W_3,0))") 3 == true
#guard isStandard (parse! "C(C(C(C(0,0),W_2),0),0)") == true
#guard isStandardN (parse! "C(C(C(C(0,0),C(W_3,0)),0),0)") 3 == true
#guard isStandard (parse! "C(0,C(C(0,C(C(0,0),0)),0))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(C(0,0),0)),0))") 3 == true
#guard isStandard (parse! "C(0,C(C(0,C(C(0,W_3),0)),0))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(C(0,W_3),0)),0))") 3 == true
#guard isStandard (parse! "C(C(C(C(0,C(W_3,W_3)),W_3),0),W_3)") == true
#guard isStandardN (parse! "C(C(C(C(0,C(W_3,W_3)),W_3),0),W_3)") 3 == true
#guard isStandard (parse! "C(0,C(C(C(W_3,W_2),W_3),W_3))") == true
#guard isStandardN (parse! "C(0,C(C(C(W_3,C(W_3,0)),W_3),W_3))") 3 == true
#guard isStandard (parse! "C(W_3,C(C(0,C(C(W_3,W_3),W_3)),0))") == true
#guard isStandardN (parse! "C(W_3,C(C(0,C(C(W_3,W_3),W_3)),0))") 3 == true
#guard isStandard (parse! "C(C(W,W_3),0)") == true
#guard isStandardN (parse! "C(C(C(C(W_3,0),0),W_3),0)") 3 == true
#guard isStandard (parse! "C(C(C(0,0),C(C(0,W_3),W_3)),0)") == true
#guard isStandardN (parse! "C(C(C(0,0),C(C(0,W_3),W_3)),0)") 3 == true
#guard isStandard (parse! "C(C(C(C(W_2,W_3),0),0),0)") == true
#guard isStandardN (parse! "C(C(C(C(C(W_3,0),W_3),0),0),0)") 3 == true
#guard isStandard (parse! "C(C(C(0,0),C(C(0,0),0)),W_3)") == true
#guard isStandardN (parse! "C(C(C(0,0),C(C(0,0),0)),W_3)") 3 == true
#guard isStandard (parse! "C(C(C(0,0),C(C(0,0),W_3)),W_3)") == true
#guard isStandardN (parse! "C(C(C(0,0),C(C(0,0),W_3)),W_3)") 3 == true
#guard isStandard (parse! "C(C(C(W_2,W_2),W_3),W_3)") == true
#guard isStandardN (parse! "C(C(C(C(W_3,0),C(W_3,0)),W_3),W_3)") 3 == true
#guard isStandard (parse! "C(0,C(C(C(0,W_2),0),W_3))") == true
#guard isStandardN (parse! "C(0,C(C(C(0,C(W_3,0)),0),W_3))") 3 == true
#guard isStandard (parse! "C(C(C(W_3,W_2),W_3),W_3)") == true
#guard isStandardN (parse! "C(C(C(W_3,C(W_3,0)),W_3),W_3)") 3 == true
#guard isStandard (parse! "C(C(W_3,C(C(C(0,0),W_3),W_3)),W_3)") == true
#guard isStandardN (parse! "C(C(W_3,C(C(C(0,0),W_3),W_3)),W_3)") 3 == true
#guard isStandard (parse! "C(C(W_3,C(C(C(0,0),W_3),W_3)),0)") == true
#guard isStandardN (parse! "C(C(W_3,C(C(C(0,0),W_3),W_3)),0)") 3 == true
#guard isStandard (parse! "C(0,C(C(C(C(0,W_3),W_3),0),W_3))") == true
#guard isStandardN (parse! "C(0,C(C(C(C(0,W_3),W_3),0),W_3))") 3 == true
#guard isStandard (parse! "C(C(W_3,C(C(0,C(W_3,W_3)),0)),W_3)") == true
#guard isStandardN (parse! "C(C(W_3,C(C(0,C(W_3,W_3)),0)),W_3)") 3 == true
#guard isStandard (parse! "C(C(C(C(C(0,W_3),0),0),W_3),0)") == true
#guard isStandardN (parse! "C(C(C(C(C(0,W_3),0),0),W_3),0)") 3 == true
#guard isStandard (parse! "C(C(0,C(C(0,W_3),0)),W_2)") == true
#guard isStandardN (parse! "C(C(0,C(C(0,W_3),0)),C(W_3,0))") 3 == true
#guard isStandard (parse! "C(0,C(C(W_3,C(W_3,C(W_3,W_3))),0))") == true
#guard isStandardN (parse! "C(0,C(C(W_3,C(W_3,C(W_3,W_3))),0))") 3 == true
#guard isStandard (parse! "C(C(0,C(0,C(0,C(0,W_3)))),W_3)") == true
#guard isStandardN (parse! "C(C(0,C(0,C(0,C(0,W_3)))),W_3)") 3 == true
#guard isStandard (parse! "C(C(C(0,C(W_3,W_2)),0),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(W_3,C(W_3,0))),0),0)") 3 == true
#guard isStandard (parse! "C(0,C(C(W_2,W_3),W_3))") == true
#guard isStandardN (parse! "C(0,C(C(C(W_3,0),W_3),W_3))") 3 == true
#guard isStandard (parse! "C(W_3,C(W_3,C(C(W_3,W_3),0)))") == true
#guard isStandardN (parse! "C(W_3,C(W_3,C(C(W_3,W_3),0)))") 3 == true
#guard isStandard (parse! "C(W_2,C(C(W_3,W_2),0))") == true
#guard isStandardN (parse! "C(C(W_3,0),C(C(W_3,C(W_3,0)),0))") 3 == true
#guard isStandard (parse! "C(0,C(0,C(C(0,C(0,W_3)),0)))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(0,C(0,W_3)),0)))") 3 == true
#guard isStandard (parse! "C(C(0,W_3),C(C(C(0,W_3),W_3),W_3))") == true
#guard isStandardN (parse! "C(C(0,W_3),C(C(C(0,W_3),W_3),W_3))") 3 == true
#guard isStandard (parse! "C(W_2,C(C(W_3,C(W_3,W_3)),W_3))") == true
#guard isStandardN (parse! "C(C(W_3,0),C(C(W_3,C(W_3,W_3)),W_3))") 3 == true
#guard isStandard (parse! "C(C(0,0),C(C(0,W_3),0))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(0,W_3),0))") 3 == true
#guard isStandard (parse! "C(W_3,C(C(0,W_3),C(C(W_3,W_3),0)))") == true
#guard isStandardN (parse! "C(W_3,C(C(0,W_3),C(C(W_3,W_3),0)))") 3 == true
#guard isStandard (parse! "C(C(C(C(W_3,W_2),W_3),W_3),W_3)") == true
#guard isStandardN (parse! "C(C(C(C(W_3,C(W_3,0)),W_3),W_3),W_3)") 3 == true
#guard isStandard (parse! "C(0,C(C(0,W_3),C(C(W_3,W_3),0)))") == true
#guard isStandardN (parse! "C(0,C(C(0,W_3),C(C(W_3,W_3),0)))") 3 == true
#guard isStandard (parse! "C(W_2,C(C(W_2,W_3),0))") == true
#guard isStandardN (parse! "C(C(W_3,0),C(C(C(W_3,0),W_3),0))") 3 == true
#guard isStandard (parse! "C(0,C(C(C(0,C(0,W_3)),0),W_3))") == true
#guard isStandardN (parse! "C(0,C(C(C(0,C(0,W_3)),0),W_3))") 3 == true
#guard isStandard (parse! "C(W,W_2)") == true
#guard isStandardN (parse! "C(C(C(W_3,0),0),C(W_3,0))") 3 == true
#guard isStandard (parse! "C(C(W_3,C(C(W_3,C(W_3,W_3)),0)),W_3)") == true
#guard isStandardN (parse! "C(C(W_3,C(C(W_3,C(W_3,W_3)),0)),W_3)") 3 == true
#guard isStandard (parse! "C(C(C(W_3,W_2),C(W_3,W_3)),W_3)") == true
#guard isStandardN (parse! "C(C(C(W_3,C(W_3,0)),C(W_3,W_3)),W_3)") 3 == true
#guard isStandard (parse! "C(0,C(W_3,C(C(W_3,W_3),0)))") == true
#guard isStandardN (parse! "C(0,C(W_3,C(C(W_3,W_3),0)))") 3 == true
#guard isStandard (parse! "C(C(W_3,C(W_3,W_2)),W_3)") == true
#guard isStandardN (parse! "C(C(W_3,C(W_3,C(W_3,0))),W_3)") 3 == true
#guard isStandard (parse! "C(C(C(W,W_3),0),0)") == true
#guard isStandardN (parse! "C(C(C(C(C(W_3,0),0),W_3),0),0)") 3 == true
#guard isStandard (parse! "C(0,C(C(C(0,C(W_3,W_3)),W_3),W_3))") == true
#guard isStandardN (parse! "C(0,C(C(C(0,C(W_3,W_3)),W_3),W_3))") 3 == true
#guard isStandard (parse! "C(C(C(0,C(0,W_3)),0),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(0,W_3)),0),0)") 3 == true
#guard isStandard (parse! "C(C(W_3,C(C(C(W_3,W_3),W_3),0)),W_3)") == true
#guard isStandardN (parse! "C(C(W_3,C(C(C(W_3,W_3),W_3),0)),W_3)") 3 == true
#guard isStandard (parse! "C(C(C(0,C(W_3,W_3)),W_3),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(W_3,W_3)),W_3),0)") 3 == true
#guard isStandard (parse! "C(C(C(C(0,0),C(W_3,W_3)),0),W_3)") == true
#guard isStandardN (parse! "C(C(C(C(0,0),C(W_3,W_3)),0),W_3)") 3 == true
#guard isStandard (parse! "C(0,C(0,C(W_3,W_2)))") == true
#guard isStandardN (parse! "C(0,C(0,C(W_3,C(W_3,0))))") 3 == true
#guard isStandard (parse! "C(0,C(W_3,C(C(0,W_3),0)))") == true
#guard isStandardN (parse! "C(0,C(W_3,C(C(0,W_3),0)))") 3 == true
#guard isStandard (parse! "C(C(0,C(C(C(0,0),0),W_3)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(C(0,0),0),W_3)),0)") 3 == true
#guard isStandard (parse! "C(0,C(0,C(0,C(0,W_3))))") == true
#guard isStandardN (parse! "C(0,C(0,C(0,C(0,W_3))))") 3 == true
#guard isStandard (parse! "C(C(C(W_3,C(C(W_3,W_3),0)),W_3),0)") == true
#guard isStandardN (parse! "C(C(C(W_3,C(C(W_3,W_3),0)),W_3),0)") 3 == true
#guard isStandard (parse! "C(C(0,C(W_3,C(C(0,W_3),W_3))),0)") == true
#guard isStandardN (parse! "C(C(0,C(W_3,C(C(0,W_3),W_3))),0)") 3 == true
#guard isStandard (parse! "C(0,C(0,C(0,W)))") == true
#guard isStandardN (parse! "C(0,C(0,C(0,C(C(W_3,0),0))))") 3 == true
#guard isStandard (parse! "C(0,C(W,W_2))") == true
#guard isStandardN (parse! "C(0,C(C(C(W_3,0),0),C(W_3,0)))") 3 == true
#guard isStandard (parse! "C(C(C(0,C(0,C(0,W_3))),0),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(0,C(0,W_3))),0),0)") 3 == true
#guard isStandard (parse! "C(W_2,C(W_3,C(W_3,C(W_3,W_3))))") == true
#guard isStandardN (parse! "C(C(W_3,0),C(W_3,C(W_3,C(W_3,W_3))))") 3 == true
#guard isStandard (parse! "C(0,C(0,C(0,C(0,C(0,W_3)))))") == true
#guard isStandardN (parse! "C(0,C(0,C(0,C(0,C(0,W_3)))))") 3 == true
#guard isStandard (parse! "C(C(C(W_3,C(C(0,W_3),W_3)),W_3),0)") == true
#guard isStandardN (parse! "C(C(C(W_3,C(C(0,W_3),W_3)),W_3),0)") 3 == true
#guard isStandard (parse! "C(0,C(W_3,C(W_3,C(C(0,W_3),0))))") == true
#guard isStandardN (parse! "C(0,C(W_3,C(W_3,C(C(0,W_3),0))))") 3 == true
#guard isStandard (parse! "C(C(C(C(0,W_3),0),C(W_3,W_3)),0)") == true
#guard isStandardN (parse! "C(C(C(C(0,W_3),0),C(W_3,W_3)),0)") 3 == true
#guard isStandard (parse! "C(W_2,C(W_3,W_2))") == true
#guard isStandardN (parse! "C(C(W_3,0),C(W_3,C(W_3,0)))") 3 == true
#guard isStandard (parse! "C(0,C(C(0,C(0,0)),0))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(0,0)),0))") 3 == true
#guard isStandard (parse! "C(0,C(C(0,C(0,W_3)),0))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(0,W_3)),0))") 3 == true
#guard isStandard (parse! "C(C(C(W_3,C(W_3,C(W_3,W_3))),W_3),0)") == true
#guard isStandardN (parse! "C(C(C(W_3,C(W_3,C(W_3,W_3))),W_3),0)") 3 == true
#guard isStandard (parse! "C(C(C(W_3,C(C(W_3,W_3),W_3)),0),0)") == true
#guard isStandardN (parse! "C(C(C(W_3,C(C(W_3,W_3),W_3)),0),0)") 3 == true
#guard isStandard (parse! "C(0,C(C(C(C(0,W_3),0),W_3),W_3))") == true
#guard isStandardN (parse! "C(0,C(C(C(C(0,W_3),0),W_3),W_3))") 3 == true
#guard isStandard (parse! "C(0,C(0,C(C(C(W_3,W_3),W_3),0)))") == true
#guard isStandardN (parse! "C(0,C(0,C(C(C(W_3,W_3),W_3),0)))") 3 == true
#guard isStandard (parse! "C(C(0,C(W,W_3)),0)") == true
#guard isStandardN (parse! "C(C(0,C(C(C(W_3,0),0),W_3)),0)") 3 == true
#guard isStandard (parse! "C(C(0,0),C(C(C(W_3,W_3),0),W_3))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(C(W_3,W_3),0),W_3))") 3 == true
#guard isStandard (parse! "C(0,C(C(C(0,0),0),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(0,0),0),0))") 3 == true
#guard isStandard (parse! "C(C(C(C(0,0),0),0),W_2)") == true
#guard isStandardN (parse! "C(C(C(C(0,0),0),0),C(W_3,0))") 3 == true
#guard isStandard (parse! "C(C(C(C(0,C(0,W_3)),0),W_3),W_3)") == true
#guard isStandardN (parse! "C(C(C(C(0,C(0,W_3)),0),W_3),W_3)") 3 == true
#guard isStandard (parse! "C(0,C(C(C(C(0,0),0),W_3),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(C(0,0),0),W_3),0))") 3 == true
#guard isStandard (parse! "C(W,W)") == true
#guard isStandardN (parse! "C(C(C(W_3,0),0),C(C(W_3,0),0))") 3 == true
#guard isStandard (parse! "C(W,C(C(W_3,W_3),0))") == true
#guard isStandardN (parse! "C(C(C(W_3,0),0),C(C(W_3,W_3),0))") 3 == true
#guard isStandard (parse! "C(C(C(0,C(W_3,W_3)),0),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(W_3,W_3)),0),0)") 3 == true
#guard isStandard (parse! "C(W_3,C(C(0,W_3),C(C(0,W_3),W_3)))") == true
#guard isStandardN (parse! "C(W_3,C(C(0,W_3),C(C(0,W_3),W_3)))") 3 == true
#guard isStandard (parse! "C(0,C(C(0,C(W_3,C(W_3,W_3))),0))") == true
#guard isStandardN (parse! "C(0,C(C(0,C(W_3,C(W_3,W_3))),0))") 3 == true
#guard isStandard (parse! "C(C(0,0),C(C(W_3,W_2),0))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(W_3,C(W_3,0)),0))") 3 == true
#guard isStandard (parse! "C(C(C(0,C(0,0)),W_3),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(0,0)),W_3),0)") 3 == true
#guard isStandard (parse! "C(0,C(C(C(C(W_3,W_3),W_3),0),0))") == true
#guard isStandardN (parse! "C(0,C(C(C(C(W_3,W_3),W_3),0),0))") 3 == true
#guard isStandard (parse! "C(C(0,W),W_2)") == true
#guard isStandardN (parse! "C(C(0,C(C(W_3,0),0)),C(W_3,0))") 3 == true
#guard isStandard (parse! "C(C(0,0),C(C(0,C(W_3,W_3)),W_3))") == true
#guard isStandardN (parse! "C(C(0,0),C(C(0,C(W_3,W_3)),W_3))") 3 == true
#guard isStandard (parse! "C(C(0,C(C(0,C(W_3,W_3)),0)),W_3)") == true
#guard isStandardN (parse! "C(C(0,C(C(0,C(W_3,W_3)),0)),W_3)") 3 == true
#guard isStandard (parse! "C(0,C(0,W_3))") == true
#guard isStandardN (parse! "C(0,C(0,W_3))") 3 == true
#guard isStandard (parse! "C(C(C(C(0,C(0,0)),W_3),0),W_3)") == true
#guard isStandardN (parse! "C(C(C(C(0,C(0,0)),W_3),0),W_3)") 3 == true
#guard isStandard (parse! "C(C(0,C(0,C(W_3,W_2))),W_3)") == true
#guard isStandardN (parse! "C(C(0,C(0,C(W_3,C(W_3,0)))),W_3)") 3 == true
#guard isStandard (parse! "C(W_3,C(C(0,C(W_3,C(W_3,W_3))),0))") == true
#guard isStandardN (parse! "C(W_3,C(C(0,C(W_3,C(W_3,W_3))),0))") 3 == true
#guard isStandard (parse! "C(C(W_3,C(W_3,C(C(0,W_3),W_3))),W_3)") == true
#guard isStandardN (parse! "C(C(W_3,C(W_3,C(C(0,W_3),W_3))),W_3)") 3 == true
#guard isStandard (parse! "C(C(0,C(0,C(0,0))),W_2)") == true
#guard isStandardN (parse! "C(C(0,C(0,C(0,0))),C(W_3,0))") 3 == true
#guard isStandard (parse! "C(0,C(W_2,W_3))") == true
#guard isStandardN (parse! "C(0,C(C(W_3,0),W_3))") 3 == true
#guard isStandard (parse! "C(0,C(C(C(C(W_3,W_3),0),0),W_3))") == true
#guard isStandardN (parse! "C(0,C(C(C(C(W_3,W_3),0),0),W_3))") 3 == true
#guard isStandard (parse! "C(C(0,W_2),C(C(W_3,W_3),0))") == true
#guard isStandardN (parse! "C(C(0,C(W_3,0)),C(C(W_3,W_3),0))") 3 == true
#guard isStandard (parse! "C(C(W_3,C(W_3,C(W_3,W_2))),W_3)") == true
#guard isStandardN (parse! "C(C(W_3,C(W_3,C(W_3,C(W_3,0)))),W_3)") 3 == true
#guard isStandard (parse! "C(C(C(0,W_3),0),C(C(0,W_3),W_3))") == true
#guard isStandardN (parse! "C(C(C(0,W_3),0),C(C(0,W_3),W_3))") 3 == true
#guard isStandard (parse! "C(W_3,C(C(C(0,W_3),W_3),0))") == true
#guard isStandardN (parse! "C(W_3,C(C(C(0,W_3),W_3),0))") 3 == true
#guard isStandard (parse! "C(0,C(0,W_2))") == true
#guard isStandardN (parse! "C(0,C(0,C(W_3,0)))") 3 == true
#guard isStandard (parse! "C(0,C(W_2,C(W_2,W_3)))") == true
#guard isStandardN (parse! "C(0,C(C(W_3,0),C(C(W_3,0),W_3)))") 3 == true
#guard isStandard (parse! "C(C(0,C(W_3,W_2)),W_3)") == true
#guard isStandardN (parse! "C(C(0,C(W_3,C(W_3,0))),W_3)") 3 == true
#guard isStandard (parse! "C(0,C(W_3,C(W_3,W_3)))") == true
#guard isStandardN (parse! "C(0,C(W_3,C(W_3,W_3)))") 3 == true
#guard isStandard (parse! "C(C(0,C(0,W_3)),0)") == true
#guard isStandardN (parse! "C(C(0,C(0,W_3)),0)") 3 == true
#guard isStandard (parse! "C(C(C(0,C(C(W_3,W_3),W_3)),0),0)") == true
#guard isStandardN (parse! "C(C(C(0,C(C(W_3,W_3),W_3)),0),0)") 3 == true
#guard isStandard (parse! "C(C(C(0,0),W_2),W_2)") == true
#guard isStandardN (parse! "C(C(C(0,0),C(W_3,0)),C(W_3,0))") 3 == true
#guard cmp (parse! "C(C(0,0),C(C(C(W,W),0),W))") (parse! "C(C(C(0,0),C(C(0,W),W)),0)") == .gt
#guard cmp (parse! "C(C(0,C(0,C(C(0,W),0))),W)") (parse! "C(C(C(C(C(0,W),W),W),0),W)") == .lt
#guard cmp (parse! "C(C(C(C(0,C(W,W)),W),W),0)") (parse! "C(C(0,C(0,C(0,C(0,W)))),W)") == .lt
#guard cmp (parse! "C(C(0,W),C(C(C(0,0),W),W))") (parse! "C(C(C(0,C(0,0)),C(W,W)),0)") == .gt
#guard cmp (parse! "C(C(0,C(C(C(W,0),W),0)),W)") (parse! "C(C(0,0),C(C(C(W,W),W),0))") == .gt
#guard cmp (parse! "C(0,C(0,C(C(W,0),W)))") (parse! "C(C(C(C(C(W,0),W),W),0),W)") == .lt
#guard cmp (parse! "C(C(C(W,0),C(W,C(W,W))),0)") (parse! "C(W,C(C(0,C(C(0,W),W)),W))") == .lt
#guard cmp (parse! "C(C(0,0),C(C(W,C(W,W)),W))") (parse! "C(C(C(0,C(C(0,0),0)),W),W)") == .gt
#guard cmp (parse! "C(C(C(C(0,W),0),W),0)") (parse! "C(C(0,0),C(C(C(0,W),W),0))") == .lt
#guard cmp (parse! "C(0,C(0,C(C(0,C(W,0)),W)))") (parse! "C(C(W,0),C(W,W))") == .lt
#guard cmp (parse! "C(C(C(C(W,C(W,0)),W),0),W)") (parse! "C(0,C(W,C(C(0,C(W,W)),0)))") == .gt
#guard cmp (parse! "C(C(C(0,0),C(C(W,W),W)),W)") (parse! "C(C(C(0,C(0,0)),0),C(W,0))") == .gt
#guard cmp (parse! "C(0,C(0,C(0,C(0,C(0,0)))))") (parse! "C(C(C(0,C(C(0,0),W)),W),0)") == .lt
#guard cmp (parse! "C(C(0,C(0,C(W,W))),0)") (parse! "C(0,C(C(W,W),0))") == .gt
#guard cmp (parse! "C(C(C(0,C(0,0)),0),C(W,W))") (parse! "C(C(0,C(0,C(C(W,W),0))),W)") == .gt
#guard cmp (parse! "C(C(0,W),C(C(0,C(0,W)),W))") (parse! "C(C(C(C(0,0),W),0),C(W,W))") == .gt
#guard cmp (parse! "C(C(W,0),C(C(W,W),W))") (parse! "C(0,C(W,W))") == .gt
#guard cmp (parse! "C(C(C(W,W),C(C(W,W),W)),0)") (parse! "C(0,C(C(C(W,0),C(W,W)),0))") == .gt
#guard cmp (parse! "C(C(W,C(W,0)),C(W,C(W,W)))") (parse! "C(C(W,C(C(C(0,W),W),0)),W)") == .gt
#guard cmp (parse! "C(C(C(0,0),C(W,0)),W)") (parse! "C(W,C(C(C(C(0,W),W),W),0))") == .gt
#guard cmp (parse! "C(C(C(0,0),C(C(0,0),0)),W)") (parse! "C(0,C(C(C(W,0),C(W,0)),W))") == .lt
#guard cmp (parse! "C(C(C(0,0),0),C(C(0,W),0))") (parse! "C(C(W,C(C(0,W),0)),W)") == .lt
#guard cmp (parse! "C(C(C(C(0,0),0),W),W)") (parse! "C(0,C(0,C(0,W)))") == .gt
#guard cmp (parse! "C(0,C(C(W,C(W,0)),C(W,W)))") (parse! "C(C(C(0,C(0,C(0,W))),W),W)") == .lt
#guard cmp (parse! "C(W,C(C(0,C(0,C(W,W))),0))") (parse! "C(0,C(C(W,C(W,0)),W))") == .lt
#guard cmp (parse! "C(C(W,C(C(W,W),0)),W)") (parse! "C(0,C(C(0,W),C(C(W,W),0)))") == .gt
#guard cmp (parse! "C(C(0,C(0,C(C(W,0),W))),W)") (parse! "C(W,C(C(0,C(C(W,0),W)),0))") == .gt
#guard cmp (parse! "C(W,C(W,C(C(C(W,0),W),W)))") (parse! "C(C(0,C(C(0,C(0,W)),0)),W)") == .gt
#guard cmp (parse! "C(C(W,C(C(0,C(0,W)),W)),0)") (parse! "C(C(W,W),C(C(W,C(W,W)),W))") == .lt
#guard cmp (parse! "C(C(W,C(W,0)),C(W,C(W,W)))") (parse! "C(C(C(0,0),C(C(W,0),W)),0)") == .gt
#guard cmp (parse! "C(C(C(W,0),C(W,W)),W)") (parse! "C(0,C(0,C(C(W,0),C(W,W))))") == .gt
#guard cmp (parse! "C(C(0,C(W,C(C(W,W),W))),0)") (parse! "C(0,C(C(C(C(0,0),W),0),W))") == .lt
#guard cmp (parse! "C(C(C(C(C(W,W),W),W),W),W)") (parse! "C(C(0,0),C(W,C(W,0)))") == .gt
#guard cmp (parse! "C(0,C(W,C(C(0,C(0,W)),W)))") (parse! "C(C(C(W,0),C(W,C(W,0))),W)") == .gt
#guard cmp (parse! "C(C(W,C(C(0,W),0)),W)") (parse! "C(C(W,0),C(W,C(C(W,W),0)))") == .gt
#guard cmp (parse! "C(C(C(0,0),C(C(W,0),W)),0)") (parse! "C(C(W,C(C(W,C(W,W)),W)),W)") == .lt
#guard cmp (parse! "C(C(C(C(0,C(0,0)),0),W),0)") (parse! "C(C(0,C(0,C(W,0))),C(W,0))") == .gt
#guard cmp (parse! "C(C(W,C(W,C(W,W))),W)") (parse! "C(W,C(C(0,W),C(C(W,W),0)))") == .gt
#guard cmp (parse! "0") (parse! "C(C(0,C(C(C(W,0),W),0)),W)") == .lt
#guard cmp (parse! "C(0,C(C(W,0),C(C(W,0),W)))") (parse! "C(W,C(C(W,C(W,W)),0))") == .gt
#guard cmp (parse! "C(C(0,0),C(C(C(W,0),W),0))") (parse! "C(0,C(C(0,W),W))") == .lt
#guard cmp (parse! "C(C(0,0),C(C(C(0,W),W),0))") (parse! "C(C(W,W),C(C(W,W),0))") == .gt
#guard cmp (parse! "C(C(C(C(C(0,W),W),W),W),W)") (parse! "C(0,C(C(W,C(C(0,W),0)),W))") == .gt
#guard cmp (parse! "C(C(C(0,0),W),0)") (parse! "C(W,C(C(W,W),C(C(W,W),0)))") == .lt
#guard cmp (parse! "C(C(C(C(0,C(W,W)),W),0),W)") (parse! "C(0,C(C(C(W,C(W,W)),W),W))") == .lt
#guard cmp (parse! "C(C(C(0,0),0),C(C(W,W),W))") (parse! "C(C(C(C(W,C(W,W)),0),W),W)") == .gt
#guard cmp (parse! "C(C(W,C(W,C(W,C(W,0)))),W)") (parse! "C(C(C(W,C(W,0)),W),W)") == .lt
#guard cmp (parse! "C(C(C(W,W),0),W)") (parse! "C(0,C(0,C(C(0,0),C(W,W))))") == .lt
#guard cmp (parse! "C(0,C(0,C(0,C(C(0,0),W))))") (parse! "C(C(0,0),C(C(W,0),C(W,0)))") == .gt
#guard cmp (parse! "C(W,C(C(W,C(C(W,W),W)),0))") (parse! "C(C(C(W,0),C(C(W,0),W)),W)") == .lt
#guard cmp (parse! "C(C(C(W,0),C(W,C(W,W))),W)") (parse! "C(C(W,C(W,0)),C(W,C(W,W)))") == .gt
#guard cmp (parse! "C(W,C(C(C(C(0,W),W),W),W))") (parse! "C(C(0,C(0,0)),C(W,C(W,W)))") == .gt
#guard cmp (parse! "C(C(C(W,W),W),0)") (parse! "C(C(C(C(C(0,W),0),W),0),W)") == .lt
#guard cmp (parse! "C(C(0,C(0,C(C(W,W),0))),W)") (parse! "C(C(0,C(0,0)),C(C(W,W),0))") == .gt
#guard cmp (parse! "C(0,W)") (parse! "C(C(C(0,C(W,C(W,W))),W),0)") == .gt
#guard cmp (parse! "C(0,C(C(W,0),C(W,C(W,0))))") (parse! "C(C(C(C(0,0),W),0),C(W,W))") == .lt
#guard cmp (parse! "C(C(0,C(0,C(W,0))),C(W,W))") (parse! "C(W,C(W,C(C(0,C(W,W)),0)))") == .gt
#guard cmp (parse! "C(C(0,C(0,C(0,0))),C(W,0))") (parse! "C(C(W,C(C(0,W),W)),W)") == .lt
#guard cmp (parse! "C(C(C(C(0,C(0,W)),W),0),W)") (parse! "C(C(C(0,C(0,0)),C(W,0)),W)") == .gt
#guard cmp (parse! "C(C(0,C(C(0,0),0)),C(W,0))") (parse! "C(C(C(C(C(W,0),W),0),W),0)") == .lt
#guard cmp (parse! "C(C(C(W,0),C(W,C(W,0))),W)") (parse! "C(0,C(W,C(W,C(C(0,W),0))))") == .gt
#guard cmp (parse! "C(C(W,C(C(C(0,0),W),W)),W)") (parse! "C(W,C(W,C(C(0,C(0,W)),0)))") == .gt
#guard cmp (parse! "C(0,C(C(C(0,0),C(W,W)),W))") (parse! "C(W,C(C(C(W,0),W),W))") == .gt
#guard cmp (parse! "C(W,C(C(C(W,W),W),W))") (parse! "C(C(0,C(C(C(0,W),0),W)),0)") == .gt
#guard cmp (parse! "C(C(W,C(C(C(0,W),W),W)),0)") (parse! "C(C(0,C(0,0)),C(C(0,W),W))") == .lt
#guard cmp (parse! "C(C(0,C(C(0,0),0)),C(W,0))") (parse! "C(C(W,0),C(W,C(C(W,W),W)))") == .lt
#guard cmp (parse! "C(C(0,C(0,C(C(W,0),W))),W)") (parse! "C(C(0,C(W,C(C(0,W),0))),W)") == .gt
#guard cmp (parse! "C(C(W,C(C(W,C(W,W)),W)),W)") (parse! "C(C(0,0),C(C(0,0),C(W,W)))") == .gt
#guard cmp (parse! "C(0,C(0,C(C(0,C(0,W)),W)))") (parse! "C(C(C(C(0,W),0),C(W,W)),0)") == .gt
#guard cmp (parse! "C(C(C(0,W),0),C(C(W,W),0))") (parse! "C(C(W,W),C(C(W,W),0))") == .lt
#guard cmp (parse! "C(0,C(C(C(0,W),W),W))") (parse! "C(C(0,C(C(C(W,W),W),W)),W)") == .lt
#guard cmp (parse! "C(C(C(C(W,C(W,W)),W),W),0)") (parse! "C(C(C(C(0,C(0,W)),0),W),0)") == .gt
#guard cmp (parse! "C(C(C(C(W,C(W,W)),W),0),W)") (parse! "C(C(C(W,0),C(C(0,W),W)),W)") == .lt
#guard cmp (parse! "C(C(C(0,C(C(W,0),W)),W),0)") (parse! "C(C(0,W),C(C(W,W),W))") == .lt
#guard cmp (parse! "C(C(W,C(C(W,W),0)),W)") (parse! "C(C(0,C(0,W)),W)") == .lt
#guard cmp (parse! "C(C(C(0,C(C(0,0),W)),0),W)") (parse! "C(W,C(C(C(W,0),C(W,W)),W))") == .lt
#guard cmp (parse! "C(C(C(W,W),0),C(C(W,W),W))") (parse! "C(0,C(C(C(0,W),0),W))") == .gt
#guard cmp (parse! "C(C(W,0),C(W,C(W,C(W,0))))") (parse! "C(C(C(C(0,W),W),W),W)") == .lt
#guard cmp (parse! "C(W,C(C(0,C(W,W)),0))") (parse! "C(C(C(W,0),C(C(W,W),W)),0)") == .lt
#guard cmp (parse! "C(C(W,C(C(0,W),W)),W)") (parse! "C(0,C(W,C(C(C(W,W),W),0)))") == .gt
#guard cmp (parse! "C(C(C(C(C(0,W),W),W),W),0)") (parse! "C(C(W,C(C(0,W),0)),C(W,W))") == .lt
#guard cmp (parse! "C(W,C(C(W,C(W,W)),W))") (parse! "C(C(0,C(0,C(0,C(W,W)))),W)") == .gt
#guard cmp (parse! "C(C(C(C(0,0),C(W,0)),W),0)") (parse! "C(0,C(C(0,C(C(W,W),W)),W))") == .lt
#guard cmp (parse! "C(C(0,C(W,0)),C(C(0,W),W))") (parse! "C(C(0,W),C(C(0,W),0))") == .gt
#guard cmp (parse! "C(0,C(C(C(C(0,W),0),W),W))") (parse! "C(C(W,C(W,C(W,C(W,W)))),W)") == .lt
#guard cmp (parse! "C(C(C(0,C(0,0)),0),C(W,0))") (parse! "C(C(C(0,0),C(W,0)),C(W,W))") == .lt
#guard cmp (parse! "C(C(0,0),C(C(0,0),C(W,W)))") (parse! "C(0,C(W,C(W,C(C(W,W),0))))") == .gt
#guard cmp (parse! "C(C(0,W),C(C(0,C(0,W)),0))") (parse! "C(C(W,C(C(0,W),0)),C(W,W))") == .lt
#guard cmp (parse! "C(0,C(0,C(0,C(W,C(W,W)))))") (parse! "C(0,C(C(W,C(W,0)),W))") == .gt
#guard cmp (parse! "C(0,C(C(C(0,C(0,0)),W),0))") (parse! "C(C(W,C(W,0)),C(W,C(W,0)))") == .gt
#guard cmp (parse! "C(0,C(0,C(C(C(W,0),W),W)))") (parse! "C(0,C(C(0,C(0,C(W,0))),W))") == .gt
#guard cmp (parse! "C(C(C(0,C(C(0,0),W)),W),W)") (parse! "C(0,C(0,C(C(C(W,0),W),0)))") == .gt
#guard cmp (parse! "C(0,C(C(W,C(W,C(W,0))),W))") (parse! "C(C(0,C(C(C(W,W),0),W)),W)") == .lt
#guard cmp (parse! "C(0,C(C(C(0,0),0),C(W,0)))") (parse! "C(W,C(W,C(W,C(C(0,W),W))))") == .lt
#guard cmp (parse! "C(0,C(C(C(W,C(W,W)),0),W))") (parse! "C(W,C(C(C(C(0,0),W),W),0))") == .gt
#guard cmp (parse! "C(C(0,0),C(W,C(W,C(W,0))))") (parse! "C(0,C(C(C(0,0),C(W,0)),W))") == .lt
#guard cmp (parse! "C(C(C(W,0),C(C(0,W),W)),0)") (parse! "C(0,C(C(0,0),C(W,0)))") == .gt
#guard cmp (parse! "C(C(C(C(0,0),C(W,W)),0),W)") (parse! "C(C(W,C(W,C(C(W,W),W))),0)") == .gt
#guard cmp (parse! "C(C(C(0,C(C(0,0),0)),0),W)") (parse! "C(C(C(0,C(0,W)),W),W)") == .lt
#guard cmp (parse! "C(C(C(C(0,C(W,W)),W),W),W)") (parse! "C(C(0,C(C(C(W,W),W),W)),W)") == .gt
#guard cmp (parse! "C(C(0,C(0,C(W,C(W,0)))),W)") (parse! "C(0,C(C(W,0),W))") == .gt
#guard cmp (parse! "C(C(C(0,C(0,C(W,W))),0),W)") (parse! "C(C(W,C(C(C(W,W),W),W)),0)") == .gt
#guard cmp (parse! "C(0,C(C(0,C(0,C(0,0))),0))") (parse! "C(W,C(C(W,C(W,W)),0))") == .lt
#guard cmp (parse! "C(0,C(C(C(C(W,0),W),W),W))") (parse! "C(0,C(C(C(W,0),C(W,W)),W))") == .gt
#guard cmp (parse! "C(W,C(W,C(C(C(W,W),W),0)))") (parse! "C(W,C(C(C(C(0,W),W),W),W))") == .lt
#guard cmp (parse! "C(0,C(C(C(W,0),C(W,0)),W))") (parse! "C(0,C(W,C(C(C(0,W),W),0)))") == .gt
#guard cmp (parse! "C(C(0,C(0,C(0,0))),C(W,W))") (parse! "C(0,C(C(C(0,C(0,W)),0),W))") == .gt
#guard cmp (parse! "C(W,C(W,C(C(W,W),0)))") (parse! "C(C(W,W),C(C(C(0,W),W),0))") == .lt
#guard cmp (parse! "C(C(0,C(C(C(W,W),W),0)),W)") (parse! "C(C(W,C(C(C(0,0),W),W)),W)") == .lt
#guard cmp (parse! "C(C(C(0,C(0,C(W,W))),0),W)") (parse! "C(0,C(C(C(0,W),0),C(W,W)))") == .lt
#guard cmp (parse! "C(C(C(0,W),0),C(W,C(W,W)))") (parse! "C(C(0,C(0,C(C(W,W),W))),0)") == .gt
#guard cmp (parse! "C(C(C(W,W),0),W)") (parse! "C(C(C(0,0),W),0)") == .gt
#guard cmp (parse! "C(C(0,C(C(C(0,W),W),0)),W)") (parse! "C(C(C(0,C(0,C(0,0))),0),0)") == .gt
#guard cmp (parse! "C(C(W,0),C(W,0))") (parse! "C(C(W,C(C(0,W),W)),W)") == .lt
#guard cmp (parse! "C(C(C(C(W,0),C(W,0)),W),0)") (parse! "C(C(C(C(0,0),0),C(W,0)),W)") == .lt
#guard cmp (parse! "C(C(C(C(W,C(W,0)),W),W),0)") (parse! "C(C(0,C(W,C(W,C(W,W)))),W)") == .lt
#guard cmp (parse! "C(W,C(C(0,W),C(C(W,W),W)))") (parse! "C(C(0,C(0,0)),C(W,W))") == .gt
#guard cmp (parse! "C(W,C(C(0,C(0,C(0,W))),0))") (parse! "C(C(0,C(W,C(C(W,W),W))),0)") == .lt
#guard cmp (parse! "C(C(C(C(0,W),0),W),W)") (parse! "C(C(0,C(C(C(W,W),W),W)),0)") == .gt
#guard cmp (parse! "C(C(C(W,0),C(W,0)),W)") (parse! "C(0,C(C(0,C(C(0,0),W)),W))") == .lt
#guard cmp (parse! "C(C(0,C(0,C(C(0,0),W))),W)") (parse! "C(0,C(C(W,0),W))") == .gt
#guard cmp (parse! "C(C(C(0,C(C(0,0),W)),W),W)") (parse! "C(C(0,C(C(C(W,W),W),0)),W)") == .gt
#guard cmp (parse! "C(0,C(0,C(C(C(W,0),W),0)))") (parse! "C(C(C(W,C(W,C(W,0))),W),W)") == .lt
#guard cmp (parse! "C(C(C(C(0,C(0,0)),0),W),0)") (parse! "C(W,C(W,C(C(C(W,W),W),W)))") == .lt
#guard cmp (parse! "C(C(W,C(C(W,W),0)),W)") (parse! "C(C(C(0,0),C(C(0,W),W)),W)") == .lt
#guard cmp (parse! "C(C(W,0),C(W,C(C(W,W),W)))") (parse! "C(C(C(0,0),C(C(0,W),W)),0)") == .gt
#guard cmp (parse! "C(W,C(W,C(C(0,W),0)))") (parse! "C(W,C(C(C(0,0),C(W,W)),W))") == .lt
#guard cmp (parse! "C(C(0,C(0,C(C(0,W),0))),W)") (parse! "C(0,C(C(0,C(W,C(W,0))),W))") == .gt
#guard cmp (parse! "C(C(C(C(0,W),W),W),0)") (parse! "C(C(C(0,0),C(W,C(W,W))),W)") == .lt
#guard cmp (parse! "C(C(W,0),C(C(C(W,0),W),0))") (parse! "C(0,C(C(C(W,C(W,W)),W),W))") == .lt
#guard cmp (parse! "C(C(W,C(W,0)),C(W,C(W,0)))") (parse! "C(C(0,0),C(C(W,W),W))") == .lt
#guard cmp (parse! "C(C(0,C(0,0)),C(C(W,0),W))") (parse! "C(C(0,C(0,0)),W)") == .gt
#guard cmp (parse! "C(C(C(W,C(C(W,W),W)),0),W)") (parse! "C(C(C(0,C(W,W)),0),C(W,W))") == .lt
#guard cmp (parse! "C(C(C(W,0),C(W,0)),C(W,W))") (parse! "C(W,C(W,C(W,C(C(0,W),W))))") == .lt
#guard cmp (parse! "C(C(0,W),C(C(C(W,0),W),0))") (parse! "C(C(C(C(C(0,0),0),0),0),W)") == .lt
#guard cmp (parse! "C(C(W,0),C(C(C(W,W),0),W))") (parse! "C(0,C(C(0,C(C(0,W),W)),W))") == .lt
#guard cmp (parse! "C(C(C(C(C(0,W),0),W),0),W)") (parse! "C(C(C(0,W),W),W)") == .lt
#guard cmp (parse! "C(C(0,C(0,C(C(0,W),W))),0)") (parse! "C(0,C(C(W,W),0))") == .gt
#guard cmp (parse! "C(C(0,0),C(W,C(W,0)))") (parse! "C(C(0,C(0,C(C(W,W),W))),W)") == .lt
#guard cmp (parse! "C(0,C(W,C(C(0,C(W,W)),W)))") (parse! "C(C(C(C(0,0),W),0),C(W,W))") == .gt
#guard cmp (parse! "C(0,C(C(0,C(0,C(0,0))),0))") (parse! "C(C(C(0,C(0,C(W,0))),W),0)") == .lt
#guard cmp (parse! "C(C(0,C(0,W)),C(C(W,W),W))") (parse! "C(W,C(W,C(W,C(W,C(W,W)))))") == .gt
#guard cmp (parse! "C(C(C(C(C(W,0),W),0),W),W)") (parse! "C(C(0,C(0,C(0,C(0,W)))),0)") == .gt
#guard cmp (parse! "C(C(0,C(C(C(W,0),W),0)),W)") (parse! "C(W,C(C(C(C(0,W),0),W),W))") == .lt
#guard cmp (parse! "C(C(0,C(C(C(W,0),W),W)),0)") (parse! "C(0,C(C(0,C(0,C(0,W))),0))") == .gt
#guard cmp (parse! "C(W,C(C(0,C(C(0,0),W)),0))") (parse! "C(0,C(C(0,C(C(0,W),W)),W))") == .lt
#guard cmp (parse! "C(0,C(C(C(0,C(0,0)),0),W))") (parse! "C(W,C(C(0,C(C(W,W),W)),W))") == .lt
#guard cmp (parse! "C(0,C(C(C(0,C(0,0)),W),W))") (parse! "C(C(0,C(C(C(0,0),0),0)),0)") == .gt
#guard cmp (parse! "C(C(0,C(0,C(C(0,0),W))),0)") (parse! "C(C(W,0),C(W,C(C(0,W),W)))") == .lt
#guard cmp (parse! "C(C(W,W),C(C(W,W),W))") (parse! "C(0,C(W,C(C(C(0,W),W),W)))") == .lt
#guard cmp (parse! "C(C(W,C(C(W,W),W)),W)") (parse! "C(C(0,C(W,C(W,0))),W)") == .gt
#guard cmp (parse! "C(C(C(0,0),0),C(C(W,0),W))") (parse! "C(C(C(W,0),C(C(W,W),W)),0)") == .gt
#guard cmp (parse! "C(C(C(0,C(0,C(W,W))),W),W)") (parse! "C(C(W,C(W,0)),C(W,C(W,0)))") == .gt
#guard cmp (parse! "C(C(W,0),C(C(C(W,W),W),0))") (parse! "C(C(0,C(C(W,C(W,W)),W)),W)") == .lt
#guard cmp (parse! "C(C(W,0),C(C(C(W,0),W),0))") (parse! "C(0,C(C(0,0),C(C(W,W),0)))") == .lt
#guard cmp (parse! "C(C(C(0,0),C(C(0,0),W)),W)") (parse! "C(C(C(C(W,W),0),C(W,W)),W)") == .lt
#guard cmp (parse! "C(0,C(W,C(C(C(W,0),W),0)))") (parse! "C(0,C(W,C(C(0,C(W,W)),W)))") == .lt
#guard cmp (parse! "C(0,C(C(C(0,W),0),W))") (parse! "C(W,C(W,C(C(0,C(0,W)),0)))") == .gt
#guard cmp (parse! "C(C(0,0),C(C(0,C(0,0)),W))") (parse! "C(C(C(C(W,C(W,W)),W),W),0)") == .gt
#guard cmp (parse! "C(C(W,0),C(C(C(0,0),W),W))") (parse! "C(C(0,C(C(0,0),0)),W)") == .gt
#guard cmp (parse! "C(C(W,C(C(C(W,W),W),W)),0)") (parse! "C(0,C(W,C(C(C(W,0),W),W)))") == .lt
#guard cmp (parse! "C(C(W,W),C(C(0,C(W,W)),0))") (parse! "C(C(C(C(W,0),C(W,W)),W),W)") == .lt
#guard cmp (parse! "C(C(C(0,C(C(0,W),W)),0),W)") (parse! "C(0,C(0,C(C(C(0,W),W),0)))") == .gt
#guard cmp (parse! "C(0,C(0,C(W,C(W,C(W,0)))))") (parse! "C(C(W,W),W)") == .lt
#guard cmp (parse! "C(0,C(C(W,C(W,0)),W))") (parse! "C(C(0,C(W,C(W,C(W,W)))),W)") == .lt
#guard cmp (parse! "C(C(C(0,0),C(W,0)),C(W,0))") (parse! "C(C(C(0,C(0,0)),C(W,W)),W)") == .lt
#guard cmp (parse! "C(0,C(C(C(W,W),W),0))") (parse! "C(W,C(C(C(0,C(W,W)),W),0))") == .lt
#guard cmp (parse! "C(C(W,C(W,C(W,C(W,W)))),W)") (parse! "C(C(W,C(W,0)),C(C(0,W),W))") == .gt
#guard cmp (parse! "C(C(0,0),0)") (parse! "C(W,C(C(0,C(W,W)),0))") == .lt
#guard cmp (parse! "C(C(0,W),C(C(W,C(W,W)),W))") (parse! "C(C(C(C(0,0),W),W),0)") == .gt
#guard cmp (parse! "C(0,C(C(W,0),C(C(W,W),0)))") (parse! "C(C(W,C(C(0,W),0)),C(W,W))") == .lt
#guard cmp (parse! "C(C(C(0,C(W,C(W,W))),W),0)") (parse! "C(C(C(W,C(C(W,W),0)),W),W)") == .lt
#guard cmp (parse! "C(C(C(0,0),C(C(W,0),W)),0)") (parse! "C(C(W,C(C(C(0,W),W),W)),0)") == .lt
#guard cmp (parse! "C(C(W,C(W,0)),W)") (parse! "C(C(C(0,0),C(W,0)),C(W,W))") == .lt
#guard cmp (parse! "C(C(W,C(C(C(0,W),W),W)),W)") (parse! "C(0,C(C(C(0,C(0,0)),W),W))") == .gt
#guard cmp (parse! "C(0,C(W,C(W,C(W,W))))") (parse! "C(C(W,C(W,0)),C(C(0,W),W))") == .lt
#guard cmp (parse! "C(C(C(C(W,W),0),C(W,W)),0)") (parse! "C(C(C(C(C(0,W),0),W),W),W)") == .lt
#guard cmp (parse! "C(C(0,C(0,C(W,C(W,0)))),W)") (parse! "C(C(C(C(0,0),0),C(W,0)),W)") == .gt
#guard cmp (parse! "C(C(W,W),W)") (parse! "C(0,C(C(0,C(C(0,W),W)),0))") == .gt
#guard cmp (parse! "C(0,C(C(0,0),C(W,0)))") (parse! "C(C(0,C(0,C(0,C(W,W)))),0)") == .lt
#guard cmp (parse! "C(0,C(C(W,C(C(W,W),W)),W))") (parse! "C(C(C(C(0,C(0,0)),0),W),0)") == .gt
#guard cmp (parse! "C(0,C(C(C(0,0),0),C(W,0)))") (parse! "C(C(0,C(W,0)),C(C(0,W),W))") == .lt
#guard cmp (parse! "C(C(0,0),C(C(W,0),C(W,W)))") (parse! "C(C(C(0,C(0,C(W,0))),W),0)") == .gt
#guard cmp (parse! "C(0,C(C(0,C(0,C(0,W))),W))") (parse! "C(C(W,C(W,0)),C(C(0,W),W))") == .gt
#guard cmp (parse! "C(C(C(C(C(0,W),0),W),W),0)") (parse! "C(0,C(0,C(0,C(C(W,W),0))))") == .gt
#guard cmp (parse! "C(C(C(C(C(0,W),W),0),W),W)") (parse! "C(W,C(C(W,W),C(C(W,W),0)))") == .gt
#guard cmp (parse! "C(0,C(W,C(W,C(W,0))))") (parse! "C(C(C(0,C(0,0)),C(W,0)),W)") == .lt
#guard cmp (parse! "C(W,C(W,C(C(C(0,W),W),0)))") (parse! "C(C(C(C(W,W),0),W),W)") == .lt
#guard cmp (parse! "C(C(0,0),C(W,C(C(0,W),0)))") (parse! "C(0,C(W,C(W,C(C(W,W),W))))") == .lt
#guard cmp (parse! "C(0,C(C(C(0,C(W,W)),W),0))") (parse! "C(C(C(C(C(W,W),0),W),W),0)") == .gt
#guard cmp (parse! "C(C(C(0,C(0,0)),0),C(W,W))") (parse! "C(W,C(W,C(C(C(0,0),W),W)))") == .lt
#guard cmp (parse! "C(W,C(C(C(0,W),W),W))") (parse! "C(W,C(W,C(C(C(0,0),W),0)))") == .gt
#guard cmp (parse! "C(C(0,C(C(C(W,W),W),W)),0)") (parse! "C(C(C(W,0),C(C(W,W),W)),0)") == .gt
#guard cmp (parse! "C(C(0,0),C(C(0,C(0,0)),0))") (parse! "C(0,C(C(C(0,0),0),W))") == .lt
#guard cmp (parse! "C(C(W,0),C(C(0,C(W,0)),W))") (parse! "C(C(C(C(0,0),W),W),W)") == .lt
#guard cmp (parse! "C(0,C(W,C(W,W)))") (parse! "C(C(W,C(W,C(C(0,W),W))),W)") == .lt
#guard cmp (parse! "C(0,C(C(W,C(W,0)),C(W,W)))") (parse! "C(C(0,C(C(0,W),W)),0)") == .gt
#guard cmp (parse! "C(C(C(W,W),0),C(W,C(W,W)))") (parse! "C(C(0,C(C(C(W,W),W),W)),0)") == .gt
#guard cmp (parse! "C(C(C(C(0,C(0,W)),W),W),0)") (parse! "C(W,C(W,C(C(0,W),W)))") == .lt
#guard cmp (parse! "C(C(W,0),C(C(W,0),C(W,0)))") (parse! "C(0,C(W,C(C(C(W,W),W),W)))") == .lt
#guard cmp (parse! "C(C(0,C(0,C(W,C(W,0)))),W)") (parse! "C(W,C(C(C(W,W),W),0))") == .gt
#guard cmp (parse! "C(0,C(C(W,W),C(C(W,W),W)))") (parse! "C(0,C(C(C(0,W),W),W))") == .lt
#guard cmp (parse! "C(0,C(C(W,C(C(0,W),W)),W))") (parse! "C(C(C(W,0),C(W,C(W,0))),W)") == .gt
#guard cmp (parse! "C(C(W,C(C(0,W),0)),C(W,W))") (parse! "C(C(0,C(0,C(W,0))),C(W,0))") == .gt
#guard cmp (parse! "C(0,C(W,C(C(W,W),W)))") (parse! "C(W,C(C(C(0,C(W,W)),W),W))") == .lt
#guard cmp (parse! "C(C(0,C(0,C(C(0,W),W))),0)") (parse! "C(0,C(C(C(0,C(0,0)),W),W))") == .lt
#guard cmp (parse! "C(W,C(C(0,C(0,C(0,W))),W))") (parse! "C(C(C(0,C(0,C(W,0))),W),W)") == .lt
#guard cmp (parse! "C(C(0,C(W,0)),C(W,C(W,0)))") (parse! "C(C(C(W,C(W,0)),C(W,W)),W)") == .lt
#guard cmp (parse! "C(C(0,C(0,C(0,C(W,W)))),W)") (parse! "C(C(C(C(0,C(W,W)),0),W),W)") == .gt
#guard cmp (parse! "C(C(C(0,0),C(C(0,W),W)),0)") (parse! "C(C(C(C(0,C(0,W)),0),W),W)") == .lt
#guard cmp (parse! "W") (parse! "C(C(C(0,0),W),C(C(W,W),0))") == .gt
#guard cmp (parse! "C(C(C(0,W),C(C(0,W),W)),W)") (parse! "C(0,C(C(0,C(0,W)),W))") == .gt
#guard cmp (parse! "C(C(0,C(0,0)),C(C(W,0),W))") (parse! "C(C(C(C(C(0,0),0),W),0),W)") == .lt
#guard cmp (parse! "C(W,C(C(C(C(0,0),0),W),W))") (parse! "C(C(W,C(C(C(W,0),W),W)),W)") == .lt
#guard cmp (parse! "C(C(W,C(C(C(W,W),W),W)),W)") (parse! "C(W,C(C(W,W),C(C(W,W),W)))") == .gt
#guard cmp (parse! "C(C(W,0),C(W,C(C(0,W),W)))") (parse! "C(0,C(C(0,C(W,C(W,0))),W))") == .gt
#guard cmp (parse! "C(C(0,C(0,C(0,C(W,W)))),0)") (parse! "C(C(C(0,0),C(C(0,W),0)),W)") == .lt
#guard cmp (parse! "C(C(C(0,0),0),C(C(W,W),W))") (parse! "C(0,C(0,C(C(W,W),W)))") == .gt
#guard cmp (parse! "C(C(C(W,W),C(C(W,W),W)),W)") (parse! "C(C(C(W,W),C(C(W,W),0)),W)") == .gt
#guard cmp (parse! "C(C(W,0),C(W,C(W,C(W,W))))") (parse! "C(C(C(C(C(W,W),W),W),W),W)") == .lt
#guard cmp (parse! "C(0,C(C(C(W,W),0),C(W,W)))") (parse! "C(W,C(C(C(0,0),C(W,W)),W))") == .lt
#guard cmp (parse! "C(C(C(C(W,C(W,W)),W),W),0)") (parse! "C(C(C(W,W),C(C(W,W),W)),0)") == .gt
#guard cmp (parse! "C(C(W,C(W,C(C(0,W),W))),W)") (parse! "C(0,C(C(C(0,C(0,0)),0),0))") == .gt
#guard cmp (parse! "C(C(0,C(C(0,C(0,0)),W)),0)") (parse! "C(C(C(0,0),0),W)") == .lt
#guard cmp (parse! "C(C(C(0,C(W,0)),C(W,W)),0)") (parse! "C(C(C(0,W),C(C(0,W),W)),0)") == .lt
#guard cmp (parse! "C(W,C(C(C(W,W),W),0))") (parse! "C(C(0,0),C(C(C(0,W),0),W))") == .lt
#guard cmp (parse! "C(C(C(0,W),C(C(W,W),W)),0)") (parse! "C(C(C(0,W),C(C(W,W),W)),0)") == .eq
#guard cmp (parse! "C(C(W,C(W,0)),W)") (parse! "C(0,C(C(0,C(W,0)),W))") == .gt
#guard cmp (parse! "C(C(0,0),C(C(C(0,W),W),0))") (parse! "C(0,C(C(C(W,W),0),W))") == .lt
#guard cmp (parse! "C(0,C(C(C(W,C(W,W)),0),W))") (parse! "C(C(C(C(C(0,0),W),0),W),W)") == .lt
#guard cmp (parse! "C(C(0,C(C(C(0,0),0),0)),0)") (parse! "C(C(0,C(C(0,0),C(W,0))),W)") == .lt
#guard cmp (parse! "C(C(C(C(0,0),0),0),0)") (parse! "C(C(0,C(C(0,W),W)),0)") == .lt
#guard cmp (parse! "C(C(W,C(C(C(W,0),W),W)),W)") (parse! "C(W,C(C(C(0,C(W,0)),W),W))") == .gt
#guard cmp (parse! "C(C(0,C(C(0,C(0,W)),0)),W)") (parse! "C(W,C(C(C(W,W),W),W))") == .lt
#guard cmp (parse! "C(C(W,0),C(C(C(0,0),W),0))") (parse! "C(0,C(C(C(C(0,W),0),W),W))") == .lt
#guard cmp (parse! "C(C(0,C(0,C(0,C(0,0)))),0)") (parse! "C(C(W,W),C(C(W,W),0))") == .lt
#guard cmp (parse! "C(C(W,C(C(C(W,0),W),0)),W)") (parse! "C(C(0,C(C(0,C(W,0)),W)),W)") == .lt
#guard cmp (parse! "C(C(0,C(0,C(C(W,0),W))),W)") (parse! "C(0,C(W,C(C(0,C(W,W)),0)))") == .gt
#guard cmp (parse! "C(C(0,W),C(C(0,C(0,W)),0))") (parse! "C(C(0,W),C(C(C(0,0),W),W))") == .lt
#guard cmp (parse! "C(C(0,C(W,0)),C(C(0,W),W))") (parse! "C(0,C(W,C(C(C(W,0),W),0)))") == .gt
#guard cmp (parse! "C(0,C(C(0,C(C(W,W),W)),W))") (parse! "C(C(0,C(0,C(W,W))),W)") == .gt
#guard cmp (parse! "C(C(0,C(0,0)),C(W,C(W,0)))") (parse! "C(C(0,0),C(C(0,C(W,W)),0))") == .lt
#guard cmp (parse! "C(C(0,W),C(C(C(0,0),W),W))") (parse! "C(W,C(C(C(0,C(W,W)),W),W))") == .lt
#guard cmp (parse! "C(C(C(0,0),C(C(0,W),W)),0)") (parse! "C(C(0,W),C(C(C(0,0),W),W))") == .lt
#guard cmp (parse! "C(C(C(W,0),C(C(0,W),W)),W)") (parse! "C(C(C(W,C(W,0)),W),W)") == .gt
#guard cmp (parse! "C(0,C(0,C(C(C(0,0),0),W)))") (parse! "C(W,C(W,C(C(C(W,0),W),W)))") == .lt
#guard cmp (parse! "C(0,C(C(W,W),C(C(W,W),0)))") (parse! "C(0,C(0,C(0,C(C(W,0),W))))") == .lt
#guard cmp (parse! "C(C(C(C(W,W),W),0),W)") (parse! "C(0,C(C(0,C(C(0,0),0)),W))") == .gt
#guard cmp (parse! "C(W,C(C(0,C(C(W,W),W)),W))") (parse! "C(C(W,0),C(C(C(W,W),0),W))") == .gt
#guard cmp (parse! "C(C(0,W),0)") (parse! "C(C(C(C(C(W,0),W),0),W),W)") == .lt
#guard cmp (parse! "C(C(0,C(C(0,C(0,0)),0)),W)") (parse! "C(W,C(W,C(W,C(W,W))))") == .lt
#guard cmp (parse! "C(C(0,W),C(C(W,C(W,W)),W))") (parse! "C(C(W,C(W,0)),W)") == .gt
#guard cmp (parse! "C(C(W,C(C(C(0,W),W),W)),0)") (parse! "C(0,C(C(W,W),0))") == .gt
#guard cmp (parse! "C(C(0,0),C(C(C(0,W),W),W))") (parse! "C(0,C(0,C(0,C(0,C(0,W)))))") == .gt
#guard cmp (parse! "C(C(C(C(0,C(0,W)),W),W),W)") (parse! "C(W,C(W,C(C(C(W,W),W),0)))") == .gt
#guard cmp (parse! "C(C(0,W),C(C(0,C(0,W)),0))") (parse! "C(W,C(C(C(C(0,0),0),W),0))") == .lt
#guard cmp (parse! "C(0,C(0,C(W,W)))") (parse! "C(0,C(C(0,0),C(W,0)))") == .gt
#guard cmp (parse! "C(W,W)") (parse! "C(C(0,C(C(0,C(W,0)),W)),W)") == .lt
#guard cmp (parse! "C(0,C(C(0,W),C(C(W,W),0)))") (parse! "C(C(C(0,W),C(C(W,W),W)),W)") == .lt
#guard cmp (parse! "C(C(C(0,C(0,W)),W),0)") (parse! "C(C(0,W),C(C(W,C(W,W)),0))") == .gt
#guard cmp (parse! "C(C(W,C(W,C(C(0,W),W))),0)") (parse! "C(C(W,C(C(C(0,W),W),W)),0)") == .lt
#guard cmp (parse! "C(C(0,C(C(0,0),0)),C(W,W))") (parse! "C(C(0,0),C(C(W,W),W))") == .lt
#guard cmp (parse! "C(C(C(W,C(C(W,W),W)),0),W)") (parse! "C(C(W,0),C(C(C(W,W),W),0))") == .gt
#guard cmp (parse! "C(C(0,C(W,C(W,0))),C(W,W))") (parse! "C(C(0,0),C(C(C(W,0),W),W))") == .lt
#guard cmp (parse! "C(W,C(C(C(C(0,0),0),W),0))") (parse! "C(0,C(C(C(C(W,0),W),W),W))") == .lt
#guard cmp (parse! "C(C(W,C(W,C(W,0))),W)") (parse! "C(C(W,0),C(C(0,C(W,W)),0))") == .gt
#guard cmp (parse! "C(0,C(C(C(W,0),C(W,W)),W))") (parse! "C(C(0,C(0,C(0,C(W,W)))),W)") == .gt
#guard cmp (parse! "C(C(C(0,0),0),C(C(0,W),0))") (parse! "C(0,C(0,0))") == .gt
#guard cmp (parse! "C(C(C(W,W),0),C(W,C(W,W)))") (parse! "C(C(W,C(C(C(0,W),W),W)),0)") == .gt
#guard cmp (parse! "C(0,C(W,C(C(C(W,W),W),0)))") (parse! "C(C(C(0,W),C(C(W,W),0)),W)") == .lt
#guard cmp (parse! "C(0,C(W,C(C(C(W,W),W),0)))") (parse! "C(0,C(C(0,0),C(C(W,W),0)))") == .gt
#guard cmp (parse! "C(0,C(C(0,C(0,0)),C(W,W)))") (parse! "C(C(C(0,W),0),C(C(W,W),0))") == .gt
#guard cmp (parse! "C(C(0,C(0,C(C(W,W),W))),0)") (parse! "C(W,C(C(C(0,W),W),W))") == .lt
#guard cmp (parse! "C(C(C(0,0),0),C(C(0,W),W))") (parse! "C(W,C(C(C(C(0,0),0),W),0))") == .gt
#guard cmp (parse! "C(W,C(W,C(W,0)))") (parse! "C(C(C(0,C(C(0,W),W)),0),W)") == .lt
#guard cmp (parse! "C(C(0,W),C(C(C(W,0),W),W))") (parse! "C(0,C(W,C(C(C(W,0),W),W)))") == .gt
#guard cmp (parse! "C(C(0,C(C(0,0),C(W,0))),W)") (parse! "C(C(C(0,0),W),W)") == .lt
#guard cmp (parse! "C(C(C(0,C(C(0,W),0)),W),W)") (parse! "C(C(0,C(W,C(C(0,W),W))),W)") == .lt
#guard cmp (parse! "C(C(0,C(C(C(0,W),W),0)),W)") (parse! "C(W,C(C(C(C(W,0),W),W),0))") == .gt
#guard cmp (parse! "C(C(C(C(0,C(W,0)),W),0),W)") (parse! "C(0,C(C(C(0,C(0,0)),W),W))") == .lt
#guard cmp (parse! "C(0,C(0,C(0,C(0,C(0,W)))))") (parse! "C(0,C(0,C(C(C(W,W),W),W)))") == .lt
#guard cmp (parse! "C(W,C(C(0,C(C(0,W),W)),0))") (parse! "C(C(C(C(0,0),0),W),W)") == .lt
#guard cmp (parse! "C(C(0,C(C(C(W,0),W),0)),W)") (parse! "C(0,C(C(C(0,0),0),0))") == .gt
#guard cmp (parse! "C(0,C(C(C(C(0,0),W),0),W))") (parse! "C(W,C(C(C(0,0),W),0))") == .gt
#guard cmp (parse! "C(C(C(C(0,W),0),W),0)") (parse! "C(0,C(W,W))") == .lt
#guard cmp (parse! "C(W,C(C(C(0,C(W,0)),W),W))") (parse! "C(C(C(C(W,0),W),W),0)") == .gt
#guard cmp (parse! "C(0,C(C(0,0),C(C(0,0),0)))") (parse! "C(W,C(W,0))") == .lt
#guard cmp (parse! "C(C(C(C(C(0,0),0),0),0),W)") (parse! "C(C(C(C(C(W,0),W),W),0),W)") == .lt
#guard cmp (parse! "C(C(C(0,C(W,0)),W),0)") (parse! "C(C(C(C(C(W,W),0),W),W),0)") == .lt
#guard cmp (parse! "C(W,C(C(C(C(0,0),0),W),W))") (parse! "C(C(C(0,C(C(0,W),W)),0),W)") == .gt
#guard cmp (parse! "C(C(C(0,C(0,C(0,0))),0),W)") (parse! "C(C(W,0),C(C(0,C(0,W)),W))") == .lt
#guard cmp (parse! "C(C(C(0,C(0,0)),C(W,W)),W)") (parse! "C(C(C(C(0,0),C(W,W)),W),0)") == .gt
#guard cmp (parse! "C(C(0,0),C(W,C(W,C(W,W))))") (parse! "C(C(C(W,W),W),0)") == .gt
#guard cmp (parse! "C(W,0)") (parse! "C(W,C(W,C(C(0,C(0,W)),0)))") == .lt
#guard cmp (parse! "C(W,C(C(C(W,W),W),0))") (parse! "C(C(C(W,W),W),0)") == .gt
#guard cmp (parse! "C(W,C(W,C(C(0,C(W,W)),0)))") (parse! "C(C(0,0),C(C(C(W,W),W),W))") == .lt
#guard cmp (parse! "C(C(C(0,C(W,0)),C(W,0)),W)") (parse! "C(0,C(C(C(0,C(W,W)),W),0))") == .gt
#guard cmp (parse! "C(C(C(C(0,0),W),0),W)") (parse! "C(W,C(C(C(W,C(W,0)),W),0))") == .gt
#guard cmp (parse! "C(C(C(C(0,0),0),C(W,W)),W)") (parse! "C(0,C(0,C(W,C(W,0))))") == .gt
#guard cmp (parse! "C(0,C(C(C(0,C(0,W)),W),0))") (parse! "C(W,C(W,C(C(W,W),W)))") == .lt
#guard cmp (parse! "C(0,C(C(0,C(0,C(W_2,W_2))),W_2))") (parse! "C(0,C(0,C(C(0,0),C(W_2,W_2))))") == .gt
#guard cmp (parse! "C(0,C(C(W_2,W),C(W_2,W_2)))") (parse! "C(C(C(0,C(W,W_2)),W_2),0)") == .gt
#guard cmp (parse! "C(W_2,C(C(C(0,C(0,W_2)),W_2),0))") (parse! "C(0,C(C(C(C(W_2,W_2),W_2),0),W_2))") == .lt
#guard cmp (parse! "C(C(0,C(C(C(0,W_2),W_2),W_2)),0)") (parse! "C(0,C(C(C(W,W_2),W_2),0))") == .gt
#guard cmp (parse! "C(0,C(W_2,C(W_2,C(C(0,W_2),W_2))))") (parse! "C(C(W,C(W,W_2)),0)") == .gt
#guard cmp (parse! "C(0,C(C(0,W_2),W_2))") (parse! "C(C(C(0,0),C(W,0)),W_2)") == .gt
#guard cmp (parse! "C(0,C(0,C(W,W_2)))") (parse! "C(C(C(0,C(C(W_2,W_2),W_2)),0),0)") == .gt
#guard cmp (parse! "C(W_2,C(C(C(C(W_2,W_2),W_2),W_2),W_2))") (parse! "C(C(C(C(0,0),0),W),W_2)") == .gt
#guard cmp (parse! "C(0,C(C(C(C(0,W_2),0),W_2),0))") (parse! "C(C(C(C(0,C(0,0)),W_2),0),0)") == .gt
#guard cmp (parse! "C(C(C(0,0),0),C(C(0,W_2),0))") (parse! "C(C(C(0,C(W_2,C(W_2,W_2))),W_2),0)") == .lt
#guard cmp (parse! "C(C(W_2,C(C(0,W_2),0)),C(W_2,W_2))") (parse! "C(W,C(C(C(0,W_2),W_2),0))") == .gt
#guard cmp (parse! "C(C(C(0,0),0),C(W,W_2))") (parse! "C(W_2,C(C(0,C(0,W_2)),0))") == .gt
#guard cmp (parse! "C(W_2,C(W_2,C(W_2,C(W_2,C(W_2,W_2)))))") (parse! "C(0,C(C(0,W),C(W_2,W_2)))") == .gt
#guard cmp (parse! "C(W,C(C(W,W_2),0))") (parse! "C(C(C(0,0),C(C(W_2,W_2),W_2)),W_2)") == .lt
#guard cmp (parse! "C(C(0,0),C(C(C(0,W_2),0),W_2))") (parse! "C(C(0,C(W_2,W_2)),0)") == .gt
#guard cmp (parse! "C(C(0,C(C(0,W_2),0)),C(W_2,W_2))") (parse! "C(W_2,C(C(0,C(0,C(0,W_2))),0))") == .gt
#guard cmp (parse! "C(0,C(C(0,C(0,0)),C(W_2,W_2)))") (parse! "C(C(C(C(0,C(W_2,W_2)),0),0),W_2)") == .gt
#guard cmp (parse! "C(0,C(0,C(C(0,C(0,0)),0)))") (parse! "C(C(C(C(0,C(0,W_2)),W_2),W_2),0)") == .lt
#guard cmp (parse! "C(C(0,C(C(0,C(0,0)),W_2)),W_2)") (parse! "C(0,C(0,C(C(0,C(0,W_2)),0)))") == .gt
#guard cmp (parse! "C(C(C(C(C(0,W_2),W_2),W_2),W_2),W_2)") (parse! "C(0,C(C(0,C(C(0,W_2),W_2)),W_2))") == .gt
#guard cmp (parse! "C(C(C(C(0,0),W_2),W_2),0)") (parse! "C(C(W_2,C(C(W_2,C(W_2,W_2)),0)),W_2)") == .lt
#guard cmp (parse! "C(C(W,C(C(W_2,W_2),0)),0)") (parse! "C(C(0,C(C(C(W_2,W_2),W_2),W_2)),0)") == .lt
#guard cmp (parse! "C(C(0,C(0,C(0,C(0,0)))),0)") (parse! "C(W_2,C(W_2,C(C(C(0,0),W_2),0)))") == .lt
#guard cmp (parse! "C(C(0,0),C(C(C(0,0),0),W_2))") (parse! "C(0,C(0,C(0,C(W,0))))") == .gt
#guard cmp (parse! "C(C(C(C(W_2,W_2),W_2),W_2),0)") (parse! "C(C(C(0,0),C(W_2,W_2)),W_2)") == .lt
#guard cmp (parse! "C(W_2,C(C(C(0,W),W_2),0))") (parse! "C(C(C(C(0,W_2),W_2),0),C(W_2,W_2))") == .lt
#guard cmp (parse! "C(W,C(W_2,C(W_2,C(W_2,W_2))))") (parse! "C(0,C(0,C(C(W_2,C(W_2,W_2)),0)))") == .gt
#guard cmp (parse! "C(0,C(C(C(0,C(W_2,W_2)),W_2),W_2))") (parse! "C(0,C(C(C(0,C(0,W_2)),W_2),0))") == .gt
#guard cmp (parse! "C(W_2,C(C(C(W,W_2),W_2),W_2))") (parse! "C(W_2,C(C(0,C(0,C(W_2,W_2))),W_2))") == .gt
#guard cmp (parse! "C(C(W_2,W),C(W_2,C(W_2,W_2)))") (parse! "C(0,C(0,C(W_2,W)))") == .gt
#guard cmp (parse! "C(0,C(C(0,C(0,W_2)),0))") (parse! "C(0,C(C(C(C(0,W_2),W_2),W_2),W_2))") == .lt
#guard cmp (parse! "C(0,C(C(0,C(W_2,W)),0))") (parse! "C(C(C(C(C(0,0),W_2),0),W_2),0)") == .lt
#guard cmp (parse! "C(0,C(0,C(C(C(0,W_2),W_2),0)))") (parse! "C(C(C(C(0,C(W_2,W_2)),W_2),0),0)") == .gt
#guard cmp (parse! "C(C(C(0,C(C(W_2,W_2),0)),W_2),0)") (parse! "C(0,C(C(W,W_2),0))") == .gt
#guard cmp (parse! "C(W,C(C(0,W),0))") (parse! "C(C(W,C(W_2,C(W_2,W_2))),0)") == .lt
#guard cmp (parse! "C(C(C(W_2,C(W_2,C(W_2,W_2))),W_2),0)") (parse! "C(C(0,C(C(W_2,C(W_2,W_2)),W_2)),0)") == .gt
#guard cmp (parse! "C(0,C(C(W_2,W_2),C(C(W_2,W_2),0)))") (parse! "C(W_2,W_2)") == .lt
#guard cmp (parse! "C(C(C(C(0,W_2),W_2),W_2),W_2)") (parse! "C(0,C(C(C(0,W_2),W_2),W_2))") == .gt
#guard cmp (parse! "C(0,C(C(0,C(0,W_2)),0))") (parse! "C(C(C(0,0),C(C(0,W_2),0)),W_2)") == .lt
#guard cmp (parse! "C(C(0,C(0,C(0,W))),W_2)") (parse! "C(C(W,C(W,0)),W_2)") == .gt
#guard cmp (parse! "C(0,C(W_2,C(W_2,W_2)))") (parse! "C(C(W_2,W),C(W_2,W))") == .gt
#guard cmp (parse! "C(0,C(W_2,C(C(0,C(0,W_2)),0)))") (parse! "C(C(0,C(W,C(W_2,W_2))),0)") == .lt
#guard cmp (parse! "C(C(W,0),C(W,W_2))") (parse! "C(C(0,W_2),C(C(W_2,W_2),0))") == .gt
#guard cmp (parse! "C(C(0,C(C(0,0),W_2)),W_2)") (parse! "C(C(0,0),C(C(W,W_2),0))") == .gt
#guard cmp (parse! "C(C(0,C(W_2,C(W_2,C(W_2,W_2)))),0)") (parse! "C(C(C(C(0,W),0),W_2),0)") == .gt
#guard cmp (parse! "C(C(0,W_2),C(C(0,W_2),0))") (parse! "C(C(C(C(0,0),0),0),W_2)") == .lt
#guard cmp (parse! "C(0,C(0,C(C(0,W),W_2)))") (parse! "C(C(0,C(0,W_2)),C(C(W_2,W_2),0))") == .gt
#guard cmp (parse! "C(C(C(C(0,C(0,W_2)),W_2),0),W_2)") (parse! "C(W_2,C(W_2,C(C(0,C(W_2,W_2)),W_2)))") == .lt
#guard cmp (parse! "C(C(C(W_2,C(W_2,C(W_2,W_2))),0),W_2)") (parse! "C(C(0,C(W_2,W)),W)") == .gt
#guard cmp (parse! "C(C(C(W_2,C(W_2,W_2)),0),0)") (parse! "C(W_2,C(C(C(0,C(0,0)),W_2),0))") == .lt
#guard cmp (parse! "C(C(W_2,C(C(W_2,C(W_2,W_2)),W_2)),0)") (parse! "C(W_2,C(C(W,W_2),0))") == .gt
#guard cmp (parse! "C(C(0,C(C(W_2,W_2),0)),W)") (parse! "C(C(W_2,W_2),C(C(C(W_2,W_2),W_2),W_2))") == .lt
#guard cmp (parse! "C(C(C(0,C(C(0,0),W_2)),W_2),0)") (parse! "C(W,C(W_2,C(C(0,W_2),W_2)))") == .lt
#guard cmp (parse! "C(C(0,0),C(W_2,C(C(0,W_2),W_2)))") (parse! "C(C(C(C(0,W_2),W_2),0),0)") == .gt
#guard cmp (parse! "C(0,C(C(0,0),C(C(0,0),0)))") (parse! "C(0,C(C(C(C(0,0),W_2),W_2),W_2))") == .lt
#guard cmp (parse! "C(0,C(0,C(0,C(0,C(0,0)))))") (parse! "C(C(C(0,C(C(0,0),0)),0),W_2)") == .lt
#guard cmp (parse! "C(C(0,C(C(C(0,W_2),W_2),W_2)),W_2)") (parse! "C(C(C(C(0,W),W_2),0),W_2)") == .gt
#guard cmp (parse! "C(C(0,C(0,W)),W)") (parse! "C(W_2,C(C(0,C(W_2,W_2)),0))") == .lt
#guard cmp (parse! "C(C(0,C(C(W,0),W_2)),W_2)") (parse! "C(C(C(0,C(0,0)),C(W_2,W_2)),W_2)") == .lt
#guard cmp (parse! "C(0,C(W_2,C(C(C(0,W_2),W_2),0)))") (parse! "C(W_2,C(W_2,C(W_2,C(W_2,W))))") == .gt
#guard cmp (parse! "C(0,C(C(0,0),C(C(0,0),W_2)))") (parse! "C(C(0,C(0,C(0,C(0,0)))),0)") == .gt
#guard cmp (parse! "C(C(0,0),C(C(W,W_2),0))") (parse! "C(0,C(C(C(0,0),C(W_2,W_2)),0))") == .lt
#guard cmp (parse! "C(C(W_2,W),C(C(0,W_2),0))") (parse! "C(0,C(W_2,C(C(0,W_2),W_2)))") == .lt
#guard cmp (parse! "C(C(C(0,C(C(W_2,W_2),0)),0),W_2)") (parse! "C(C(C(0,0),C(C(0,0),W_2)),0)") == .gt
#guard cmp (parse! "C(C(C(0,C(C(W_2,W_2),W_2)),0),0)") (parse! "C(W_2,C(C(C(0,0),C(W_2,W_2)),W_2))") == .lt
#guard cmp (parse! "C(0,C(0,C(0,W)))") (parse! "C(0,C(W_2,C(C(C(0,W_2),W_2),W_2)))") == .lt
#guard cmp (parse! "C(C(C(0,0),C(C(0,W_2),W_2)),0)") (parse! "C(C(W_2,C(C(0,C(0,W_2)),0)),0)") == .gt
#guard cmp (parse! "C(0,C(W_2,C(W_2,W)))") (parse! "C(C(C(C(0,0),W_2),0),W_2)") == .lt
#guard cmp (parse! "C(W_2,C(W_2,W_2))") (parse! "C(C(C(C(0,0),0),0),W)") == .gt
#guard cmp (parse! "C(C(0,C(C(C(0,0),0),W_2)),0)") (parse! "C(0,C(C(W_2,C(C(W_2,W_2),0)),0))") == .gt
#guard cmp (parse! "C(C(0,0),C(C(W,0),W_2))") (parse! "C(0,C(C(0,C(0,0)),0))") == .gt
#guard cmp (parse! "C(W_2,C(C(C(0,C(0,W_2)),W_2),W_2))") (parse! "C(0,C(0,C(C(C(0,0),W_2),0)))") == .gt
#guard cmp (parse! "C(C(C(0,0),0),C(W_2,W_2))") (parse! "C(C(0,C(0,C(0,W_2))),0)") == .gt
#guard cmp (parse! "C(C(0,C(0,C(0,0))),W_2)") (parse! "C(C(W_2,C(C(0,W_2),0)),W_2)") == .lt
#guard cmp (parse! "C(C(C(C(0,W_2),W_2),0),0)") (parse! "C(0,C(0,C(C(W_2,W),0)))") == .gt
#guard cmp (parse! "C(0,C(C(C(0,C(W_2,W_2)),W_2),0))") (parse! "C(C(0,C(0,C(0,C(0,0)))),W_2)") == .lt
#guard cmp (parse! "C(0,C(C(W_2,W),W))") (parse! "C(C(C(C(0,W_2),0),0),C(W_2,W_2))") == .lt
#guard cmp (parse! "C(C(0,C(C(W_2,W),0)),W_2)") (parse! "C(C(C(C(0,0),0),W),W_2)") == .lt
#guard cmp (parse! "C(C(W_2,C(W_2,C(C(0,W_2),0))),0)") (parse! "C(0,C(0,C(0,C(W,0))))") == .gt
#guard cmp (parse! "C(C(C(0,C(0,C(0,W_2))),W_2),0)") (parse! "C(C(W_2,W),C(C(W_2,W_2),W_2))") == .lt
#guard cmp (parse! "C(C(W_2,C(W_2,W_2)),0)") (parse! "C(C(0,C(C(C(0,0),W_2),W_2)),0)") == .lt
#guard cmp (parse! "C(W,C(C(C(0,W_2),W_2),0))") (parse! "C(C(C(0,W_2),0),C(C(0,W_2),0))") == .gt
#guard cmp (parse! "C(C(0,C(C(W_2,W_2),0)),C(W_2,W_2))") (parse! "C(C(C(0,C(C(0,0),0)),W_2),W_2)") == .lt
#guard cmp (parse! "C(0,C(C(C(C(W_2,W_2),W_2),W_2),W_2))") (parse! "C(C(C(C(0,W),0),W_2),0)") == .gt
#guard cmp (parse! "C(C(C(C(0,W_2),0),0),W)") (parse! "C(W,C(C(C(W_2,W_2),0),0))") == .gt
#guard cmp (parse! "C(0,C(0,C(C(C(0,0),W_2),0)))") (parse! "C(C(C(C(C(0,0),0),W_2),W_2),0)") == .lt
#guard cmp (parse! "C(C(0,C(W_2,W)),0)") (parse! "C(W,C(C(0,C(0,W_2)),W_2))") == .lt
#guard cmp (parse! "C(0,C(C(0,C(0,C(W_2,W_2))),W_2))") (parse! "C(C(W_2,C(W_2,W)),W)") == .gt
#guard cmp (parse! "C(W_2,C(C(0,C(0,C(0,W_2))),0))") (parse! "C(0,C(C(W_2,W),W_2))") == .lt
#guard cmp (parse! "C(0,C(C(C(W,0),W_2),W_2))") (parse! "C(W_2,C(C(0,W_2),C(C(0,W_2),W_2)))") == .gt
#guard cmp (parse! "C(W,C(C(C(0,W_2),0),W_2))") (parse! "C(C(C(C(C(0,0),W_2),0),W_2),0)") == .gt
#guard cmp (parse! "C(C(W,C(W_2,C(W_2,W_2))),W_2)") (parse! "C(C(C(W,0),W_2),0)") == .gt
#guard cmp (parse! "C(W_2,C(W_2,C(C(0,C(W_2,W_2)),W_2)))") (parse! "C(C(0,C(W_2,C(C(W_2,W_2),W_2))),0)") == .gt
#guard cmp (parse! "C(W_2,C(W_2,C(W_2,W)))") (parse! "C(0,C(W_2,C(C(W_2,C(W_2,W_2)),0)))") == .lt
#guard cmp (parse! "C(C(C(0,C(C(0,0),W_2)),W_2),W_2)") (parse! "C(C(C(C(C(0,0),0),W_2),W_2),0)") == .gt
#guard cmp (parse! "C(0,C(W_2,C(W_2,C(C(W_2,W_2),W_2))))") (parse! "C(C(C(C(0,C(0,W_2)),W_2),0),0)") == .gt
#guard cmp (parse! "C(0,C(C(0,C(0,0)),W_2))") (parse! "C(C(C(0,C(C(W_2,W_2),W_2)),W_2),W_2)") == .lt
#guard cmp (parse! "C(C(C(C(0,C(0,W_2)),W_2),W_2),0)") (parse! "C(C(C(W_2,W_2),0),C(C(0,W_2),W_2))") == .lt
#guard cmp (parse! "C(0,C(C(C(W_2,W),W_2),W_2))") (parse! "C(W_2,C(C(C(0,C(0,W_2)),W_2),0))") == .gt
#guard cmp (parse! "C(C(0,C(0,0)),C(W_2,W))") (parse! "C(W_2,C(C(C(C(0,0),W_2),W_2),0))") == .lt
#guard cmp (parse! "C(0,C(0,C(W_2,W)))") (parse! "C(W_2,C(C(C(C(W_2,W_2),W_2),W_2),W_2))") == .lt
#guard cmp (parse! "C(C(C(0,W_2),W_2),0)") (parse! "C(W,C(W_2,C(W_2,C(W_2,W_2))))") == .lt
#guard cmp (parse! "C(C(C(C(0,0),0),C(W_2,W_2)),0)") (parse! "C(0,C(C(C(0,0),W_2),0))") == .gt
#guard cmp (parse! "C(C(0,0),C(W,0))") (parse! "C(C(C(0,C(0,0)),W),W_2)") == .lt
#guard cmp (parse! "C(0,C(C(C(0,0),0),0))") (parse! "C(C(0,C(0,C(0,0))),W_2)") == .lt
#guard cmp (parse! "C(C(C(0,C(0,0)),0),0)") (parse! "C(C(0,0),C(C(0,W_2),0))") == .lt
#guard cmp (parse! "C(C(C(0,C(W,W_2)),W_2),0)") (parse! "C(0,C(0,C(W_2,W_2)))") == .lt
#guard cmp (parse! "C(0,W)") (parse! "C(C(0,C(C(0,0),W)),0)") == .gt
#guard cmp (parse! "C(C(0,C(W_2,C(W_2,C(W_2,W_2)))),0)") (parse! "C(C(0,0),C(C(W_2,W),W_2))") == .lt
#guard cmp (parse! "C(C(C(0,C(C(0,W_2),W_2)),0),0)") (parse! "C(C(C(C(0,C(0,W_2)),W_2),W_2),0)") == .lt
#guard cmp (parse! "C(C(0,0),C(W,0))") (parse! "C(C(C(C(W_2,C(W_2,W_2)),W_2),W_2),0)") == .lt
#guard cmp (parse! "C(C(0,C(C(0,C(W_2,W_2)),0)),W_2)") (parse! "C(0,C(W_2,C(C(0,C(W_2,W_2)),0)))") == .gt
#guard cmp (parse! "C(W_2,C(C(C(0,C(W_2,W_2)),W_2),W_2))") (parse! "C(W_2,C(C(0,C(W_2,C(W_2,W_2))),0))") == .gt
#guard cmp (parse! "C(W_2,C(C(C(0,W),W_2),W_2))") (parse! "C(C(0,C(C(C(0,W_2),W_2),W_2)),0)") == .gt
#guard cmp (parse! "C(C(C(0,W_2),C(C(W_2,W_2),0)),0)") (parse! "C(C(W,W_2),W_2)") == .lt
#guard cmp (parse! "C(C(W_2,C(C(W_2,C(W_2,W_2)),W_2)),W_2)") (parse! "C(C(W_2,C(C(0,W_2),0)),C(W_2,W_2))") == .gt
#guard cmp (parse! "C(0,C(0,C(C(0,C(0,W_2)),W_2)))") (parse! "C(C(C(0,C(0,C(0,0))),W_2),0)") == .gt
#guard cmp (parse! "C(C(C(C(0,0),C(W_2,W_2)),0),0)") (parse! "C(0,C(C(C(W_2,W_2),0),W))") == .lt
#guard cmp (parse! "C(C(C(0,W_2),C(C(W_2,W_2),0)),0)") (parse! "C(C(0,0),C(C(C(0,W_2),0),0))") == .gt
#guard cmp (parse! "C(0,C(C(0,C(0,W)),0))") (parse! "C(C(C(C(W_2,W_2),0),W_2),W_2)") == .lt
#guard cmp (parse! "C(C(C(0,C(W_2,W)),W_2),0)") (parse! "C(0,C(W_2,W_2))") == .lt
#guard cmp (parse! "C(C(W,C(W,0)),W_2)") (parse! "C(C(C(0,0),C(C(0,0),0)),W_2)") == .gt
#guard cmp (parse! "C(C(0,0),C(W_2,C(W_2,W)))") (parse! "C(C(C(C(W_2,W),0),W_2),0)") == .lt
#guard cmp (parse! "C(0,C(0,C(0,C(0,0))))") (parse! "C(0,C(W_2,W_2))") == .lt
#guard cmp (parse! "C(C(0,0),C(C(C(0,0),0),W_2))") (parse! "C(0,C(C(C(C(0,0),0),W_2),0))") == .gt
#guard cmp (parse! "C(C(0,W),C(W_2,C(W_2,W_2)))") (parse! "C(C(0,C(0,C(0,C(0,0)))),W_2)") == .gt
#guard cmp (parse! "C(C(C(0,0),C(W_2,W_2)),0)") (parse! "C(W,C(W_2,C(W_2,C(W_2,W_2))))") == .lt
#guard cmp (parse! "C(C(C(C(0,W_2),W_2),0),0)") (parse! "C(0,C(0,C(C(C(W_2,W_2),W_2),W_2)))") == .lt
#guard cmp (parse! "C(C(C(0,C(W,W_2)),W_2),W_2)") (parse! "C(0,C(0,C(0,C(W_2,C(W_2,W_2)))))") == .gt
#guard cmp (parse! "C(C(C(W_2,W_2),0),C(W_2,W))") (parse! "C(C(C(W_2,C(W_2,W_2)),0),W_2)") == .lt
#guard cmp (parse! "C(C(0,W_2),C(C(C(W_2,W_2),W_2),0))") (parse! "C(C(0,W_2),C(C(0,W_2),0))") == .gt
#guard cmp (parse! "C(0,C(0,C(0,C(C(0,W_2),W_2))))") (parse! "C(C(0,C(0,W)),W)") == .gt
#guard cmp (parse! "C(C(C(W_2,W),C(W_2,W_2)),0)") (parse! "C(C(W,C(W,0)),W_2)") == .lt
#guard cmp (parse! "C(C(C(0,0),W),W_2)") (parse! "C(W_2,C(C(C(C(0,0),W_2),W_2),0))") == .gt
#guard cmp (parse! "C(0,C(C(0,0),C(C(W_2,W_2),0)))") (parse! "C(0,C(C(W,W),W_2))") == .lt
#guard cmp (parse! "C(C(C(C(0,0),0),0),C(W_2,W_2))") (parse! "C(W_2,C(W_2,C(C(0,W_2),0)))") == .gt
#guard cmp (parse! "C(C(C(C(C(0,0),W_2),0),0),W_2)") (parse! "C(C(W_2,C(C(W_2,C(W_2,W_2)),0)),0)") == .gt
#guard cmp (parse! "C(0,C(C(0,C(C(0,W_2),W_2)),0))") (parse! "C(C(W_2,W_2),C(C(W_2,C(W_2,W_2)),W_2))") == .lt
#guard cmp (parse! "C(0,C(C(C(0,0),W_2),0))") (parse! "C(C(C(0,C(0,W)),W_2),W_2)") == .lt
#guard cmp (parse! "C(C(C(0,C(0,W)),W_2),0)") (parse! "C(C(C(0,C(0,C(0,0))),W_2),0)") == .gt
#guard cmp (parse! "C(C(0,C(W_2,C(C(W_2,W_2),0))),0)") (parse! "C(0,C(C(0,C(0,C(0,0))),0))") == .gt
#guard cmp (parse! "C(C(C(0,C(W_2,C(W_2,W_2))),W_2),W_2)") (parse! "C(C(C(W_2,W_2),W_2),W_2)") == .gt
#guard cmp (parse! "C(C(C(C(0,C(W_2,W_2)),W_2),W_2),0)") (parse! "C(0,C(0,C(C(W_2,W),0)))") == .gt
#guard cmp (parse! "C(C(0,C(C(0,0),C(W_2,W_2))),0)") (parse! "C(C(C(0,W_2),0),C(W_2,C(W_2,W_2)))") == .lt
#guard cmp (parse! "C(C(C(C(0,C(0,W_2)),W_2),0),W_2)") (parse! "C(C(0,C(0,C(W,W_2))),W_2)") == .lt
#guard cmp (parse! "C(W_2,C(C(0,W_2),0))") (parse! "C(C(C(C(0,C(W_2,W_2)),W_2),W_2),0)") == .lt
#guard cmp (parse! "C(0,C(C(0,W_2),W_2))") (parse! "C(C(C(W_2,W),W_2),W_2)") == .lt
#guard cmp (parse! "C(C(C(0,W),C(W_2,W_2)),0)") (parse! "C(C(C(C(C(0,W_2),W_2),W_2),0),0)") == .gt
#guard cmp (parse! "C(C(C(C(W_2,W),W_2),0),W_2)") (parse! "C(C(0,0),C(C(C(0,0),W_2),W_2))") == .lt
#guard cmp (parse! "C(C(C(W_2,W_2),0),C(C(0,W_2),W_2))") (parse! "C(C(0,C(0,0)),C(W,W_2))") == .gt
#guard cmp (parse! "C(C(W_2,C(W_2,W)),W)") (parse! "C(0,C(C(C(0,W),0),W_2))") == .lt
#guard cmp (parse! "C(C(0,C(C(C(0,0),0),0)),0)") (parse! "C(C(0,C(0,0)),0)") == .gt
#guard cmp (parse! "C(W_2,C(C(C(W_2,W_2),W_2),0))") (parse! "C(C(0,W),0)") == .gt
#guard cmp (parse! "C(C(C(C(W_2,C(W_2,W_2)),0),0),W_2)") (parse! "C(W,C(C(W_2,C(W_2,W_2)),0))") == .gt
#guard cmp (parse! "C(C(0,C(0,C(0,0))),0)") (parse! "C(0,C(C(0,W_2),C(C(W_2,W_2),0)))") == .lt
#guard cmp (parse! "C(C(C(C(0,0),W_2),0),W)") (parse! "C(C(C(W_2,C(C(0,W_2),0)),0),W_2)") == .lt
#guard cmp (parse! "C(W_2,C(C(W_2,C(W_2,C(W_2,W_2))),W_2))") (parse! "C(C(0,C(C(W_2,C(W_2,W_2)),W_2)),W_2)") == .lt
#guard cmp (parse! "C(C(0,C(0,W)),W)") (parse! "C(W_2,C(W_2,C(W_2,C(W_2,W))))") == .lt
#guard cmp (parse! "C(C(C(0,W_2),C(C(0,W_2),W_2)),W_2)") (parse! "C(0,C(C(C(C(0,0),0),0),0))") == .gt
#guard cmp (parse! "C(C(C(C(W_2,W_2),W_2),0),C(W_2,W_2))") (parse! "C(C(W_2,C(C(0,C(W_2,W_2)),0)),W_2)") == .gt
#guard cmp (parse! "C(C(C(C(C(0,0),0),W_2),0),0)") (parse! "C(C(W_2,C(C(0,W_2),0)),W_2)") == .lt
#guard cmp (parse! "C(C(C(0,C(0,W_2)),0),C(W_2,W_2))") (parse! "C(C(0,C(C(0,0),0)),W)") == .gt
#guard cmp (parse! "C(C(C(0,W),C(W_2,W_2)),0)") (parse! "C(W,C(C(0,C(0,W_2)),W_2))") == .lt
#guard cmp (parse! "C(C(0,C(C(0,W_2),W_2)),W_2)") (parse! "C(C(0,C(W,W)),0)") == .gt
#guard cmp (parse! "C(C(0,C(0,0)),C(W_2,W))") (parse! "C(0,C(C(0,W_2),0))") == .lt
#guard cmp (parse! "C(0,C(C(0,C(C(0,0),0)),0))") (parse! "C(0,C(0,W))") == .lt
#guard cmp (parse! "C(C(0,C(W,W)),W_2)") (parse! "C(C(C(C(W_2,W_2),0),0),W_2)") == .gt
#guard cmp (parse! "C(W,C(C(W_2,W_2),0))") (parse! "C(W_2,C(C(W_2,C(C(W_2,W_2),W_2)),W_2))") == .lt
#guard cmp (parse! "C(C(0,C(0,0)),C(W_2,C(W_2,W_2)))") (parse! "C(C(C(W_2,C(W_2,W_2)),0),W_2)") == .gt
#guard cmp (parse! "C(0,C(C(0,C(0,C(0,W_2))),0))") (parse! "C(0,C(W_2,C(C(C(0,W_2),W_2),W_2)))") == .lt
#guard cmp (parse! "C(W_2,C(W_2,W_2))") (parse! "C(W_2,C(C(C(W,0),W_2),W_2))") == .lt
#guard cmp (parse! "C(0,C(0,C(C(0,0),0)))") (parse! "C(C(C(W_2,W_2),C(C(W_2,W_2),0)),W_2)") == .lt
#guard cmp (parse! "C(W,C(W_2,C(C(W_2,W_2),W_2)))") (parse! "C(C(0,W_2),C(C(C(0,W_2),W_2),W_2))") == .lt
#guard cmp (parse! "C(C(C(W_2,C(C(0,W_2),W_2)),W_2),0)") (parse! "C(0,C(W_2,C(C(0,W_2),W_2)))") == .lt
#guard cmp (parse! "C(0,C(0,C(C(0,C(0,W_2)),W_2)))") (parse! "C(W,C(C(W_2,W_2),0))") == .gt
#guard cmp (parse! "C(C(C(0,W),C(W_2,W_2)),0)") (parse! "C(0,C(0,C(0,C(W,W_2))))") == .lt
#guard cmp (parse! "C(C(C(W_2,W_2),0),C(C(0,W_2),W_2))") (parse! "C(C(C(C(W_2,W_2),0),W_2),0)") == .gt
#guard cmp (parse! "C(C(0,C(C(0,0),C(W_2,W_2))),0)") (parse! "C(0,C(0,C(W_2,C(W_2,W))))") == .gt
#guard cmp (parse! "C(C(0,W_2),C(C(0,C(W_2,W_2)),0))") (parse! "C(W_2,C(W_2,W))") == .gt
#guard cmp (parse! "C(C(C(C(W,0),W_2),W_2),W_2)") (parse! "C(C(C(W_2,C(C(0,W_2),0)),W_2),W_2)") == .gt
#guard cmp (parse! "C(0,C(C(0,0),C(C(W_2,W_2),0)))") (parse! "C(C(C(C(W,W_2),W_2),0),W_2)") == .lt
#guard cmp (parse! "C(C(C(C(C(0,0),0),0),W_2),W_2)") (parse! "C(C(W,W_2),C(C(W_2,W_2),0))") == .gt
#guard cmp (parse! "C(W_2,C(W_2,C(W_2,C(C(0,W_2),0))))") (parse! "C(C(C(C(C(0,0),W_2),0),W_2),W_2)") == .lt
#guard cmp (parse! "C(0,C(C(C(0,W_2),W_2),0))") (parse! "C(W,C(C(W_2,W_2),0))") == .gt
#guard cmp (parse! "C(C(C(W_2,C(W_2,W_2)),0),W_2)") (parse! "C(C(C(W_2,W_2),C(C(W_2,W_2),W_2)),0)") == .gt
#guard cmp (parse! "C(C(W_2,C(W_2,C(C(W_2,W_2),0))),0)") (parse! "C(0,C(C(C(W,W_2),W_2),0))") == .lt
#guard cmp (parse! "C(C(C(0,0),C(C(W_2,W_2),W_2)),0)") (parse! "C(W_2,C(W_2,C(W_2,C(W_2,C(W_2,W_2)))))") == .lt
#guard cmp (parse! "C(C(C(C(0,C(0,W_2)),W_2),W_2),W_2)") (parse! "C(C(W,C(C(W_2,W_2),0)),0)") == .gt
#guard cmp (parse! "C(C(0,C(C(0,0),0)),W_2)") (parse! "C(C(C(C(0,C(W_2,W_2)),0),0),W_2)") == .lt
#guard cmp (parse! "C(C(C(W_2,C(C(0,W_2),0)),W_2),W_2)") (parse! "C(0,C(C(W_2,C(C(W_2,W_2),W_2)),W_2))") == .lt
#guard cmp (parse! "C(C(C(0,0),W),C(W_2,W_2))") (parse! "C(C(0,C(C(0,W),W_2)),W_2)") == .lt
#guard cmp (parse! "C(C(C(C(0,0),0),C(W_2,W_2)),0)") (parse! "C(C(C(C(0,0),W_2),0),W_2)") == .lt
#guard cmp (parse! "C(C(C(0,C(0,W)),W_2),W_2)") (parse! "C(0,C(0,C(C(W,W_2),0)))") == .gt
#guard cmp (parse! "C(C(C(0,C(0,C(W_2,W_2))),W_2),W_2)") (parse! "C(W_2,C(C(C(0,C(0,0)),W_2),0))") == .gt
#guard cmp (parse! "C(C(C(W_2,C(W_2,W_2)),W_2),W_2)") (parse! "C(C(C(0,C(0,W_2)),W_2),0)") == .gt
#guard cmp (parse! "C(0,C(C(C(W_2,C(W_2,W_2)),W_2),0))") (parse! "C(C(0,C(0,C(0,0))),W)") == .gt
#guard cmp (parse! "C(W_2,C(C(C(0,C(W_2,W_2)),W_2),W_2))") (parse! "C(C(0,C(0,C(W,W_2))),W_2)") == .gt
#guard cmp (parse! "C(C(C(C(0,W_2),0),C(W_2,W_2)),W_2)") (parse! "C(C(0,C(C(0,C(W_2,W_2)),0)),0)") == .gt
#guard cmp (parse! "C(C(C(C(0,C(0,W_2)),0),W_2),W_2)") (parse! "C(0,C(C(0,C(0,W)),W_2))") == .gt
#guard cmp (parse! "C(0,C(W_2,C(W_2,C(W_2,C(W_2,W_2)))))") (parse! "C(C(C(W_2,W_2),C(C(W_2,W_2),W_2)),W_2)") == .lt
#guard cmp (parse! "C(0,C(C(C(W_2,W),W_2),W_2))") (parse! "C(C(0,C(W_2,C(C(0,W_2),W_2))),0)") == .gt
#guard cmp (parse! "C(C(0,0),C(C(0,0),W_2))") (parse! "C(0,C(W_2,C(C(0,C(W_2,W_2)),W_2)))") == .lt
#guard cmp (parse! "C(C(W,0),C(W_2,C(W_2,W_2)))") (parse! "C(0,C(C(C(W,W_2),0),W_2))") == .gt
#guard cmp (parse! "C(C(C(0,C(W_2,W_2)),0),0)") (parse! "C(C(W_2,C(C(0,C(0,W_2)),0)),0)") == .gt
#guard cmp (parse! "C(C(W_2,W_2),C(C(C(0,W_2),W_2),W_2))") (parse! "C(C(0,C(C(0,C(0,0)),0)),W_2)") == .gt
#guard cmp (parse! "C(C(C(0,C(0,C(0,0))),W_2),W_2)") (parse! "C(C(C(0,C(W_2,C(W_2,W_2))),0),W_2)") == .gt
#guard cmp (parse! "C(C(0,0),C(C(C(W_2,W_2),0),0))") (parse! "C(C(0,C(0,C(0,C(0,0)))),0)") == .gt
#guard cmp (parse! "C(C(0,C(0,C(W_2,W))),W_2)") (parse! "C(C(0,C(C(C(W_2,W_2),0),W_2)),W_2)") == .lt
#guard cmp (parse! "W_2") (parse! "C(0,C(C(C(0,C(0,0)),0),0))") == .gt
#guard cmp (parse! "C(C(W,0),C(C(0,W_2),0))") (parse! "C(C(C(0,W),0),W)") == .gt
#guard cmp (parse! "C(C(C(C(W,W_2),W_2),W_2),W_2)") (parse! "C(0,C(C(0,W_2),C(C(0,W_2),W_2)))") == .gt
#guard cmp (parse! "C(0,C(W_2,C(C(W_2,W_2),W_2)))") (parse! "C(0,C(C(C(C(0,W_2),W_2),0),0))") == .gt
#guard cmp (parse! "C(0,C(C(C(0,0),W),W_2))") (parse! "C(0,C(C(0,C(0,W)),W_2))") == .gt
#guard cmp (parse! "C(0,C(0,C(0,0)))") (parse! "C(C(C(0,C(0,0)),0),W)") == .lt
#guard cmp (parse! "C(C(W_2,C(C(0,W_2),0)),W_2)") (parse! "C(C(C(0,C(W_2,W_2)),0),W_2)") == .lt
#guard cmp (parse! "C(C(W_2,C(W_2,W)),W)") (parse! "C(C(C(0,0),W),W_2)") == .lt
#guard cmp (parse! "C(C(C(W_2,C(W_2,C(W_2,W_2))),0),W_2)") (parse! "C(C(C(W_2,W_2),C(C(W_2,W_2),0)),W_2)") == .gt
#guard cmp (parse! "C(C(0,C(0,C(0,W))),0)") (parse! "C(C(C(0,C(C(0,0),W_2)),0),0)") == .lt
#guard cmp (parse! "C(C(0,W_2),C(C(W,W_2),W_2))") (parse! "C(C(W,C(C(W_2,W_2),0)),W_2)") == .gt
#guard cmp (parse! "C(C(C(0,C(W,0)),W_2),0)") (parse! "C(0,C(C(W_2,W),W_2))") == .lt
#guard cmp (parse! "C(C(W_2,C(C(W_2,C(W_2,W_2)),0)),W_2)") (parse! "C(C(C(C(0,0),0),W),0)") == .gt
#guard cmp (parse! "C(0,C(0,C(0,C(C(W_2,W_2),0))))") (parse! "C(C(0,C(W_2,C(C(0,W_2),0))),0)") == .gt
#guard cmp (parse! "C(W_2,C(C(0,C(W_2,C(W_2,W_2))),W_2))") (parse! "C(C(C(C(C(0,0),W_2),W_2),W_2),0)") == .gt
#guard cmp (parse! "C(0,C(C(0,C(C(0,W_2),W_2)),0))") (parse! "C(C(C(0,W),W),W_2)") == .lt
#guard cmp (parse! "C(W_2,C(C(C(0,C(W_2,W_2)),W_2),0))") (parse! "C(C(W_2,W_2),C(C(W_2,W_2),W_2))") == .lt
#guard cmp (parse! "C(C(0,C(0,C(W_2,W))),0)") (parse! "C(0,C(C(0,0),C(W,W_2)))") == .lt
#guard cmp (parse! "C(0,C(0,C(C(C(0,0),0),0)))") (parse! "C(0,C(W_2,C(C(0,C(W_2,W_2)),0)))") == .lt
#guard cmp (parse! "C(W,C(C(W_2,W_2),W_2))") (parse! "C(C(0,0),C(C(C(0,W_2),0),W_2))") == .gt
#guard cmp (parse! "C(0,C(C(0,C(C(0,W_2),W_2)),W_2))") (parse! "C(0,C(0,C(C(0,C(0,0)),W_2)))") == .gt
#guard cmp (parse! "C(C(W_2,W_2),0)") (parse! "C(W,C(W_2,C(C(0,W_2),0)))") == .gt
#guard cmp (parse! "C(C(C(0,W_2),0),C(C(0,W_2),W_2))") (parse! "C(C(0,C(0,C(0,C(W_2,W_2)))),0)") == .gt
#guard cmp (parse! "C(C(C(0,0),W),0)") (parse! "C(0,C(C(0,C(W_2,W_2)),W_2))") == .lt
#guard cmp (parse! "C(C(C(C(C(0,0),W_2),0),W_2),W_2)") (parse! "C(C(0,C(C(0,C(0,0)),W_2)),0)") == .gt
#guard cmp (parse! "C(0,C(0,C(0,C(0,C(0,W_2)))))") (parse! "C(C(C(C(0,0),0),W_2),W_2)") == .lt
#guard cmp (parse! "C(C(0,C(W,0)),C(W_2,W_2))") (parse! "C(C(C(0,0),C(W_2,W_2)),0)") == .gt
#guard cmp (parse! "C(C(C(C(C(0,W_2),W_2),0),W_2),0)") (parse! "C(C(W_2,W_2),C(C(W_2,W_2),W_2))") == .lt
#guard cmp (parse! "C(0,C(C(C(0,C(W_2,W_2)),W_2),W_2))") (parse! "C(W,C(C(W_2,C(W_2,W_2)),0))") == .gt
#guard cmp (parse! "C(0,C(C(W,0),C(W_2,W_2)))") (parse! "C(C(C(C(0,W_2),0),W_2),0)") == .gt
#guard cmp (parse! "C(0,C(C(0,C(C(W_2,W_2),W_2)),W_2))") (parse! "C(0,C(C(W_2,C(C(W_2,W_2),0)),W_2))") == .gt
#guard cmp (parse! "C(W_2,C(C(C(0,C(0,0)),W_2),0))") (parse! "C(C(C(C(0,C(0,W_2)),W_2),W_2),0)") == .lt
#guard cmp (parse! "C(C(C(C(W_2,C(W_2,W_2)),W_2),0),0)") (parse! "C(C(C(W_2,C(W_2,C(W_2,W_2))),0),0)") == .gt
#guard cmp (parse! "C(C(0,0),0)") (parse! "C(0,C(C(W,C(W_2,W_2)),0))") == .lt
#guard cmp (parse! "C(C(C(0,C(0,C(W_2,W_2))),W_2),W_2)") (parse! "C(0,C(C(0,0),W_2))") == .gt
#guard cmp (parse! "C(0,C(0,C(C(C(0,0),W_2),0)))") (parse! "C(C(0,C(0,C(C(0,0),W_2))),W_2)") == .lt
#guard cmp (parse! "C(C(W_2,W_2),C(C(C(W_2,W_2),W_2),0))") (parse! "C(C(C(0,W_2),0),0)") == .gt
#guard cmp (parse! "C(C(0,C(C(W,W_2),W_2)),0)") (parse! "C(0,C(C(C(0,W),0),W_2))") == .lt
#guard cmp (parse! "C(W_2,C(C(C(C(W_2,W_2),0),W_2),0))") (parse! "C(C(C(0,0),W),W_2)") == .lt
#guard cmp (parse! "C(C(C(C(C(W_2,W_2),0),0),W_2),0)") (parse! "C(C(C(C(0,0),0),0),W_2)") == .lt
#guard cmp (parse! "C(0,C(0,C(0,C(0,C(W_2,W_2)))))") (parse! "C(W_2,C(C(C(0,0),W_2),W_2))") == .lt
#guard cmp (parse! "C(0,C(C(C(0,C(0,0)),W_2),W_2))") (parse! "C(C(C(C(0,W_2),W_2),0),0)") == .gt
#guard cmp (parse! "C(W_2,C(C(0,C(C(0,0),W_2)),0))") (parse! "C(C(C(C(0,C(0,0)),0),W_2),0)") == .lt
#guard cmp (parse! "C(C(C(W_2,C(C(0,W_2),W_2)),0),W_2)") (parse! "C(C(C(C(C(0,0),0),W_2),0),0)") == .gt
#guard cmp (parse! "C(W,C(C(0,C(0,W_2)),0))") (parse! "C(C(C(0,W),W_2),0)") == .lt
#guard cmp (parse! "C(W,C(W_2,C(C(W_2,W_2),W_2)))") (parse! "C(0,C(C(0,0),C(C(0,W_2),0)))") == .gt
#guard cmp (parse! "C(0,C(C(0,C(0,C(0,W_2))),W_2))") (parse! "C(C(C(0,0),W_2),W_2)") == .lt
#guard cmp (parse! "C(C(W_2,C(C(C(0,0),W_2),W_2)),0)") (parse! "C(C(0,C(C(W_2,W),W_2)),0)") == .gt
#guard cmp (parse! "C(0,C(0,C(C(C(0,0),0),W_2)))") (parse! "C(C(C(C(0,0),0),W),W_2)") == .lt
#guard cmp (parse! "C(C(0,0),C(C(0,C(0,W_2)),0))") (parse! "C(0,W_2)") == .lt
#guard cmp (parse! "C(C(C(C(C(0,W_2),W_2),0),W_2),0)") (parse! "C(C(C(0,C(0,C(0,0))),0),W_2)") == .lt
#guard cmp (parse! "C(C(0,0),C(C(0,C(0,W_2)),W_2))") (parse! "C(W_2,C(W_2,W))") == .gt
#guard cmp (parse! "C(C(0,0),C(C(0,W_2),0))") (parse! "C(C(C(0,0),W),W)") == .gt
#guard cmp (parse! "C(C(W,C(C(0,W_2),W_2)),W_2)") (parse! "C(C(C(C(0,0),C(W_2,W_2)),W_2),W_2)") == .lt
#guard cmp (parse! "C(C(W_2,C(W_2,W)),0)") (parse! "C(C(0,C(0,C(W_2,W_2))),W_2)") == .lt
#guard cmp (parse! "C(C(C(C(W_2,C(W_2,W_2)),0),W_2),0)") (parse! "C(C(C(0,C(C(W_2,W_2),W_2)),W_2),0)") == .lt
#guard cmp (parse! "C(0,C(0,C(W_2,W_2)))") (parse! "C(C(C(0,C(0,C(0,0))),0),W_2)") == .gt
#guard cmp (parse! "C(0,C(0,C(W_2,C(C(W_2,W_2),W_2))))") (parse! "C(C(C(C(W_2,C(W_2,W_2)),W_2),W_2),W_2)") == .lt
#guard cmp (parse! "C(C(W_2,C(C(W_2,W_2),W_2)),W_2)") (parse! "C(0,C(C(C(0,0),W),0))") == .gt
#guard cmp (parse! "C(C(C(W_2,C(C(W_2,W_2),0)),0),W_2)") (parse! "C(C(C(0,C(0,0)),0),W_2)") == .gt
#guard cmp (parse! "C(C(C(C(0,C(0,0)),0),W_2),W_2)") (parse! "C(C(0,0),C(C(0,0),W_2))") == .gt
#guard cmp (parse! "C(0,C(W,C(W,0)))") (parse! "C(0,C(C(C(W_2,C(W_2,W_2)),W_2),W_2))") == .lt
#guard cmp (parse! "C(0,C(0,C(W_2,C(W_2,W))))") (parse! "C(0,C(0,C(W,W_2)))") == .lt
#guard cmp (parse! "C(C(C(W_2,W),C(W_2,W_2)),0)") (parse! "C(C(C(C(0,C(0,0)),0),0),0)") == .gt
#guard cmp (parse! "C(C(W_2,W_2),C(C(C(0,W_2),W_2),W_2))") (parse! "C(C(C(W,0),W_2),W_2)") == .gt
#guard cmp (parse! "C(C(0,C(W_2,C(W_2,W_2))),W_2)") (parse! "C(C(0,0),C(C(0,W_2),0))") == .gt
#guard cmp (parse! "C(C(0,C(C(0,C(0,0)),0)),0)") (parse! "C(C(W_2,C(W_2,W)),W_2)") == .lt
#guard cmp (parse! "C(C(C(C(C(0,W_2),0),W_2),0),0)") (parse! "C(C(0,C(C(C(0,0),0),W_2)),0)") == .lt
#guard cmp (parse! "C(0,C(C(0,C(C(0,0),W_2)),W_2))") (parse! "C(C(0,0),C(C(C(0,0),W_2),0))") == .gt
#guard cmp (parse! "C(C(W,C(C(0,W_2),0)),0)") (parse! "C(C(W_2,C(C(W_2,C(W_2,W_2)),W_2)),W_2)") == .lt
#guard cmp (parse! "C(C(0,C(C(0,W),W_2)),0)") (parse! "C(C(C(0,0),W_2),C(C(W_2,W_2),W_2))") == .lt
#guard cmp (parse! "C(C(C(0,W),W),0)") (parse! "C(C(C(0,C(C(0,0),0)),W_2),0)") == .lt
#guard cmp (parse! "C(C(C(C(W_2,W_2),0),C(W_2,W_2)),0)") (parse! "C(C(C(0,C(C(0,W_2),0)),W_2),W_2)") == .lt
#guard cmp (parse! "C(C(C(W_2,C(C(0,W_2),0)),W_2),0)") (parse! "C(C(0,C(C(C(0,0),0),W_2)),0)") == .gt
#guard cmp (parse! "C(C(0,C(C(0,W_2),W_2)),W_2)") (parse! "C(C(0,0),C(C(W_2,W_2),W_2))") == .gt
#guard cmp (parse! "C(C(0,0),C(W_2,C(W_2,C(W_2,W_2))))") (parse! "C(C(0,C(W_2,C(C(W_2,W_2),0))),W_2)") == .gt
#guard cmp (parse! "C(C(C(C(0,W_2),W_2),W_2),0)") (parse! "C(0,C(C(0,C(W_2,W)),0))") == .gt
#guard cmp (parse! "C(W_2,C(W_2,W_2))") (parse! "C(C(C(0,C(0,C(W_2,W_2))),W_2),0)") == .gt
#guard cmp (parse! "C(C(0,W_2),C(C(0,C(W_2,W_2)),0))") (parse! "C(C(0,C(C(C(W_2,W_2),0),W_2)),0)") == .gt
#guard cmp (parse! "C(C(0,C(C(C(0,0),0),0)),0)") (parse! "C(W,C(W,W_2))") == .lt
#guard cmp (parse! "C(C(W_2,W_2),C(C(W_2,W_2),W_2))") (parse! "C(C(C(0,C(W_2,W)),0),W_2)") == .gt
#guard cmp (parse! "C(C(C(0,W_2),0),C(W_2,W_2))") (parse! "C(W_2,C(C(0,W_2),C(C(W_2,W_2),0)))") == .gt
#guard cmp (parse! "C(C(C(C(W_2,W_2),0),W_2),0)") (parse! "C(C(0,0),C(W,W_2))") == .lt
#guard cmp (parse! "C(C(C(0,0),C(W_2,W)),0)") (parse! "C(W_2,C(C(C(W,W_2),W_2),0))") == .lt
#guard cmp (parse! "C(C(C(C(C(0,W_2),W_2),0),0),W_2)") (parse! "C(0,C(C(C(W,W_2),W_2),0))") == .gt
#guard cmp (parse! "C(0,C(C(0,C(0,C(0,W_2))),W_2))") (parse! "C(C(W_2,C(C(C(W_2,W_2),W_2),0)),W_2)") == .gt
#guard cmp (parse! "C(0,C(C(0,C(0,W_2)),W_2))") (parse! "C(C(0,0),C(C(W,W_2),0))") == .gt
#guard cmp (parse! "C(C(C(C(0,W_2),0),0),C(W_2,W_2))") (parse! "C(C(C(C(W_2,W),W_2),W_2),0)") == .gt
#guard cmp (parse! "C(C(0,C(0,C(C(0,0),W_2))),W_2)") (parse! "C(0,C(C(C(C(W_2,W_2),W_2),0),W_2))") == .gt
#guard cmp (parse! "C(C(0,W_2),C(C(0,C(0,W_2)),0))") (parse! "C(C(0,W),C(W_2,W_2))") == .lt
#guard cmp (parse! "C(0,C(C(0,C(C(0,W_2),0)),0))") (parse! "C(C(W_2,C(C(W,W_2),0)),W_2)") == .lt
#guard cmp (parse! "C(C(W,W_2),C(C(W_2,W_2),W_2))") (parse! "C(0,C(0,C(C(W,W_2),0)))") == .gt
#guard cmp (parse! "C(C(W_3,W_2),C(W_3,C(W_3,W_3)))") (parse! "C(C(C(C(0,0),W_3),W_3),0)") == .gt
#guard cmp (parse! "C(C(0,C(C(C(0,0),W_3),0)),W_3)") (parse! "C(0,C(0,C(0,C(0,C(W_3,W_3)))))") == .lt
#guard cmp (parse! "C(0,C(0,C(C(C(W_3,W_3),0),0)))") (parse! "C(0,C(W_3,C(C(W_3,C(W_3,W_3)),W_3)))") == .lt
#guard cmp (parse! "C(W_3,C(W_3,C(C(W_2,W_3),0)))") (parse! "C(C(0,0),C(C(C(0,0),0),0))") == .gt
#guard cmp (parse! "C(C(W_3,W_2),C(C(W_3,W_3),W_3))") (parse! "C(C(W_2,C(W_3,W_3)),W_3)") == .lt
#guard cmp (parse! "C(C(C(0,C(C(W_3,W_3),W_3)),W_3),W_3)") (parse! "C(W_2,C(C(C(0,0),W_3),W_3))") == .gt
#guard cmp (parse! "C(C(W_3,C(C(C(0,W_3),W_3),0)),0)") (parse! "C(W_3,C(C(0,W_3),0))") == .lt
#guard cmp (parse! "C(C(C(W_2,W_3),0),W_2)") (parse! "C(C(C(C(0,C(0,W_3)),0),0),0)") == .gt
#guard cmp (parse! "C(C(C(0,C(0,W_2)),W_3),0)") (parse! "C(C(C(0,0),C(C(0,0),W_3)),W_3)") == .lt
#guard cmp (parse! "C(0,C(0,C(C(0,C(W_3,W_3)),0)))") (parse! "C(0,W_3)") == .lt
#guard cmp (parse! "C(C(0,C(C(0,W_3),W_3)),0)") (parse! "C(C(C(C(0,0),W_2),W_3),W_3)") == .lt
#guard cmp (parse! "C(0,C(C(C(C(W_3,W_3),0),W_3),W_3))") (parse! "C(C(0,W_3),C(C(C(0,0),W_3),W_3))") == .gt
#guard cmp (parse! "C(0,C(C(0,C(W_3,W_3)),W_3))") (parse! "C(C(0,W_3),C(C(W_3,W_3),0))") == .gt
#guard cmp (parse! "C(C(C(0,W_3),0),C(C(W_3,W_3),W_3))") (parse! "C(0,C(C(W_3,W_2),W_3))") == .gt
#guard cmp (parse! "C(W_3,C(C(W_3,C(W_3,C(W_3,W_3))),0))") (parse! "C(0,C(C(0,W_2),0))") == .gt
#guard cmp (parse! "C(C(0,C(W_3,C(C(0,W_3),W_3))),0)") (parse! "W_2") == .gt
#guard cmp (parse! "C(C(C(C(W_3,W_3),0),C(W_3,W_3)),W_3)") (parse! "C(W_3,C(C(W_3,W_3),C(C(W_3,W_3),0)))") == .gt
#guard cmp (parse! "C(C(C(0,C(W_3,W_3)),0),W_3)") (parse! "C(C(C(0,C(C(0,0),W_3)),0),0)") == .gt
#guard cmp (parse! "C(C(C(W_3,W_3),C(C(W_3,W_3),W_3)),W_3)") (parse! "C(C(C(C(W_3,C(W_3,W_3)),0),0),W_3)") == .gt
#guard cmp (parse! "C(0,C(W_3,C(C(W_3,W_3),W_3)))") (parse! "C(C(C(0,C(C(0,0),W_3)),0),0)") == .gt
#guard cmp (parse! "C(C(W_3,C(W_3,C(C(0,W_3),W_3))),W_3)") (parse! "C(W_2,C(W_2,C(W_3,W_3)))") == .gt
#guard cmp (parse! "C(W_3,C(C(W_2,W_3),0))") (parse! "C(C(C(W_3,W_2),0),C(W_3,W_3))") == .lt
#guard cmp (parse! "C(C(0,C(0,0)),0)") (parse! "C(0,C(C(C(0,W_3),0),C(W_3,W_3)))") == .lt
#guard cmp (parse! "C(C(C(C(C(W_3,W_3),0),0),0),W_3)") (parse! "C(0,C(C(C(C(0,0),0),0),0))") == .gt
#guard cmp (parse! "C(C(C(W_3,W_2),W_3),0)") (parse! "C(C(C(W_2,C(W_3,W_3)),W_3),W_3)") == .lt
#guard cmp (parse! "C(C(C(W_3,W_3),0),W_2)") (parse! "C(0,C(0,C(W_2,W_3)))") == .lt
#guard cmp (parse! "C(0,C(0,C(C(0,W_3),W_3)))") (parse! "C(0,C(0,C(C(C(0,0),W_3),0)))") == .gt
#guard cmp (parse! "C(C(0,C(W_3,C(W_3,C(W_3,W_3)))),0)") (parse! "C(C(C(C(C(0,0),W_3),0),0),W_3)") == .lt
#guard cmp (parse! "C(C(0,0),C(C(C(0,0),W_3),W_3))") (parse! "C(C(0,C(C(W_3,W_3),W_3)),W_3)") == .lt
#guard cmp (parse! "C(C(W_3,C(C(0,C(0,W_3)),W_3)),W_3)") (parse! "C(W_3,C(W_3,C(C(W_2,W_3),W_3)))") == .gt
#guard cmp (parse! "C(C(C(C(C(0,0),W_3),0),0),W_3)") (parse! "C(C(C(0,C(C(0,W_3),0)),0),W_3)") == .gt
#guard cmp (parse! "C(C(C(0,C(C(0,W_3),0)),W_3),0)") (parse! "C(C(C(C(0,W_3),W_3),0),W_2)") == .gt
#guard cmp (parse! "C(0,C(C(C(C(0,W_3),W_3),W_3),W_3))") (parse! "C(C(C(0,0),W_3),W_3)") == .gt
#guard cmp (parse! "C(C(W_2,W_2),C(W_3,W_3))") (parse! "C(W_2,W_3)") == .gt
#guard cmp (parse! "C(C(C(C(0,W_2),0),W_3),W_3)") (parse! "C(C(C(0,W_3),C(C(W_3,W_3),0)),0)") == .gt
#guard cmp (parse! "C(C(C(0,C(0,W_3)),0),W_2)") (parse! "C(0,C(C(W_3,C(W_3,C(W_3,W_3))),W_3))") == .lt
#guard cmp (parse! "C(0,C(0,C(W_3,C(C(W_3,W_3),W_3))))") (parse! "C(C(C(W_3,W_3),C(C(W_3,W_3),0)),W_3)") == .gt
#guard cmp (parse! "C(C(0,C(0,C(C(0,W_3),0))),0)") (parse! "C(C(0,C(0,C(C(0,W_3),W_3))),0)") == .lt
#guard cmp (parse! "C(C(W_2,C(C(W_3,W_3),0)),0)") (parse! "C(C(C(0,C(0,W_3)),0),W_3)") == .lt
#guard cmp (parse! "C(C(C(C(0,W_2),W_3),0),W_3)") (parse! "C(0,C(W_3,C(C(0,W_3),W_3)))") == .lt
#guard cmp (parse! "C(0,C(0,C(C(0,C(W_3,W_3)),W_3)))") (parse! "C(C(C(0,0),C(W_3,W_2)),W_3)") == .gt
#guard cmp (parse! "C(C(W_3,W_3),C(C(0,C(W_3,W_3)),0))") (parse! "C(C(C(0,W_3),0),W_2)") == .gt
#guard cmp (parse! "C(0,C(C(W_3,C(C(W_3,W_3),0)),0))") (parse! "C(C(C(0,C(0,C(0,0))),0),0)") == .gt
#guard cmp (parse! "C(W_3,C(W_3,C(C(0,C(W_3,W_3)),W_3)))") (parse! "C(C(C(C(W_3,C(W_3,W_3)),0),W_3),0)") == .gt
#guard cmp (parse! "C(C(C(0,0),0),C(W_3,W_3))") (parse! "C(C(0,C(C(0,W_3),0)),W_3)") == .gt
#guard cmp (parse! "C(C(0,C(C(0,0),C(W_3,W_3))),0)") (parse! "C(C(0,0),C(C(0,C(0,0)),0))") == .gt
#guard cmp (parse! "C(C(C(W_2,C(W_3,W_3)),0),W_3)") (parse! "C(C(C(W_3,C(W_3,W_3)),0),0)") == .gt
#guard cmp (parse! "C(C(C(W_3,W_3),W_3),W_3)") (parse! "C(C(C(C(0,W_3),0),C(W_3,W_3)),0)") == .gt
#guard cmp (parse! "C(C(C(C(W_3,W_3),0),C(W_3,W_3)),W_3)") (parse! "C(C(0,0),C(W_3,C(W_3,W_3)))") == .gt
#guard cmp (parse! "C(C(C(C(0,0),W_2),0),0)") (parse! "C(C(C(C(W_3,W_3),0),W_2),W_3)") == .lt
#guard cmp (parse! "C(W_3,C(W_3,C(C(C(0,W_3),W_3),W_3)))") (parse! "C(C(C(W_3,C(W_3,W_3)),0),W_3)") == .gt
#guard cmp (parse! "C(C(C(0,C(0,W_3)),W_3),0)") (parse! "C(C(W_3,C(C(0,W_3),0)),C(W_3,W_3))") == .lt
#guard cmp (parse! "C(C(C(0,0),C(C(0,0),0)),0)") (parse! "C(C(C(0,C(C(W_3,W_3),0)),0),0)") == .lt
#guard cmp (parse! "C(0,C(C(C(W_2,W_3),W_3),W_3))") (parse! "C(C(0,0),C(C(0,C(0,W_3)),0))") == .gt
#guard cmp (parse! "C(C(0,C(0,C(C(W_3,W_3),0))),W_3)") (parse! "C(0,C(C(0,W),W_3))") == .gt
#guard cmp (parse! "C(0,C(C(C(0,0),0),0))") (parse! "C(W_3,C(C(C(C(W_3,W_3),0),W_3),0))") == .lt
#guard cmp (parse! "C(C(C(C(W_3,W_3),W_3),W_3),0)") (parse! "C(C(C(0,C(0,C(W_3,W_3))),W_3),0)") == .gt
#guard cmp (parse! "C(C(W_3,C(C(W_3,W_3),0)),C(W_3,W_3))") (parse! "C(W_3,C(W_3,C(C(W_3,W_3),0)))") == .gt
#guard cmp (parse! "C(C(W,W_3),0)") (parse! "C(C(W_3,W_2),C(W_3,C(W_3,W_3)))") == .lt
#guard cmp (parse! "C(0,C(C(0,C(0,C(0,0))),W_3))") (parse! "C(W_3,C(C(C(W_2,W_3),W_3),0))") == .gt
#guard cmp (parse! "C(C(C(0,W_2),W_3),0)") (parse! "C(W_2,C(C(W_3,W_2),W_3))") == .lt
#guard cmp (parse! "C(C(0,C(0,C(0,C(0,W_3)))),0)") (parse! "C(W_3,C(C(C(C(0,W_3),W_3),W_3),W_3))") == .lt
#guard cmp (parse! "C(W_2,C(C(0,W_3),0))") (parse! "C(C(C(C(C(0,0),W_3),0),W_3),W_3)") == .lt
#guard cmp (parse! "C(0,C(C(0,C(C(0,W_3),W_3)),W_3))") (parse! "C(C(0,W_3),C(C(W_3,W_3),0))") == .gt
#guard cmp (parse! "C(C(0,C(0,C(0,W_2))),0)") (parse! "C(0,C(W_3,C(C(W_2,W_3),0)))") == .lt
#guard cmp (parse! "C(W_3,C(C(C(0,C(W_3,W_3)),W_3),0))") (parse! "C(C(W_2,C(C(W_3,W_3),W_3)),W_3)") == .lt
#guard cmp (parse! "C(0,C(C(C(C(W_3,W_3),0),W_3),W_3))") (parse! "C(C(C(C(W_3,W_3),0),C(W_3,W_3)),W_3)") == .lt
#guard cmp (parse! "C(C(W_3,C(C(W_2,W_3),0)),W_3)") (parse! "C(0,C(C(0,0),C(C(0,0),0)))") == .gt
#guard cmp (parse! "C(0,C(C(C(W_2,W_3),0),W_3))") (parse! "C(C(C(0,0),0),C(C(0,W_3),W_3))") == .lt
#guard cmp (parse! "C(0,C(0,W))") (parse! "C(C(0,C(C(C(0,W_3),0),W_3)),W_3)") == .lt
#guard cmp (parse! "C(W_3,C(C(C(W_3,W_3),W_3),W_3))") (parse! "C(C(0,0),C(C(0,C(0,0)),0))") == .gt
#guard cmp (parse! "C(C(W_3,C(C(W_3,W_3),0)),W_2)") (parse! "C(C(0,C(C(W_3,W_3),0)),W_3)") == .lt
#guard cmp (parse! "C(C(C(C(0,C(W_3,W_3)),0),W_3),W_3)") (parse! "C(C(C(C(0,0),0),C(W_3,W_3)),W_3)") == .lt
#guard cmp (parse! "C(C(C(C(W_3,W_3),0),W_2),W_3)") (parse! "C(0,C(0,C(C(0,W_3),W_3)))") == .lt
#guard cmp (parse! "C(C(0,C(C(C(W_3,W_3),0),W_3)),0)") (parse! "C(C(0,C(C(W_3,C(W_3,W_3)),W_3)),W_3)") == .lt
#guard cmp (parse! "C(C(W_2,C(W_3,C(W_3,W_3))),W_3)") (parse! "C(C(0,0),C(C(0,W_3),0))") == .gt
#guard cmp (parse! "C(C(C(0,C(W_3,C(W_3,W_3))),W_3),W_3)") (parse! "C(C(W,0),W_3)") == .gt
#guard cmp (parse! "C(W_2,C(W_2,W_3))") (parse! "C(C(C(W_3,C(C(W_3,W_3),0)),W_3),0)") == .gt
#guard cmp (parse! "C(W_2,C(C(C(0,0),W_3),0))") (parse! "C(W_3,C(W_3,C(W_3,C(W_3,C(W_3,W_3)))))") == .lt
#guard cmp (parse! "C(C(C(W_3,C(W_3,W_3)),0),W_3)") (parse! "C(C(C(C(C(W_3,W_3),0),W_3),W_3),0)") == .gt
#guard cmp (parse! "C(C(C(C(0,W_3),0),0),C(W_3,W_3))") (parse! "C(0,C(C(0,C(0,0)),W_3))") == .gt
#guard cmp (parse! "C(C(C(C(W_3,W_3),W_3),W_3),W_3)") (parse! "C(0,C(W_3,C(C(0,C(0,W_3)),W_3)))") == .gt
#guard cmp (parse! "C(C(C(0,C(C(0,W_3),0)),W_3),W_3)") (parse! "C(W_2,C(C(0,W_3),W_3))") == .gt
#guard cmp (parse! "C(W_3,C(W_3,C(W_3,W_2)))") (parse! "C(W_3,C(W_3,C(C(W_3,C(W_3,W_3)),W_3)))") == .lt
#guard cmp (parse! "C(W,C(C(0,W_3),0))") (parse! "C(C(0,C(0,C(C(0,0),0))),W_3)") == .lt
#guard cmp (parse! "C(C(C(0,W_2),0),W_2)") (parse! "C(C(C(W_3,C(W_3,C(W_3,W_3))),W_3),0)") == .lt
#guard cmp (parse! "C(C(0,C(C(C(0,0),W_3),0)),W_3)") (parse! "C(0,C(C(C(0,C(0,W_3)),0),0))") == .gt
#guard cmp (parse! "C(C(W_3,C(C(0,W_3),W_3)),0)") (parse! "C(0,C(0,C(C(0,W_3),0)))") == .gt
#guard cmp (parse! "C(C(C(W_3,C(C(0,W_3),W_3)),W_3),0)") (parse! "C(C(0,C(C(C(W_3,W_3),0),W_3)),0)") == .gt
#guard cmp (parse! "C(C(0,C(C(0,C(0,W_3)),W_3)),0)") (parse! "C(0,C(C(W_2,C(W_3,W_3)),0))") == .gt
#guard cmp (parse! "C(W_3,C(C(W_2,C(W_3,W_3)),0))") (parse! "C(0,C(C(C(C(0,W_3),0),W_3),0))") == .gt
#guard cmp (parse! "C(C(0,C(C(0,C(0,0)),0)),0)") (parse! "C(C(0,C(0,C(0,W_3))),0)") == .lt
#guard cmp (parse! "C(C(C(0,C(W_3,W_3)),0),W_2)") (parse! "C(C(W_3,C(W_3,C(W_3,W_3))),W_3)") == .lt
#guard cmp (parse! "C(C(C(C(0,C(0,0)),W_3),W_3),W_3)") (parse! "C(0,C(C(W_3,C(C(W_3,W_3),0)),W_3))") == .gt
#guard cmp (parse! "C(0,C(C(C(C(0,W_3),W_3),0),W_3))") (parse! "C(0,C(W_2,C(W_3,C(W_3,W_3))))") == .lt
#guard cmp (parse! "C(0,C(0,C(W_2,W_2)))") (parse! "C(C(C(0,W_3),C(C(0,W_3),W_3)),W_3)") == .lt
#guard cmp (parse! "C(C(C(C(W_3,W_2),0),W_3),0)") (parse! "C(C(0,C(0,0)),C(C(W_3,W_3),W_3))") == .lt
#guard cmp (parse! "C(C(C(0,C(W_3,W_2)),W_3),0)") (parse! "C(0,C(0,C(C(0,W_2),W_3)))") == .lt
#guard cmp (parse! "C(C(C(0,0),C(W_2,W_3)),W_3)") (parse! "C(C(C(0,W_2),C(W_3,W_3)),0)") == .gt
#guard cmp (parse! "C(C(C(0,C(C(W_3,W_3),W_3)),0),W_3)") (parse! "C(C(0,C(0,0)),C(W_3,W_3))") == .lt
#guard cmp (parse! "C(W_3,C(C(0,W_3),0))") (parse! "C(C(C(C(0,0),W_3),0),0)") == .gt
#guard cmp (parse! "C(C(W_3,W_2),C(W_3,C(W_3,W_3)))") (parse! "C(C(0,C(W_3,W_2)),W_3)") == .gt
#guard cmp (parse! "C(C(W_3,C(C(C(0,W_3),W_3),W_3)),W_3)") (parse! "C(C(0,C(C(C(0,W_3),0),W_3)),0)") == .gt
#guard cmp (parse! "C(0,C(W_3,C(W_3,C(W_3,W_2))))") (parse! "C(C(W_3,C(C(C(W_3,W_3),W_3),W_3)),0)") == .lt
#guard cmp (parse! "C(C(C(0,0),C(C(0,0),0)),W_3)") (parse! "C(C(0,C(0,W_3)),0)") == .gt
#guard cmp (parse! "C(0,C(C(0,0),C(C(0,W_3),W_3)))") (parse! "C(0,C(0,C(0,C(C(W_3,W_3),W_3))))") == .lt
#guard cmp (parse! "C(C(0,C(C(C(0,0),0),W_3)),0)") (parse! "C(W_3,C(W_3,C(W_3,C(C(W_3,W_3),0))))") == .lt
#guard cmp (parse! "C(C(W_3,C(C(0,C(W_3,W_3)),W_3)),0)") (parse! "C(C(0,0),C(C(C(0,0),W_3),W_3))") == .lt
#guard cmp (parse! "C(W_2,C(W_3,C(C(0,W_3),0)))") (parse! "C(0,C(W_3,C(C(W_3,W_3),0)))") == .lt
#guard cmp (parse! "C(C(C(0,C(W_3,C(W_3,W_3))),W_3),0)") (parse! "C(0,C(C(C(C(0,W_3),W_3),W_3),W_3))") == .lt
#guard cmp (parse! "C(0,C(W_2,C(W_2,W_3)))") (parse! "C(C(W_3,C(C(C(W_3,W_3),W_3),W_3)),0)") == .gt
#guard cmp (parse! "C(0,C(0,C(0,0)))") (parse! "C(0,C(0,C(W_3,W_3)))") == .lt
#guard cmp (parse! "C(W_3,C(C(W_3,C(W_3,W_3)),0))") (parse! "C(C(C(C(W_2,W_3),W_3),0),0)") == .gt
#guard cmp (parse! "C(0,C(C(C(0,0),W_2),0))") (parse! "C(C(0,C(0,C(W_2,W_3))),W_3)") == .lt
#guard cmp (parse! "C(C(0,W_3),C(C(C(0,0),W_3),0))") (parse! "C(0,C(0,C(0,C(C(0,0),W_3))))") == .lt
#guard cmp (parse! "C(C(W,0),C(W_3,W_3))") (parse! "C(C(0,C(C(W_3,C(W_3,W_3)),0)),W_3)") == .gt
#guard cmp (parse! "C(C(W_3,W_2),W_3)") (parse! "C(C(C(C(W_3,W_3),0),0),0)") == .gt
#guard cmp (parse! "C(W_3,C(C(C(0,C(0,0)),W_3),0))") (parse! "C(C(W_3,C(W_3,C(W_3,C(W_3,W_3)))),W_3)") == .lt
#guard cmp (parse! "C(C(C(C(0,W_3),0),C(W_3,W_3)),0)") (parse! "C(C(0,W_3),C(C(0,C(W_3,W_3)),W_3))") == .lt
#guard cmp (parse! "C(W_3,C(W_3,C(W_3,C(C(0,W_3),W_3))))") (parse! "C(0,C(C(C(0,W_3),0),W_3))") == .gt
#guard cmp (parse! "C(C(C(C(0,0),W_2),W_3),0)") (parse! "C(C(0,C(0,W_2)),C(W_3,W_3))") == .lt
#guard cmp (parse! "C(C(C(W_2,C(W_3,W_3)),W_3),W_3)") (parse! "C(0,C(W,0))") == .gt
#guard cmp (parse! "C(0,C(C(0,C(C(W_3,W_3),W_3)),0))") (parse! "C(C(0,C(C(W_3,W_2),0)),0)") == .gt
#guard cmp (parse! "C(C(C(W_2,W_2),W_3),0)") (parse! "C(C(C(W_3,C(C(W_3,W_3),0)),W_3),W_3)") == .lt
#guard cmp (parse! "C(0,C(C(C(C(0,0),0),0),W_3))") (parse! "C(W_2,C(C(0,W_2),W_3))") == .lt
#guard cmp (parse! "C(W_3,C(C(0,W_3),0))") (parse! "C(C(C(0,C(C(W_3,W_3),W_3)),W_3),0)") == .lt
#guard cmp (parse! "C(0,W)") (parse! "C(C(C(C(W_3,W_3),0),C(W_3,W_3)),W_3)") == .lt
#guard cmp (parse! "C(0,C(C(C(0,C(0,0)),0),0))") (parse! "C(C(0,W),C(W_3,W_3))") == .lt
#guard cmp (parse! "C(C(C(0,C(0,W_2)),0),W_3)") (parse! "C(0,C(C(0,C(0,C(W_3,W_3))),0))") == .gt
#guard cmp (parse! "C(C(C(0,0),C(C(0,0),W_3)),0)") (parse! "C(C(C(C(C(0,W_3),W_3),W_3),0),W_3)") == .lt
#guard cmp (parse! "C(C(0,W_3),C(C(C(0,W_3),W_3),0))") (parse! "C(C(C(0,C(C(0,W_3),W_3)),W_3),0)") == .lt
#guard cmp (parse! "C(C(C(0,W_2),W_2),W_3)") (parse! "C(C(0,0),C(C(0,C(0,W_3)),W_3))") == .lt
#guard cmp (parse! "C(C(C(0,W_2),W_3),0)") (parse! "C(C(C(0,W_3),W_3),0)") == .lt
#guard cmp (parse! "C(C(W_3,C(W_3,C(W_3,W_3))),W_3)") (parse! "C(C(C(W_3,W_3),0),C(C(W_3,W_3),W_3))") == .gt
#guard cmp (parse! "C(C(W_3,C(C(0,W_3),0)),0)") (parse! "C(C(C(0,C(0,W_3)),0),W_2)") == .lt
#guard cmp (parse! "C(C(C(0,C(0,W_3)),W_3),0)") (parse! "C(W_3,C(C(C(C(0,W_3),0),W_3),W_3))") == .lt
#guard cmp (parse! "C(C(C(W_3,C(W_3,W_3)),W_3),0)") (parse! "C(C(W_3,C(C(C(W_3,W_3),W_3),0)),0)") == .gt
#guard cmp (parse! "C(W_3,C(W_3,C(C(0,C(0,W_3)),0)))") (parse! "C(C(0,0),C(C(C(0,0),0),W_3))") == .lt
#guard cmp (parse! "C(C(C(0,W_3),0),C(W_3,C(W_3,W_3)))") (parse! "C(C(0,0),W)") == .gt
#guard cmp (parse! "C(C(0,C(0,0)),C(W_2,W_3))") (parse! "C(C(C(C(W_3,W_3),0),0),W_2)") == .gt
#guard cmp (parse! "C(C(C(0,0),C(W_2,W_3)),W_3)") (parse! "C(C(0,0),C(C(0,0),W_2))") == .gt
#guard cmp (parse! "C(C(0,C(C(W_3,W_2),0)),W_3)") (parse! "C(C(C(0,W_3),C(C(W_3,W_3),0)),0)") == .gt
#guard cmp (parse! "C(C(0,C(C(W_3,W_3),0)),W_3)") (parse! "C(C(C(0,0),C(W_3,W_2)),0)") == .gt
#guard cmp (parse! "C(C(W_2,C(C(W_3,W_3),0)),W_3)") (parse! "C(0,C(0,C(0,W_3)))") == .gt
#guard cmp (parse! "C(C(C(0,C(C(0,0),W_3)),W_3),W_3)") (parse! "C(C(C(0,0),C(C(W_3,W_3),0)),W_3)") == .gt
#guard cmp (parse! "C(C(0,C(W_3,C(C(0,W_3),W_3))),0)") (parse! "C(C(C(0,W_3),C(C(W_3,W_3),0)),0)") == .gt
#guard cmp (parse! "C(C(W_3,W_3),C(C(W_3,W_3),W_3))") (parse! "C(C(C(W_3,C(C(0,W_3),0)),0),W_3)") == .gt
#guard cmp (parse! "C(C(0,C(C(W_3,W_3),0)),C(W_3,W_3))") (parse! "C(C(W_3,W_2),C(W_3,W_2))") == .gt
#guard cmp (parse! "C(W_3,C(C(C(W_2,W_3),W_3),0))") (parse! "C(C(C(C(W_3,W_3),0),0),C(W_3,W_3))") == .lt
#guard cmp (parse! "C(0,C(W_2,W))") (parse! "C(0,C(C(C(W_2,W_3),0),0))") == .lt
#guard cmp (parse! "C(C(W_3,C(W_3,C(W_3,W_3))),0)") (parse! "C(0,C(0,C(W,W_3)))") == .lt
#guard cmp (parse! "C(C(W_2,W_3),C(C(W_3,W_3),0))") (parse! "C(0,C(C(C(W_3,W_2),0),0))") == .gt
#guard cmp (parse! "C(C(W_3,W_3),C(C(W_3,C(W_3,W_3)),0))") (parse! "C(C(0,C(C(C(0,0),0),0)),0)") == .gt
#guard cmp (parse! "C(C(C(C(0,W_2),0),W_3),W_3)") (parse! "C(0,C(C(0,0),C(C(0,0),0)))") == .gt
#guard cmp (parse! "C(C(0,C(0,0)),C(C(W_3,W_3),0))") (parse! "C(C(C(W_3,C(C(W_3,W_3),W_3)),0),W_3)") == .lt
#guard cmp (parse! "C(W_3,C(C(C(0,W_3),W_3),W_3))") (parse! "C(C(C(W_3,C(W_3,W_2)),W_3),W_3)") == .gt
#guard cmp (parse! "C(C(C(C(C(0,0),W_3),0),W_3),0)") (parse! "C(W_3,C(W_3,C(C(0,C(W_3,W_3)),0)))") == .lt
#guard cmp (parse! "C(C(0,W_3),C(C(W_3,C(W_3,W_3)),0))") (parse! "C(W_3,C(C(C(0,C(0,0)),W_3),0))") == .gt
#guard cmp (parse! "C(C(0,C(W_2,W_2)),W_3)") (parse! "C(0,C(W_3,C(W_3,C(W_3,W_2))))") == .gt
#guard cmp (parse! "C(C(C(0,C(0,C(0,W_3))),0),0)") (parse! "C(W_2,C(C(W_2,W_3),0))") == .lt
#guard cmp (parse! "C(W_3,C(C(0,C(W_3,W_3)),0))") (parse! "C(C(C(W_3,W_3),C(C(W_3,W_3),W_3)),0)") == .lt
#guard cmp (parse! "C(C(W_3,C(C(W_3,W_3),0)),C(W_3,W_3))") (parse! "C(0,C(C(C(W_3,W_3),0),C(W_3,W_3)))") == .gt
#guard cmp (parse! "C(C(0,W_2),C(W_3,C(W_3,W_3)))") (parse! "C(C(0,W_2),W_3)") == .gt
#guard cmp (parse! "C(0,C(C(0,C(W_3,W_2)),W_3))") (parse! "C(W_2,C(C(C(0,0),W_3),0))") == .gt
#guard cmp (parse! "C(C(C(0,W),W_3),0)") (parse! "C(C(C(C(C(W_3,W_3),0),0),W_3),0)") == .lt
#guard cmp (parse! "C(C(C(0,0),C(C(0,0),W_3)),0)") (parse! "C(C(C(C(0,0),0),C(W_3,W_3)),W_3)") == .lt
#guard cmp (parse! "C(W_3,C(W_3,C(C(C(W_3,W_3),W_3),W_3)))") (parse! "C(C(C(0,C(W_2,W_3)),0),0)") == .gt
#guard cmp (parse! "C(C(C(0,C(0,W_3)),0),W_2)") (parse! "C(C(C(C(0,W_3),0),0),0)") == .gt
#guard cmp (parse! "C(0,C(C(0,W_3),C(C(W_3,W_3),W_3)))") (parse! "C(0,C(0,C(0,W_2)))") == .gt
#guard cmp (parse! "C(C(C(C(W_3,C(W_3,W_3)),0),W_3),0)") (parse! "C(C(0,C(W_3,W_2)),W_2)") == .gt
#guard cmp (parse! "C(C(C(0,W_3),0),W_2)") (parse! "C(W_3,C(W_3,C(W_3,C(C(0,W_3),W_3))))") == .lt
#guard cmp (parse! "C(W_3,C(W_3,C(W_3,W_3)))") (parse! "C(0,C(C(0,C(0,C(W_3,W_3))),W_3))") == .lt
#guard cmp (parse! "C(C(C(C(W_3,C(W_3,W_3)),W_3),0),0)") (parse! "C(C(0,C(C(0,W_3),0)),W_2)") == .lt
#guard cmp (parse! "C(C(0,W_3),C(C(C(0,W_3),W_3),W_3))") (parse! "C(C(C(C(W_2,W_3),0),W_3),W_3)") == .gt
#guard cmp (parse! "C(C(0,C(W_3,C(C(0,W_3),0))),0)") (parse! "C(C(0,0),W_3)") == .lt
#guard cmp (parse! "C(C(C(C(0,0),W_2),0),W_3)") (parse! "C(C(C(C(0,C(0,0)),W_3),W_3),0)") == .gt
#guard cmp (parse! "C(0,C(0,C(C(0,C(0,W_3)),0)))") (parse! "C(W_2,C(C(C(0,W_3),0),W_3))") == .lt
#guard cmp (parse! "C(0,C(0,W_2))") (parse! "C(C(W_2,W_3),C(C(W_3,W_3),0))") == .lt
#guard cmp (parse! "C(W_2,C(C(0,W_3),W_3))") (parse! "C(C(0,0),C(W_2,W_3))") == .gt
#guard cmp (parse! "C(0,C(W_3,C(C(0,C(W_3,W_3)),0)))") (parse! "C(W_3,C(C(0,C(W_2,W_3)),0))") == .gt
#guard cmp (parse! "C(C(0,C(C(0,C(0,W_3)),W_3)),0)") (parse! "C(C(W_2,C(C(W_3,W_3),W_3)),0)") == .lt
#guard cmp (parse! "C(0,C(C(C(C(0,0),W_3),0),0))") (parse! "C(C(C(C(W_3,W_3),0),W_3),0)") == .lt
#guard cmp (parse! "C(C(C(0,0),0),W_2)") (parse! "C(C(C(0,C(C(0,0),W_3)),W_3),W_3)") == .lt
#guard cmp (parse! "C(C(0,W_3),C(C(C(0,0),W_3),0))") (parse! "C(W_3,C(C(0,C(W_3,C(W_3,W_3))),0))") == .lt
#guard cmp (parse! "C(W_3,C(C(0,W_3),C(C(W_3,W_3),W_3)))") (parse! "C(C(C(0,C(0,C(0,0))),0),0)") == .gt
#guard cmp (parse! "C(0,C(0,C(C(0,C(0,0)),0)))") (parse! "C(C(0,C(C(W_3,C(W_3,W_3)),W_3)),0)") == .lt
#guard cmp (parse! "C(C(0,0),C(W_3,W_2))") (parse! "C(C(C(0,W_2),0),W_2)") == .gt
#guard cmp (parse! "C(C(C(C(0,W_2),0),0),W_3)") (parse! "C(C(C(0,C(C(0,0),0)),W_3),0)") == .gt
#guard cmp (parse! "C(C(0,0),C(W_3,W_2))") (parse! "C(C(C(W_3,C(C(0,W_3),0)),W_3),W_3)") == .lt
#guard cmp (parse! "C(0,C(C(C(0,C(0,W_3)),W_3),W_3))") (parse! "C(C(C(C(0,C(0,W_3)),0),0),W_3)") == .gt
#guard cmp (parse! "C(C(W_3,C(C(0,C(W_3,W_3)),W_3)),0)") (parse! "C(C(C(C(W_3,W_3),W_3),0),W_2)") == .gt
#guard cmp (parse! "C(0,W_2)") (parse! "C(C(0,C(W_3,W_2)),0)") == .gt
#guard cmp (parse! "C(0,C(0,C(W_3,C(C(W_3,W_3),W_3))))") (parse! "C(C(W_3,W_3),C(C(C(0,W_3),W_3),W_3))") == .lt
#guard cmp (parse! "C(C(C(0,C(0,W_3)),W_3),0)") (parse! "C(C(C(C(0,C(W_3,W_3)),W_3),0),0)") == .gt
#guard cmp (parse! "C(0,C(0,C(C(W_2,W_3),W_3)))") (parse! "C(W_2,C(C(W_3,W_3),0))") == .gt
#guard cmp (parse! "C(W_3,W_3)") (parse! "C(0,C(C(0,0),C(C(0,W_3),0)))") == .gt
#guard cmp (parse! "C(0,C(C(0,W_2),W_2))") (parse! "C(W,C(C(0,W_3),0))") == .lt
#guard cmp (parse! "C(0,C(W_3,C(W_3,C(W_3,C(W_3,W_3)))))") (parse! "C(C(0,C(W_3,W_2)),W_3)") == .gt
#guard cmp (parse! "C(W_3,C(W_3,C(C(C(0,W_3),W_3),0)))") (parse! "C(C(0,C(W_3,C(C(0,W_3),0))),W_3)") == .lt
#guard cmp (parse! "C(C(C(0,C(W_3,W_3)),0),W_2)") (parse! "C(C(0,C(C(0,C(0,0)),0)),W_3)") == .lt
#guard cmp (parse! "C(C(C(W_3,C(C(0,W_3),W_3)),W_3),W_3)") (parse! "C(C(0,C(0,C(0,W_3))),0)") == .gt
#guard cmp (parse! "C(C(C(0,0),0),C(W_2,W_3))") (parse! "C(0,C(C(C(C(W_3,W_3),W_3),W_3),0))") == .gt
#guard cmp (parse! "C(C(C(0,C(W_3,W_3)),0),W_3)") (parse! "C(C(0,C(C(C(W_3,W_3),0),0)),0)") == .gt
#guard cmp (parse! "C(C(0,C(C(W_3,C(W_3,W_3)),W_3)),0)") (parse! "C(C(W_3,C(C(W_3,W_3),0)),0)") == .gt
#guard cmp (parse! "C(C(C(C(W_3,W_3),W_3),0),W_2)") (parse! "C(C(C(W_2,C(W_3,W_3)),W_3),W_3)") == .lt
#guard cmp (parse! "C(0,C(C(C(0,C(0,0)),W_3),0))") (parse! "C(C(0,0),C(W_3,W_3))") == .lt
#guard cmp (parse! "C(C(0,C(C(0,0),C(W_3,W_3))),W_3)") (parse! "C(C(0,C(C(C(0,0),W_3),0)),W_3)") == .gt
#guard cmp (parse! "C(C(C(0,W_2),C(W_3,W_3)),W_3)") (parse! "C(0,C(0,C(C(W_3,W_2),0)))") == .gt
#guard cmp (parse! "C(C(C(C(0,0),0),0),0)") (parse! "C(C(0,W),W_3)") == .lt
#guard cmp (parse! "C(C(C(0,W),W_3),0)") (parse! "C(0,C(C(W_3,C(W_3,W_3)),0))") == .lt
#guard cmp (parse! "C(C(0,W_3),C(C(0,C(W_3,W_3)),0))") (parse! "C(C(0,0),C(C(W_3,W_2),W_3))") == .lt
#guard cmp (parse! "C(W_3,C(C(C(0,C(0,W_3)),W_3),0))") (parse! "C(C(0,C(C(0,0),C(W_3,W_3))),W_3)") == .lt
#guard cmp (parse! "C(0,C(0,C(C(0,C(W_3,W_3)),0)))") (parse! "C(0,C(0,C(0,C(0,0))))") == .gt
#guard cmp (parse! "C(C(C(C(W_3,C(W_3,W_3)),W_3),0),W_3)") (parse! "C(W_2,C(W_3,C(W_3,W_3)))") == .lt
#guard cmp (parse! "C(C(C(0,0),W_3),C(C(W_3,W_3),0))") (parse! "C(C(0,W),W_3)") == .lt
#guard cmp (parse! "C(C(C(C(0,0),W_2),0),0)") (parse! "C(C(C(0,0),C(C(0,0),0)),0)") == .gt
#guard cmp (parse! "C(C(0,C(0,C(W_2,W_3))),W_3)") (parse! "C(C(C(C(C(W_3,W_3),0),0),W_3),W_3)") == .gt
#guard cmp (parse! "C(0,C(0,C(C(0,0),C(W_3,W_3))))") (parse! "C(C(C(C(C(0,W_3),W_3),W_3),0),W_3)") == .gt
#guard cmp (parse! "C(C(0,C(0,W_3)),0)") (parse! "C(C(W_3,W_2),W_3)") == .lt
#guard cmp (parse! "C(0,C(C(C(0,C(W_3,W_3)),W_3),W_3))") (parse! "C(W_3,C(W_3,C(W_3,C(C(W_3,W_3),W_3))))") == .gt
#guard cmp (parse! "C(C(C(W_2,W_3),W_3),W_3)") (parse! "C(W,C(C(0,W_3),W_3))") == .gt
#guard cmp (parse! "C(C(C(W_3,C(C(W_3,W_3),W_3)),W_3),W_3)") (parse! "C(C(C(C(0,0),0),C(W_3,W_3)),W_3)") == .gt
#guard cmp (parse! "C(C(C(0,C(0,0)),W_3),0)") (parse! "C(C(0,C(0,C(0,C(0,0)))),0)") == .gt
#guard cmp (parse! "C(C(C(C(W_3,C(W_3,W_3)),0),0),W_3)") (parse! "C(0,C(C(W_3,C(C(W_3,W_3),W_3)),0))") == .gt
#guard cmp (parse! "C(0,C(C(C(C(0,W_3),0),W_3),0))") (parse! "C(C(C(0,W_2),W_2),W_3)") == .lt
#guard cmp (parse! "C(0,C(W_3,W_2))") (parse! "C(W_3,C(C(C(C(0,0),0),W_3),W_3))") == .lt
#guard cmp (parse! "C(C(0,C(C(W_3,W_3),0)),C(W_3,W_3))") (parse! "C(C(C(W_3,C(C(W_3,W_3),W_3)),0),W_3)") == .gt
#guard cmp (parse! "C(0,C(C(C(C(0,0),W_3),0),W_3))") (parse! "C(C(W_3,W_3),C(C(W_3,W_3),W_3))") == .lt
#guard cmp (parse! "C(C(C(0,0),C(C(W_3,W_3),W_3)),0)") (parse! "C(C(W_3,C(C(C(W_3,W_3),W_3),W_3)),0)") == .lt
#guard cmp (parse! "C(0,C(W_3,C(C(0,C(0,W_3)),0)))") (parse! "W_2") == .gt
#guard cmp (parse! "C(C(0,C(W_3,C(W_3,C(W_3,W_3)))),0)") (parse! "C(C(C(W_3,C(C(0,W_3),W_3)),0),0)") == .gt
#guard cmp (parse! "C(C(C(C(0,W_3),W_3),W_3),0)") (parse! "C(C(C(C(C(0,W_3),W_3),0),0),0)") == .gt
#guard cmp (parse! "C(C(C(0,C(0,0)),W_3),W_3)") (parse! "C(0,C(C(C(W_3,W_3),0),W_2))") == .gt
#guard cmp (parse! "C(0,C(0,C(C(C(W_3,W_3),0),0)))") (parse! "C(C(C(C(0,W_3),W_3),W_3),W_3)") == .lt
#guard cmp (parse! "C(C(C(C(W_3,W_2),0),W_3),0)") (parse! "C(C(0,W_2),W_3)") == .lt
#guard cmp (parse! "C(C(C(C(0,C(0,W_3)),W_3),W_3),W_3)") (parse! "C(C(C(C(C(0,W_3),0),W_3),0),W_3)") == .gt
#guard cmp (parse! "C(C(0,0),C(C(C(W_3,W_3),0),0))") (parse! "C(C(C(0,0),C(C(0,0),W_3)),W_3)") == .lt
#guard cmp (parse! "C(C(C(0,C(0,C(0,W_3))),0),0)") (parse! "C(0,C(0,C(0,C(C(0,0),0))))") == .gt
#guard cmp (parse! "C(0,C(0,C(0,C(W_3,C(W_3,W_3)))))") (parse! "C(C(C(0,C(0,W_3)),0),W_2)") == .gt
#guard cmp (parse! "C(C(C(0,C(W_3,W_2)),0),0)") (parse! "C(W_3,C(C(C(W_3,W_2),W_3),0))") == .lt
#guard cmp (parse! "C(C(0,C(C(W_2,W_3),W_3)),0)") (parse! "C(C(C(C(C(W_3,W_3),W_3),W_3),0),0)") == .gt
#guard cmp (parse! "C(0,C(C(W_2,C(W_3,W_3)),W_3))") (parse! "C(C(0,C(C(W_3,C(W_3,W_3)),W_3)),W_3)") == .lt
#guard cmp (parse! "C(C(0,C(0,0)),C(W_3,W_2))") (parse! "C(C(C(C(C(0,0),0),W_3),0),W_3)") == .lt
#guard cmp (parse! "C(C(C(0,C(C(0,0),W_3)),0),W_3)") (parse! "C(C(C(0,0),0),C(C(0,W_3),W_3))") == .lt
#guard cmp (parse! "C(W_2,C(C(C(0,W_3),0),W_3))") (parse! "C(C(C(C(C(0,0),0),W_3),W_3),W_3)") == .lt
#guard cmp (parse! "C(C(0,0),C(C(0,W_2),W_3))") (parse! "C(C(W_3,W_3),C(C(0,C(W_3,W_3)),0))") == .gt
#guard cmp (parse! "C(C(C(0,C(0,W_3)),0),C(W_3,W_3))") (parse! "C(C(W_2,C(W_3,W_2)),W_3)") == .gt
#guard cmp (parse! "C(C(0,0),C(C(C(W_3,W_3),0),0))") (parse! "C(0,C(C(0,C(0,W_3)),W_3))") == .lt
#guard cmp (parse! "C(C(0,C(C(0,W_3),0)),0)") (parse! "C(C(W,W_2),0)") == .gt
#guard cmp (parse! "C(C(C(W_2,W_2),0),0)") (parse! "C(0,C(C(W_3,W_3),C(C(W_3,W_3),W_3)))") == .lt
#guard cmp (parse! "C(0,C(0,0))") (parse! "C(W_3,C(W_3,C(C(C(W_3,W_3),W_3),W_3)))") == .lt
#guard cmp (parse! "C(C(C(C(C(0,W_3),W_3),0),W_3),0)") (parse! "C(C(W_3,W_2),C(W_3,W_3))") == .lt
#guard cmp (parse! "C(W_2,C(C(0,C(0,W_3)),0))") (parse! "C(W_3,C(W_3,C(C(C(0,0),W_3),W_3)))") == .lt
#guard cmp (parse! "C(0,C(0,C(C(C(0,W_3),W_3),0)))") (parse! "C(C(C(C(0,C(0,W_3)),W_3),W_3),0)") == .lt
#guard cmp (parse! "C(C(0,C(C(W_2,W_3),W_3)),0)") (parse! "C(C(0,C(0,C(W_3,W_3))),W_3)") == .lt
#guard cmp (parse! "C(C(C(W_3,W_2),0),W_2)") (parse! "C(C(W_3,C(C(C(W_3,W_3),W_3),W_3)),0)") == .lt
#guard cmp (parse! "C(C(C(0,C(C(0,0),W_3)),W_3),0)") (parse! "C(C(C(0,0),0),W_2)") == .gt
#guard cmp (parse! "C(0,C(C(C(C(0,0),0),W_3),W_3))") (parse! "C(W_2,C(C(0,W_3),W_3))") == .gt
#guard cmp (parse! "C(0,C(W_3,C(W_3,C(C(W_3,W_3),W_3))))") (parse! "C(0,C(W,W_2))") == .gt
#guard cmp (parse! "C(C(W_3,C(W_3,C(C(0,W_3),W_3))),0)") (parse! "C(C(C(0,0),C(C(W_3,W_3),0)),0)") == .gt
#guard cmp (parse! "C(C(C(0,0),0),0)") (parse! "C(0,C(0,C(C(C(W_3,W_3),W_3),W_3)))") == .lt
#guard cmp (parse! "C(W_3,C(C(W_2,C(W_3,W_3)),W_3))") (parse! "C(W,W_3)") == .gt
#guard cmp (parse! "C(W,W)") (parse! "C(C(W_3,C(W_3,W_3)),W_3)") == .lt
#guard cmp (parse! "C(C(C(C(0,W_3),W_3),0),0)") (parse! "C(0,C(C(C(C(W_3,W_3),0),0),W_3))") == .lt
#guard cmp (parse! "C(C(W_3,C(W_3,C(C(0,W_3),0))),W_3)") (parse! "C(0,C(C(0,W_3),0))") == .gt
#guard cmp (parse! "C(C(W_3,W_2),C(C(0,W_3),W_3))") (parse! "C(0,C(C(0,C(0,0)),W_2))") == .gt
#guard cmp (parse! "C(C(C(0,C(0,C(0,0))),W_3),0)") (parse! "C(C(0,C(C(0,C(W_3,W_3)),W_3)),W_3)") == .lt
#guard cmp (parse! "C(W_3,C(W_3,C(W_3,C(W_3,W_2))))") (parse! "C(C(C(C(0,W_2),W_3),W_3),0)") == .lt
#guard cmp (parse! "C(C(C(W_3,C(C(0,W_3),W_3)),0),0)") (parse! "C(C(C(0,C(C(W_3,W_3),0)),W_3),W_3)") == .lt
#guard cmp (parse! "C(C(0,C(W_2,W_2)),0)") (parse! "C(C(0,0),C(W_3,C(C(0,W_3),W_3)))") == .lt
#guard cmp (parse! "C(C(C(W_3,C(C(W_3,W_3),W_3)),W_3),0)") (parse! "C(C(C(C(C(0,0),W_3),W_3),0),0)") == .gt
#guard cmp (parse! "C(C(C(C(W_3,W_2),W_3),W_3),0)") (parse! "C(C(0,W_3),0)") == .gt
#guard cmp (parse! "C(W_3,C(C(C(0,0),W_3),0))") (parse! "C(C(C(C(0,W_3),0),W_2),0)") == .gt
#guard cmp (parse! "C(0,C(C(0,C(C(0,W_3),0)),0))") (parse! "C(W_3,C(C(C(0,W_3),W_3),0))") == .lt
#guard cmp (parse! "C(0,C(W_3,C(C(C(0,W_3),W_3),W_3)))") (parse! "C(C(C(0,0),W_3),C(C(W_3,W_3),W_3))") == .gt
#guard cmp (parse! "C(C(0,W_2),W_2)") (parse! "C(C(W_2,W_3),C(C(W_3,W_3),0))") == .lt
#guard cmp (parse! "C(C(C(C(0,C(0,0)),0),W_3),0)") (parse! "C(C(C(W_3,C(C(W_3,W_3),W_3)),W_3),W_3)") == .lt
#guard cmp (parse! "C(0,C(C(C(0,W_2),0),W_3))") (parse! "C(C(C(C(C(0,0),0),0),W_3),W_3)") == .lt
#guard cmp (parse! "C(C(C(C(0,C(0,W_3)),W_3),0),0)") (parse! "C(C(C(0,C(W_3,W_3)),0),0)") == .gt
#guard cmp (parse! "C(C(C(0,C(0,0)),W_2),0)") (parse! "C(C(0,C(C(0,W_2),0)),W_3)") == .lt
#guard cmp (parse! "C(0,C(C(0,C(0,W_3)),0))") (parse! "C(W_2,W_2)") == .gt
#guard cmp (parse! "C(C(0,C(C(0,0),W_2)),0)") (parse! "C(C(0,C(C(C(0,W_3),0),0)),W_3)") == .lt
#guard cmp (parse! "C(0,C(W_3,C(W_3,W_2)))") (parse! "C(0,C(0,C(C(0,0),W_2)))") == .gt
#guard cmp (parse! "C(C(W_2,W_2),0)") (parse! "C(C(C(C(0,W_3),W_3),0),W_2)") == .lt
#guard cmp (parse! "C(C(C(W_3,W_2),C(W_3,W_3)),W_3)") (parse! "C(C(C(W_3,C(C(0,W_3),0)),W_3),0)") == .gt
#guard cmp (parse! "C(C(W,W_2),0)") (parse! "C(0,C(W_3,C(C(W_2,W_3),W_3)))") == .lt
#guard cmp (parse! "C(C(C(W_3,C(W_3,W_2)),W_3),W_3)") (parse! "C(C(0,C(0,C(C(W_3,W_3),0))),W_3)") == .gt
#guard cmp (parse! "C(C(W,W_3),0)") (parse! "C(C(0,C(0,W_3)),0)") == .gt
#guard cmp (parse! "C(0,C(C(C(W_3,C(W_3,W_3)),0),W_3))") (parse! "C(C(0,C(C(C(W_3,W_3),0),0)),0)") == .gt
#guard cmp (parse! "C(C(C(W_3,C(C(0,W_3),W_3)),0),0)") (parse! "C(C(C(0,C(0,C(W_3,W_3))),0),0)") == .gt
#guard cmp (parse! "C(0,0)") (parse! "C(0,C(C(0,C(0,W_3)),0))") == .lt
#guard cmp (parse! "C(0,C(0,C(0,C(0,0))))") (parse! "C(C(C(0,C(W_2,W_3)),W_3),0)") == .lt
#guard cmp (parse! "C(W_2,C(C(0,C(W_3,W_3)),W_3))") (parse! "C(W_2,C(C(0,W_3),W_3))") == .gt
#guard cmp (parse! "C(C(C(C(C(0,0),0),0),W_3),W_3)") (parse! "C(C(W_3,C(C(C(0,0),W_3),0)),0)") == .gt
#guard cmp (parse! "C(0,C(C(C(0,0),C(W_3,W_3)),0))") (parse! "C(W_2,C(C(C(W_3,W_3),W_3),W_3))") == .lt
#guard cmp (parse! "C(0,C(C(W_3,C(C(0,W_3),W_3)),0))") (parse! "C(C(0,W_3),C(C(W_3,C(W_3,W_3)),W_3))") == .lt
#guard cmp (parse! "C(W_3,C(C(C(C(0,0),0),W_3),W_3))") (parse! "C(W_2,C(W_2,C(W_3,W_3)))") == .gt
#guard cmp (parse! "C(C(0,W_3),W_3)") (parse! "C(C(C(0,W_3),0),W_3)") == .gt
#guard cmp (parse! "C(C(W_3,C(W_3,W_2)),C(W_3,W_3))") (parse! "C(C(0,0),C(C(0,W_2),0))") == .gt
#guard cmp (parse! "C(0,C(0,C(W_3,C(W_3,W_3))))") (parse! "C(C(C(C(W_3,W_3),0),0),W_2)") == .gt
#guard maxBelowN 1 (parse! "C(C(C(C(0,W),0),W),W)") 4 == some (parse! "C(C(C(W,C(W,0)),W),W)")
#guard maxBelowN 1 (parse! "C(C(C(C(0,W),0),W),W)") 5 == some (parse! "C(C(C(W,C(W,C(W,0))),W),W)")
#guard minAboveN 1 (parse! "C(C(C(C(0,W),0),W),W)") 4 == some (parse! "C(C(C(C(W,W),0),W),W)")
#guard maxBelowN 1 (parse! "C(C(0,C(C(W,C(W,W)),0)),W)") 5 == some (parse! "C(0,C(C(C(W,C(W,W)),0),W))")
#guard minAboveN 1 (parse! "C(C(0,C(C(W,C(W,W)),0)),W)") 5 == some (parse! "C(C(W,C(C(W,C(W,W)),0)),W)")
#guard maxBelowN 1 (parse! "C(C(W,0),C(C(C(0,W),W),0))") 5 == some (parse! "C(C(0,0),C(C(C(0,W),W),0))")
#guard minAboveN 1 (parse! "C(C(W,0),C(C(C(0,W),W),0))") 5 == some (parse! "C(W,C(C(C(0,W),W),0))")
#guard maxBelowN 1 (parse! "C(C(C(W,0),C(C(W,W),W)),0)") 5 == some (parse! "C(C(C(0,0),C(C(W,W),W)),0)")
#guard minAboveN 1 (parse! "C(C(C(W,0),C(C(W,W),W)),0)") 5 == some (parse! "C(C(W,C(C(W,W),W)),0)")
#guard maxBelowN 1 (parse! "C(C(C(0,W),0),C(W,C(W,W)))") 5 == some (parse! "C(C(W,C(W,0)),C(W,C(W,W)))")
#guard minAboveN 1 (parse! "C(C(C(0,W),0),C(W,C(W,W)))") 5 == some (parse! "C(C(C(W,W),0),C(W,C(W,W)))")
#guard maxBelowN 1 (parse! "C(W,C(C(W,C(C(W,W),W)),0))") 5 == some (parse! "C(0,C(C(W,C(C(W,W),W)),0))")
#guard minAboveN 1 (parse! "C(W,C(C(W,C(C(W,W),W)),0))") 5 == some (parse! "C(C(0,C(W,C(C(W,W),W))),0)")
#guard maxBelowN 1 (parse! "C(C(W,C(W,0)),W)") 3 == some (parse! "C(C(0,C(W,0)),W)")
#guard maxBelowN 1 (parse! "C(C(W,C(W,0)),W)") 4 == some (parse! "C(C(C(W,0),C(W,0)),W)")
#guard maxBelowN 1 (parse! "C(C(W,C(W,0)),W)") 5 == some (parse! "C(C(C(0,C(W,0)),C(W,0)),W)")
#guard minAboveN 1 (parse! "C(C(W,C(W,0)),W)") 3 == some (parse! "C(C(C(0,W),0),W)")
#guard maxBelowN 1 (parse! "C(C(C(C(C(0,0),W),0),W),W)") 5 == some (parse! "C(C(C(C(0,C(0,W)),0),W),W)")
#guard minAboveN 1 (parse! "C(C(C(C(C(0,0),W),0),W),W)") 5 == some (parse! "C(C(C(C(C(W,0),W),0),W),W)")
#guard maxBelowN 1 (parse! "C(W,C(C(W,C(W,C(W,W))),0))") 5 == some (parse! "C(0,C(C(W,C(W,C(W,W))),0))")
#guard minAboveN 1 (parse! "C(W,C(C(W,C(W,C(W,W))),0))") 5 == some (parse! "C(C(0,C(W,C(W,C(W,W)))),0)")
#guard maxBelowN 1 (parse! "C(C(0,C(C(0,0),C(W,0))),W)") 5 == some (parse! "C(0,C(C(C(0,0),C(W,0)),W))")
#guard minAboveN 1 (parse! "C(C(0,C(C(0,0),C(W,0))),W)") 5 == some (parse! "C(C(C(0,C(0,0)),C(W,0)),W)")
#guard maxBelowN 1 (parse! "C(C(C(0,C(C(W,W),W)),W),0)") 5 == some (parse! "C(C(W,C(C(C(W,W),W),W)),0)")
#guard minAboveN 1 (parse! "C(C(C(0,C(C(W,W),W)),W),0)") 5 == some (parse! "C(C(C(W,C(C(W,W),W)),W),0)")
#guard maxBelowN 1 (parse! "C(C(C(0,C(W,0)),W),W)") 4 == some (parse! "C(C(0,C(C(W,0),W)),W)")
#guard maxBelowN 1 (parse! "C(C(C(0,C(W,0)),W),W)") 5 == some (parse! "C(C(C(W,0),C(C(W,0),W)),W)")
#guard minAboveN 1 (parse! "C(C(C(0,C(W,0)),W),W)") 4 == some (parse! "C(C(C(W,C(W,0)),W),W)")
#guard maxBelowN 1 (parse! "C(C(W,C(W,C(W,C(W,W)))),0)") 5 == some (parse! "C(C(0,C(W,C(W,C(W,W)))),0)")
#guard minAboveN 1 (parse! "C(C(W,C(W,C(W,C(W,W)))),0)") 5 == some (parse! "C(C(C(0,W),W),0)")
#guard maxBelowN 1 (parse! "C(C(C(0,0),0),C(W,C(W,0)))") 5 == some (parse! "C(C(0,C(0,0)),C(W,C(W,0)))")
#guard minAboveN 1 (parse! "C(C(C(0,0),0),C(W,C(W,0)))") 5 == some (parse! "C(C(W,0),C(W,C(W,0)))")
#guard maxBelowN 1 (parse! "C(C(C(0,0),0),C(C(W,W),0))") 5 == some (parse! "C(C(0,C(0,0)),C(C(W,W),0))")
#guard minAboveN 1 (parse! "C(C(C(0,0),0),C(C(W,W),0))") 5 == some (parse! "C(C(W,0),C(C(W,W),0))")
#guard maxBelowN 1 (parse! "C(C(0,C(0,C(0,0))),C(W,0))") 5 == some (parse! "C(0,C(C(0,C(0,0)),C(W,0)))")
#guard minAboveN 1 (parse! "C(C(0,C(0,C(0,0))),C(W,0))") 5 == some (parse! "C(C(C(0,0),0),C(W,0))")
#guard maxBelowN 1 (parse! "C(C(C(W,C(C(W,W),0)),W),W)") 5 == some (parse! "C(C(C(0,C(C(W,W),0)),W),W)")
#guard minAboveN 1 (parse! "C(C(C(W,C(C(W,W),0)),W),W)") 5 == some (parse! "C(C(C(C(0,C(W,W)),0),W),W)")
#guard maxBelowN 1 (parse! "C(C(C(0,0),C(C(W,0),W)),0)") 5 == some (parse! "C(C(0,C(0,C(C(W,0),W))),0)")
#guard minAboveN 1 (parse! "C(C(C(0,0),C(C(W,0),W)),0)") 5 == some (parse! "C(C(C(W,0),C(C(W,0),W)),0)")
#guard maxBelowN 1 (parse! "C(C(0,C(W,0)),C(C(0,W),0))") 5 == some (parse! "C(0,C(C(W,0),C(C(0,W),0)))")
#guard minAboveN 1 (parse! "C(C(0,C(W,0)),C(C(0,W),0))") 5 == some (parse! "C(C(W,C(W,0)),C(C(0,W),0))")
#guard maxBelowN 1 (parse! "C(C(C(W,0),C(W,C(W,0))),W)") 5 == some (parse! "C(C(C(0,0),C(W,C(W,0))),W)")
#guard minAboveN 1 (parse! "C(C(C(W,0),C(W,C(W,0))),W)") 5 == some (parse! "C(C(W,C(W,C(W,0))),W)")
#guard maxBelowN 1 (parse! "C(C(0,C(W,C(W,C(W,W)))),W)") 5 == some (parse! "C(W,C(C(W,C(W,C(W,W))),W))")
#guard minAboveN 1 (parse! "C(C(0,C(W,C(W,C(W,W)))),W)") 5 == some (parse! "C(C(W,C(W,C(W,C(W,W)))),W)")
#guard maxBelowN 1 (parse! "C(C(C(W,0),C(W,C(W,W))),W)") 5 == some (parse! "C(C(C(0,0),C(W,C(W,W))),W)")
#guard minAboveN 1 (parse! "C(C(C(W,0),C(W,C(W,W))),W)") 5 == some (parse! "C(C(W,C(W,C(W,W))),W)")
#guard maxBelowN 1 (parse! "C(C(0,C(C(W,0),C(W,W))),W)") 5 == some (parse! "C(W,C(C(C(W,0),C(W,W)),W))")
#guard minAboveN 1 (parse! "C(C(0,C(C(W,0),C(W,W))),W)") 5 == some (parse! "C(C(C(0,C(W,0)),C(W,W)),W)")
#guard maxBelowN 1 (parse! "C(W,C(C(C(W,0),W),0))") 4 == some (parse! "C(0,C(C(C(W,0),W),0))")
#guard maxBelowN 1 (parse! "C(W,C(C(C(W,0),W),0))") 5 == some (parse! "C(C(W,0),C(C(C(W,0),W),0))")
#guard minAboveN 1 (parse! "C(W,C(C(C(W,0),W),0))") 4 == some (parse! "C(C(0,C(C(W,0),W)),0)")
#guard maxBelowN 1 (parse! "C(C(W,0),C(C(0,W),0))") 4 == some (parse! "C(C(0,0),C(C(0,W),0))")
#guard maxBelowN 1 (parse! "C(C(W,0),C(C(0,W),0))") 5 == some (parse! "C(C(C(0,0),0),C(C(0,W),0))")
#guard minAboveN 1 (parse! "C(C(W,0),C(C(0,W),0))") 4 == some (parse! "C(W,C(C(0,W),0))")
#guard maxBelowN 1 (parse! "C(W,C(C(C(C(W,0),W),W),0))") 5 == some (parse! "C(0,C(C(C(C(W,0),W),W),0))")
#guard minAboveN 1 (parse! "C(W,C(C(C(C(W,0),W),W),0))") 5 == some (parse! "C(C(0,C(C(C(W,0),W),W)),0)")
#guard maxBelowN 1 (parse! "C(C(C(0,C(0,0)),0),C(W,0))") 5 == some (parse! "C(C(0,C(C(0,0),0)),C(W,0))")
#guard minAboveN 1 (parse! "C(C(C(0,C(0,0)),0),C(W,0))") 5 == some (parse! "C(C(C(C(0,0),0),0),C(W,0))")
#guard maxBelowN 1 (parse! "C(C(C(C(C(0,W),W),W),W),0)") 5 == some (parse! "C(C(C(C(W,C(W,W)),W),W),0)")
#guard minAboveN 1 (parse! "C(C(C(C(C(0,W),W),W),W),0)") 5 == some (parse! "C(C(C(C(C(W,W),W),W),W),0)")
#guard maxBelowN 1 (parse! "C(C(0,C(0,C(0,W))),W)") 4 == some (parse! "C(W,C(C(0,C(0,W)),W))")
#guard maxBelowN 1 (parse! "C(C(0,C(0,C(0,W))),W)") 5 == some (parse! "C(C(0,W),C(C(0,C(0,W)),W))")
#guard minAboveN 1 (parse! "C(C(0,C(0,C(0,W))),W)") 4 == some (parse! "C(C(C(0,0),W),W)")
#guard maxBelowN 1 (parse! "C(W,C(W,W))") 2 == some (parse! "C(0,C(W,W))")
#guard maxBelowN 1 (parse! "C(W,C(W,W))") 3 == some (parse! "C(C(W,0),C(W,W))")
#guard maxBelowN 1 (parse! "C(W,C(W,W))") 4 == some (parse! "C(C(C(W,W),0),C(W,W))")
#guard minAboveN 1 (parse! "C(W,C(W,W))") 2 == some (parse! "C(C(0,W),W)")
#guard maxBelowN 1 (parse! "C(C(0,0),C(C(W,0),C(W,0)))") 5 == some (parse! "C(0,C(0,C(C(W,0),C(W,0))))")
#guard minAboveN 1 (parse! "C(C(0,0),C(C(W,0),C(W,0)))") 5 == some (parse! "C(C(W,0),C(C(W,0),C(W,0)))")
#guard maxBelowN 1 (parse! "C(C(C(0,C(C(0,0),0)),W),0)") 5 == some (parse! "C(C(0,C(C(C(0,0),0),W)),0)")
#guard minAboveN 1 (parse! "C(C(C(0,C(C(0,0),0)),W),0)") 5 == some (parse! "C(C(C(C(0,C(0,0)),0),W),0)")
#guard maxBelowN 1 (parse! "C(W,C(C(C(C(0,0),W),W),W))") 5 == some (parse! "C(0,C(C(C(C(0,0),W),W),W))")
#guard minAboveN 1 (parse! "C(W,C(C(C(C(0,0),W),W),W))") 5 == some (parse! "C(C(0,C(C(C(0,0),W),W)),W)")
#guard maxBelowN 1 (parse! "C(C(0,C(0,C(0,C(0,W)))),W)") 5 == some (parse! "C(W,C(C(0,C(0,C(0,W))),W))")
#guard minAboveN 1 (parse! "C(C(0,C(0,C(0,C(0,W)))),W)") 5 == some (parse! "C(C(C(0,0),W),W)")
#guard maxBelowN 1 (parse! "C(C(W,C(C(0,W),0)),C(W,W))") 5 == some (parse! "C(C(0,C(C(0,W),0)),C(W,W))")
#guard minAboveN 1 (parse! "C(C(W,C(C(0,W),0)),C(W,W))") 5 == some (parse! "C(C(C(0,C(0,W)),0),C(W,W))")
#guard maxBelowN 1 (parse! "C(C(C(C(W,C(W,W)),W),0),W)") 5 == some (parse! "C(C(C(C(0,C(W,W)),W),0),W)")
#guard minAboveN 1 (parse! "C(C(C(C(W,C(W,W)),W),0),W)") 5 == some (parse! "C(C(C(C(C(0,W),W),W),0),W)")
#guard maxBelowN 1 (parse! "C(W,C(C(W,C(C(W,W),W)),W))") 5 == some (parse! "C(0,C(C(W,C(C(W,W),W)),W))")
#guard minAboveN 1 (parse! "C(W,C(C(W,C(C(W,W),W)),W))") 5 == some (parse! "C(C(0,C(W,C(C(W,W),W))),W)")
#guard maxBelowN 1 (parse! "C(C(0,C(0,C(0,C(0,0)))),W)") 5 == some (parse! "C(0,C(C(0,C(0,C(0,0))),W))")
#guard minAboveN 1 (parse! "C(C(0,C(0,C(0,C(0,0)))),W)") 5 == some (parse! "C(C(C(0,0),0),W)")
#guard maxBelowN 1 (parse! "C(C(C(0,C(C(0,W),W)),W),0)") 5 == some (parse! "C(C(W,C(C(C(0,W),W),W)),0)")
#guard minAboveN 1 (parse! "C(C(C(0,C(C(0,W),W)),W),0)") 5 == some (parse! "C(C(C(W,C(C(0,W),W)),W),0)")
#guard maxBelowN 1 (parse! "C(C(W,0),C(C(W,C(W,W)),0))") 5 == some (parse! "C(C(0,0),C(C(W,C(W,W)),0))")
#guard minAboveN 1 (parse! "C(C(W,0),C(C(W,C(W,W)),0))") 5 == some (parse! "C(W,C(C(W,C(W,W)),0))")
#guard maxBelowN 1 (parse! "C(C(W,C(W,C(C(W,W),W))),0)") 5 == some (parse! "C(C(0,C(W,C(C(W,W),W))),0)")
#guard minAboveN 1 (parse! "C(C(W,C(W,C(C(W,W),W))),0)") 5 == some (parse! "C(C(C(0,W),C(C(W,W),W)),0)")
#guard maxBelowN 1 (parse! "C(C(W,0),C(C(C(W,0),W),0))") 5 == some (parse! "C(C(0,0),C(C(C(W,0),W),0))")
#guard minAboveN 1 (parse! "C(C(W,0),C(C(C(W,0),W),0))") 5 == some (parse! "C(W,C(C(C(W,0),W),0))")
#guard maxBelowN 1 (parse! "C(C(W,0),C(W,W))") 3 == some (parse! "C(C(0,0),C(W,W))")
#guard maxBelowN 1 (parse! "C(C(W,0),C(W,W))") 4 == some (parse! "C(C(C(0,0),0),C(W,W))")
#guard maxBelowN 1 (parse! "C(C(W,0),C(W,W))") 5 == some (parse! "C(C(C(C(0,0),0),0),C(W,W))")
#guard minAboveN 1 (parse! "C(C(W,0),C(W,W))") 3 == some (parse! "C(W,C(W,W))")
#guard maxBelowN 1 (parse! "C(C(C(0,0),C(C(0,0),W)),W)") 5 == some (parse! "C(C(0,C(0,C(C(0,0),W))),W)")
#guard minAboveN 1 (parse! "C(C(C(0,0),C(C(0,0),W)),W)") 5 == some (parse! "C(C(C(0,C(0,0)),W),W)")
#guard maxBelowN 1 (parse! "C(C(0,C(C(C(0,0),0),W)),W)") 5 == some (parse! "C(W,C(C(C(C(0,0),0),W),W))")
#guard minAboveN 1 (parse! "C(C(0,C(C(C(0,0),0),W)),W)") 5 == some (parse! "C(C(C(0,C(C(0,0),0)),W),W)")
#guard maxBelowN 1 (parse! "C(W,C(C(0,C(W,W)),W))") 4 == some (parse! "C(0,C(C(0,C(W,W)),W))")
#guard maxBelowN 1 (parse! "C(W,C(C(0,C(W,W)),W))") 5 == some (parse! "C(C(W,0),C(C(0,C(W,W)),W))")
#guard minAboveN 1 (parse! "C(W,C(C(0,C(W,W)),W))") 4 == some (parse! "C(C(0,C(0,C(W,W))),W)")
#guard maxBelowN 1 (parse! "C(C(0,0),C(C(0,0),C(W,0)))") 5 == some (parse! "C(0,C(0,C(C(0,0),C(W,0))))")
#guard minAboveN 1 (parse! "C(C(0,0),C(C(0,0),C(W,0)))") 5 == some (parse! "C(C(0,C(0,0)),C(W,0))")
#guard maxBelowN 1 (parse! "C(C(C(0,W),0),C(C(W,W),W))") 5 == some (parse! "C(C(W,C(W,0)),C(C(W,W),W))")
#guard minAboveN 1 (parse! "C(C(C(0,W),0),C(C(W,W),W))") 5 == some (parse! "C(C(C(W,W),0),C(C(W,W),W))")
#guard maxBelowN 1 (parse! "C(C(0,0),C(C(C(0,W),W),W))") 5 == some (parse! "C(0,C(0,C(C(C(0,W),W),W)))")
#guard minAboveN 1 (parse! "C(C(0,0),C(C(C(0,W),W),W))") 5 == some (parse! "C(C(W,0),C(C(C(0,W),W),W))")
#guard maxBelowN 1 (parse! "C(C(0,C(C(C(0,0),W),W)),0)") 5 == some (parse! "C(W,C(C(C(C(0,0),W),W),0))")
#guard minAboveN 1 (parse! "C(C(0,C(C(C(0,0),W),W)),0)") 5 == some (parse! "C(C(W,C(C(C(0,0),W),W)),0)")
#guard maxBelowN 1 (parse! "C(C(W,0),W)") 2 == some (parse! "C(C(0,0),W)")
#guard maxBelowN 1 (parse! "C(C(W,0),W)") 3 == some (parse! "C(C(C(0,0),0),W)")
#guard maxBelowN 1 (parse! "C(C(W,0),W)") 4 == some (parse! "C(C(C(C(0,0),0),0),W)")
#guard minAboveN 1 (parse! "C(C(W,0),W)") 2 == some (parse! "C(W,W)")
#guard maxBelowN 1 (parse! "C(C(W,W),C(C(W,C(W,W)),W))") 5 == some (parse! "C(C(0,W),C(C(W,C(W,W)),W))")
#guard minAboveN 1 (parse! "C(C(W,W),C(C(W,C(W,W)),W))") 5 == some (parse! "C(C(0,C(W,C(W,W))),W)")
#guard maxBelowN 1 (parse! "C(C(0,0),C(W,C(C(0,W),W)))") 5 == some (parse! "C(0,C(0,C(W,C(C(0,W),W))))")
#guard minAboveN 1 (parse! "C(C(0,0),C(W,C(C(0,W),W)))") 5 == some (parse! "C(C(W,0),C(W,C(C(0,W),W)))")
#guard maxBelowN 1 (parse! "C(C(W,C(W,0)),C(C(W,W),0))") 5 == some (parse! "C(C(0,C(W,0)),C(C(W,W),0))")
#guard minAboveN 1 (parse! "C(C(W,C(W,0)),C(C(W,W),0))") 5 == some (parse! "C(C(C(0,W),0),C(C(W,W),0))")
#guard maxBelowN 1 (parse! "C(C(C(C(C(0,W),0),W),0),W)") 5 == some (parse! "C(C(C(C(W,C(W,0)),W),0),W)")
#guard minAboveN 1 (parse! "C(C(C(C(C(0,W),0),W),0),W)") 5 == some (parse! "C(C(C(W,W),0),W)")
#guard maxBelowN 1 (parse! "C(C(0,W),C(C(C(0,0),W),W))") 5 == some (parse! "C(W,C(W,C(C(C(0,0),W),W)))")
#guard minAboveN 1 (parse! "C(C(0,W),C(C(C(0,0),W),W))") 5 == some (parse! "C(C(0,C(C(0,0),W)),W)")
#guard maxBelowN 1 (parse! "C(C(C(0,C(0,C(W,0))),W),0)") 5 == some (parse! "C(C(0,C(C(0,C(W,0)),W)),0)")
#guard minAboveN 1 (parse! "C(C(C(0,C(0,C(W,0))),W),0)") 5 == some (parse! "C(C(C(C(0,0),C(W,0)),W),0)")
#guard maxBelowN 1 (parse! "C(W,C(C(C(C(0,W),W),W),0))") 5 == some (parse! "C(0,C(C(C(C(0,W),W),W),0))")
#guard minAboveN 1 (parse! "C(W,C(C(C(C(0,W),W),W),0))") 5 == some (parse! "C(C(0,C(C(C(0,W),W),W)),0)")
#guard maxBelowN 1 (parse! "C(C(W,C(C(C(W,0),W),W)),W)") 5 == some (parse! "C(C(0,C(C(C(W,0),W),W)),W)")
#guard minAboveN 1 (parse! "C(C(W,C(C(C(W,0),W),W)),W)") 5 == some (parse! "C(C(C(0,C(C(W,0),W)),W),W)")
#guard maxBelowN 1 (parse! "C(C(0,C(C(0,C(0,W)),0)),W)") 5 == some (parse! "C(0,C(C(C(0,C(0,W)),0),W))")
#guard minAboveN 1 (parse! "C(C(0,C(C(0,C(0,W)),0)),W)") 5 == some (parse! "C(C(W,C(C(0,C(0,W)),0)),W)")
#guard maxBelowN 1 (parse! "C(C(0,C(0,W)),C(C(W,W),W))") 5 == some (parse! "C(W,C(C(0,W),C(C(W,W),W)))")
#guard minAboveN 1 (parse! "C(C(0,C(0,W)),C(C(W,W),W))") 5 == some (parse! "C(C(C(0,0),W),C(C(W,W),W))")
#guard maxBelowN 1 (parse! "C(C(W,C(C(C(W,0),W),0)),W)") 5 == some (parse! "C(C(0,C(C(C(W,0),W),0)),W)")
#guard minAboveN 1 (parse! "C(C(W,C(C(C(W,0),W),0)),W)") 5 == some (parse! "C(C(C(0,C(C(W,0),W)),0),W)")
#guard maxBelowN 1 (parse! "C(C(C(C(0,W),0),C(W,W)),W)") 5 == some (parse! "C(C(C(W,C(W,0)),C(W,W)),W)")
#guard minAboveN 1 (parse! "C(C(C(C(0,W),0),C(W,W)),W)") 5 == some (parse! "C(C(C(C(W,W),0),C(W,W)),W)")
#guard maxBelowN 1 (parse! "C(C(C(C(0,0),0),C(W,W)),W)") 5 == some (parse! "C(C(C(0,C(0,0)),C(W,W)),W)")
#guard minAboveN 1 (parse! "C(C(C(C(0,0),0),C(W,W)),W)") 5 == some (parse! "C(C(C(W,0),C(W,W)),W)")
#guard maxBelowN 1 (parse! "C(C(0,C(0,0)),C(C(W,W),W))") 5 == some (parse! "C(0,C(C(0,0),C(C(W,W),W)))")
#guard minAboveN 1 (parse! "C(C(0,C(0,0)),C(C(W,W),W))") 5 == some (parse! "C(C(C(0,0),0),C(C(W,W),W))")
#guard maxBelowN 1 (parse! "C(C(0,0),C(C(0,C(W,W)),0))") 5 == some (parse! "C(0,C(0,C(C(0,C(W,W)),0)))")
#guard minAboveN 1 (parse! "C(C(0,0),C(C(0,C(W,W)),0))") 5 == some (parse! "C(C(W,0),C(C(0,C(W,W)),0))")
#guard maxBelowN 1 (parse! "C(W,C(W,C(W,C(C(W,W),0))))") 5 == some (parse! "C(0,C(W,C(W,C(C(W,W),0))))")
#guard minAboveN 1 (parse! "C(W,C(W,C(W,C(C(W,W),0))))") 5 == some (parse! "C(C(0,W),C(C(W,W),0))")
#guard maxBelowN 1 (parse! "C(C(C(C(W,W),W),0),W)") 4 == some (parse! "C(C(C(C(0,W),W),0),W)")
#guard maxBelowN 1 (parse! "C(C(C(C(W,W),W),0),W)") 5 == some (parse! "C(C(C(C(C(W,0),W),W),0),W)")
#guard minAboveN 1 (parse! "C(C(C(C(W,W),W),0),W)") 4 == some (parse! "C(W,W)")
#guard maxBelowN 1 (parse! "C(C(W,0),C(C(W,0),W))") 4 == some (parse! "C(C(0,0),C(C(W,0),W))")
#guard maxBelowN 1 (parse! "C(C(W,0),C(C(W,0),W))") 5 == some (parse! "C(C(C(0,0),0),C(C(W,0),W))")
#guard minAboveN 1 (parse! "C(C(W,0),C(C(W,0),W))") 4 == some (parse! "C(C(0,C(W,0)),W)")
#guard maxBelowN 1 (parse! "C(C(0,C(C(C(W,0),W),0)),W)") 5 == some (parse! "C(0,C(C(C(C(W,0),W),0),W))")
#guard minAboveN 1 (parse! "C(C(0,C(C(C(W,0),W),0)),W)") 5 == some (parse! "C(C(W,C(C(C(W,0),W),0)),W)")
#guard maxBelowN 1 (parse! "C(C(0,C(C(C(0,0),W),W)),W)") 5 == some (parse! "C(W,C(C(C(C(0,0),W),W),W))")
#guard minAboveN 1 (parse! "C(C(0,C(C(C(0,0),W),W)),W)") 5 == some (parse! "C(C(W,C(C(C(0,0),W),W)),W)")
#guard maxBelowN 1 (parse! "C(C(W,C(C(C(W,W),W),W)),W)") 5 == some (parse! "C(C(0,C(C(C(W,W),W),W)),W)")
#guard minAboveN 1 (parse! "C(C(W,C(C(C(W,W),W),W)),W)") 5 == some (parse! "C(C(C(0,C(C(W,W),W)),W),W)")
#guard maxBelowN 1 (parse! "C(C(C(C(C(0,W),W),W),0),W)") 5 == some (parse! "C(C(C(C(W,C(W,W)),W),0),W)")
#guard minAboveN 1 (parse! "C(C(C(C(C(0,W),W),W),0),W)") 5 == some (parse! "C(C(C(C(C(W,W),W),W),0),W)")
#guard maxBelowN 1 (parse! "C(C(C(W,C(C(W,W),W)),0),W)") 5 == some (parse! "C(C(C(0,C(C(W,W),W)),0),W)")
#guard minAboveN 1 (parse! "C(C(C(W,C(C(W,W),W)),0),W)") 5 == some (parse! "C(C(C(C(0,C(W,W)),W),0),W)")
#guard maxBelowN 1 (parse! "C(C(0,C(0,0)),C(W,0))") 4 == some (parse! "C(0,C(C(0,0),C(W,0)))")
#guard maxBelowN 1 (parse! "C(C(0,C(0,0)),C(W,0))") 5 == some (parse! "C(C(0,0),C(C(0,0),C(W,0)))")
#guard minAboveN 1 (parse! "C(C(0,C(0,0)),C(W,0))") 4 == some (parse! "C(C(C(0,0),0),C(W,0))")
#guard maxBelowN 1 (parse! "C(C(0,C(C(W,C(W,0)),W)),0)") 5 == some (parse! "C(W,C(C(C(W,C(W,0)),W),0))")
#guard minAboveN 1 (parse! "C(C(0,C(C(W,C(W,0)),W)),0)") 5 == some (parse! "C(C(C(0,C(W,C(W,0))),W),0)")
#guard maxBelowN 1 (parse! "C(C(C(0,W),C(C(W,W),0)),W)") 5 == some (parse! "C(C(W,C(W,C(C(W,W),0))),W)")
#guard minAboveN 1 (parse! "C(C(C(0,W),C(C(W,W),0)),W)") 5 == some (parse! "C(C(C(W,W),C(C(W,W),0)),W)")
#guard maxBelowN 1 (parse! "C(C(C(0,C(0,W)),0),C(W,W))") 5 == some (parse! "C(C(W,C(C(0,W),0)),C(W,W))")
#guard minAboveN 1 (parse! "C(C(C(0,C(0,W)),0),C(W,W))") 5 == some (parse! "C(C(C(C(0,0),W),0),C(W,W))")
#guard maxBelowN 1 (parse! "C(C(C(C(C(W,0),W),0),W),0)") 5 == some (parse! "C(C(C(C(C(0,0),W),0),W),0)")
#guard minAboveN 1 (parse! "C(C(C(C(C(W,0),W),0),W),0)") 5 == some (parse! "C(C(W,W),0)")
#guard maxBelowN 1 (parse! "C(C(W,C(W,C(C(W,W),W))),W)") 5 == some (parse! "C(C(0,C(W,C(C(W,W),W))),W)")
#guard minAboveN 1 (parse! "C(C(W,C(W,C(C(W,W),W))),W)") 5 == some (parse! "C(C(C(0,W),C(C(W,W),W)),W)")
#guard maxBelowN 1 (parse! "C(C(C(C(W,0),C(W,W)),W),0)") 5 == some (parse! "C(C(C(C(0,0),C(W,W)),W),0)")
#guard minAboveN 1 (parse! "C(C(C(C(W,0),C(W,W)),W),0)") 5 == some (parse! "C(C(C(W,C(W,W)),W),0)")
#guard maxBelowN 1 (parse! "C(W,C(C(0,C(C(0,0),W)),0))") 5 == some (parse! "C(0,C(C(0,C(C(0,0),W)),0))")
#guard minAboveN 1 (parse! "C(W,C(C(0,C(C(0,0),W)),0))") 5 == some (parse! "C(C(0,C(0,C(C(0,0),W))),0)")
#guard maxBelowN 1 (parse! "C(C(0,C(C(0,0),C(W,W))),0)") 5 == some (parse! "C(W,C(C(C(0,0),C(W,W)),0))")
#guard minAboveN 1 (parse! "C(C(0,C(C(0,0),C(W,W))),0)") 5 == some (parse! "C(C(C(0,C(0,0)),C(W,W)),0)")
#guard maxBelowN 1 (parse! "C(C(C(C(0,0),0),W),0)") 4 == some (parse! "C(C(C(0,C(0,0)),W),0)")
#guard maxBelowN 1 (parse! "C(C(C(C(0,0),0),W),0)") 5 == some (parse! "C(C(C(0,C(0,C(0,0))),W),0)")
#guard minAboveN 1 (parse! "C(C(C(C(0,0),0),W),0)") 4 == some (parse! "C(C(C(W,0),W),0)")
#guard maxBelowN 1 (parse! "C(C(C(0,0),0),C(C(0,W),W))") 5 == some (parse! "C(C(0,C(0,0)),C(C(0,W),W))")
#guard minAboveN 1 (parse! "C(C(C(0,0),0),C(C(0,W),W))") 5 == some (parse! "C(C(W,0),C(C(0,W),W))")
#guard maxBelowN 1 (parse! "C(C(0,C(W,C(C(0,W),0))),W)") 5 == some (parse! "C(0,C(C(W,C(C(0,W),0)),W))")
#guard minAboveN 1 (parse! "C(C(0,C(W,C(C(0,W),0))),W)") 5 == some (parse! "C(C(W,C(W,C(C(0,W),0))),W)")
#guard maxBelowN 1 (parse! "C(C(C(0,C(W,0)),C(W,W)),W)") 5 == some (parse! "C(C(0,C(C(W,0),C(W,W))),W)")
#guard minAboveN 1 (parse! "C(C(C(0,C(W,0)),C(W,W)),W)") 5 == some (parse! "C(C(C(W,C(W,0)),C(W,W)),W)")
#guard maxBelowN 1 (parse! "C(C(C(0,C(C(0,0),W)),W),W)") 5 == some (parse! "C(C(W,C(C(C(0,0),W),W)),W)")
#guard minAboveN 1 (parse! "C(C(C(0,C(C(0,0),W)),W),W)") 5 == some (parse! "C(C(C(C(0,C(0,0)),W),W),W)")
#guard maxBelowN 1 (parse! "C(W,C(W,C(C(0,W),0)))") 4 == some (parse! "C(0,C(W,C(C(0,W),0)))")
#guard maxBelowN 1 (parse! "C(W,C(W,C(C(0,W),0)))") 5 == some (parse! "C(C(W,0),C(W,C(C(0,W),0)))")
#guard minAboveN 1 (parse! "C(W,C(W,C(C(0,W),0)))") 4 == some (parse! "C(C(0,W),C(C(0,W),0))")
#guard maxBelowN 1 (parse! "C(C(0,0),C(C(0,C(0,0)),W))") 5 == some (parse! "C(0,C(0,C(C(0,C(0,0)),W)))")
#guard minAboveN 1 (parse! "C(C(0,0),C(C(0,C(0,0)),W))") 5 == some (parse! "C(C(0,C(0,C(0,0))),W)")
#guard maxBelowN 1 (parse! "C(C(C(0,0),0),0)") 3 == some (parse! "C(C(0,C(0,0)),0)")
#guard maxBelowN 1 (parse! "C(C(C(0,0),0),0)") 4 == some (parse! "C(C(0,C(0,C(0,0))),0)")
#guard maxBelowN 1 (parse! "C(C(C(0,0),0),0)") 5 == some (parse! "C(C(0,C(0,C(0,C(0,0)))),0)")
#guard minAboveN 1 (parse! "C(C(C(0,0),0),0)") 3 == some (parse! "C(W,0)")
#guard maxBelowN 1 (parse! "C(C(0,C(C(W,W),0)),W)") 4 == some (parse! "C(0,C(C(C(W,W),0),W))")
#guard maxBelowN 1 (parse! "C(C(0,C(C(W,W),0)),W)") 5 == some (parse! "C(C(W,0),C(C(C(W,W),0),W))")
#guard minAboveN 1 (parse! "C(C(0,C(C(W,W),0)),W)") 4 == some (parse! "C(C(W,C(C(W,W),0)),W)")
#guard maxBelowN 1 (parse! "C(C(C(0,0),0),W)") 3 == some (parse! "C(C(0,C(0,0)),W)")
#guard maxBelowN 1 (parse! "C(C(C(0,0),0),W)") 4 == some (parse! "C(C(0,C(0,C(0,0))),W)")
#guard maxBelowN 1 (parse! "C(C(C(0,0),0),W)") 5 == some (parse! "C(C(0,C(0,C(0,C(0,0)))),W)")
#guard minAboveN 1 (parse! "C(C(C(0,0),0),W)") 3 == some (parse! "C(C(W,0),W)")
#guard maxBelowN 1 (parse! "C(C(C(0,0),C(C(W,W),W)),0)") 5 == some (parse! "C(C(0,C(0,C(C(W,W),W))),0)")
#guard minAboveN 1 (parse! "C(C(C(0,0),C(C(W,W),W)),0)") 5 == some (parse! "C(C(C(W,0),C(C(W,W),W)),0)")
#guard maxBelowN 1 (parse! "C(C(W,0),C(C(0,C(W,0)),W))") 5 == some (parse! "C(C(0,0),C(C(0,C(W,0)),W))")
#guard minAboveN 1 (parse! "C(C(W,0),C(C(0,C(W,0)),W))") 5 == some (parse! "C(C(0,C(0,C(W,0))),W)")
#guard maxBelowN 1 (parse! "C(C(0,0),C(C(C(0,0),W),W))") 5 == some (parse! "C(0,C(0,C(C(C(0,0),W),W)))")
#guard minAboveN 1 (parse! "C(C(0,0),C(C(C(0,0),W),W))") 5 == some (parse! "C(C(W,0),C(C(C(0,0),W),W))")
#guard maxBelowN 1 (parse! "C(W,C(C(0,W),W))") 3 == some (parse! "C(0,C(C(0,W),W))")
#guard maxBelowN 1 (parse! "C(W,C(C(0,W),W))") 4 == some (parse! "C(C(W,0),C(C(0,W),W))")
#guard maxBelowN 1 (parse! "C(W,C(C(0,W),W))") 5 == some (parse! "C(C(C(W,W),0),C(C(0,W),W))")
#guard minAboveN 1 (parse! "C(W,C(C(0,W),W))") 3 == some (parse! "C(C(0,C(0,W)),W)")
#guard maxBelowN 1 (parse! "C(W,C(W,C(W,0)))") 3 == some (parse! "C(0,C(W,C(W,0)))")
#guard maxBelowN 1 (parse! "C(W,C(W,C(W,0)))") 4 == some (parse! "C(C(W,0),C(W,C(W,0)))")
#guard maxBelowN 1 (parse! "C(W,C(W,C(W,0)))") 5 == some (parse! "C(C(W,C(W,0)),C(W,C(W,0)))")
#guard minAboveN 1 (parse! "C(W,C(W,C(W,0)))") 3 == some (parse! "C(C(0,W),0)")
#guard maxBelowN 1 (parse! "C(C(W,W),0)") 2 == some (parse! "C(C(0,W),0)")
#guard maxBelowN 1 (parse! "C(C(W,W),0)") 3 == some (parse! "C(C(C(W,0),W),0)")
#guard maxBelowN 1 (parse! "C(C(W,W),0)") 4 == some (parse! "C(C(C(C(0,W),0),W),0)")
#guard minAboveN 1 (parse! "C(C(W,W),0)") 2 == some (parse! "W")
#guard maxBelowN 1 (parse! "C(C(W,0),C(C(C(W,W),W),0))") 5 == some (parse! "C(C(0,0),C(C(C(W,W),W),0))")
#guard minAboveN 1 (parse! "C(C(W,0),C(C(C(W,W),W),0))") 5 == some (parse! "C(W,C(C(C(W,W),W),0))")
#guard maxBelowN 1 (parse! "C(C(0,C(0,0)),C(W,C(W,W)))") 5 == some (parse! "C(0,C(C(0,0),C(W,C(W,W))))")
#guard minAboveN 1 (parse! "C(C(0,C(0,0)),C(W,C(W,W)))") 5 == some (parse! "C(C(C(0,0),0),C(W,C(W,W)))")
#guard maxBelowN 1 (parse! "C(C(C(0,C(C(0,0),0)),0),0)") 5 == some (parse! "C(C(0,C(C(C(0,0),0),0)),0)")
#guard minAboveN 1 (parse! "C(C(C(0,C(C(0,0),0)),0),0)") 5 == some (parse! "C(C(C(C(0,C(0,0)),0),0),0)")
#guard maxBelowN 1 (parse! "C(W,C(W,C(C(0,C(W,W)),0)))") 5 == some (parse! "C(0,C(W,C(C(0,C(W,W)),0)))")
#guard minAboveN 1 (parse! "C(W,C(W,C(C(0,C(W,W)),0)))") 5 == some (parse! "C(C(0,W),C(C(0,C(W,W)),0))")
#guard maxBelowN 1 (parse! "C(W,C(C(0,W),C(C(W,W),0)))") 5 == some (parse! "C(0,C(C(0,W),C(C(W,W),0)))")
#guard minAboveN 1 (parse! "C(W,C(C(0,W),C(C(W,W),0)))") 5 == some (parse! "C(C(0,C(0,W)),C(C(W,W),0))")
#guard maxBelowN 1 (parse! "C(W,C(C(0,C(0,C(0,W))),W))") 5 == some (parse! "C(0,C(C(0,C(0,C(0,W))),W))")
#guard minAboveN 1 (parse! "C(W,C(C(0,C(0,C(0,W))),W))") 5 == some (parse! "C(C(0,C(0,C(0,C(0,W)))),W)")
#guard maxBelowN 1 (parse! "C(C(0,0),C(C(C(W,W),W),W))") 5 == some (parse! "C(0,C(0,C(C(C(W,W),W),W)))")
#guard minAboveN 1 (parse! "C(C(0,0),C(C(C(W,W),W),W))") 5 == some (parse! "C(C(W,0),C(C(C(W,W),W),W))")
#guard maxBelowN 1 (parse! "C(C(C(0,0),0),C(W,C(W,W)))") 5 == some (parse! "C(C(0,C(0,0)),C(W,C(W,W)))")
#guard minAboveN 1 (parse! "C(C(C(0,0),0),C(W,C(W,W)))") 5 == some (parse! "C(C(W,0),C(W,C(W,W)))")
#guard maxBelowN 1 (parse! "C(W,C(C(C(C(0,0),W),W),0))") 5 == some (parse! "C(0,C(C(C(C(0,0),W),W),0))")
#guard minAboveN 1 (parse! "C(W,C(C(C(C(0,0),W),W),0))") 5 == some (parse! "C(C(0,C(C(C(0,0),W),W)),0)")
#guard maxBelowN 1 (parse! "C(C(0,C(W,C(W,C(W,0)))),W)") 5 == some (parse! "C(0,C(C(W,C(W,C(W,0))),W))")
#guard minAboveN 1 (parse! "C(C(0,C(W,C(W,C(W,0)))),W)") 5 == some (parse! "C(C(W,C(W,C(W,C(W,0)))),W)")
#guard maxBelowN 1 (parse! "C(W,C(C(C(W,0),C(W,W)),W))") 5 == some (parse! "C(0,C(C(C(W,0),C(W,W)),W))")
#guard minAboveN 1 (parse! "C(W,C(C(C(W,0),C(W,W)),W))") 5 == some (parse! "C(C(0,C(C(W,0),C(W,W))),W)")
#guard maxBelowN 1 (parse! "C(C(0,W),C(C(C(W,0),W),W))") 5 == some (parse! "C(W,C(W,C(C(C(W,0),W),W)))")
#guard minAboveN 1 (parse! "C(C(0,W),C(C(C(W,0),W),W))") 5 == some (parse! "C(C(0,C(C(W,0),W)),W)")
#guard maxBelowN 1 (parse! "C(C(C(C(W,W),0),W),W)") 4 == some (parse! "C(C(C(C(0,W),0),W),W)")
#guard maxBelowN 1 (parse! "C(C(C(C(W,W),0),W),W)") 5 == some (parse! "C(C(C(C(C(W,0),W),0),W),W)")
#guard minAboveN 1 (parse! "C(C(C(C(W,W),0),W),W)") 4 == some (parse! "C(C(W,W),W)")
#guard maxBelowN 1 (parse! "C(C(C(C(0,C(W,W)),W),0),W)") 5 == some (parse! "C(C(C(W,C(C(W,W),W)),0),W)")
#guard minAboveN 1 (parse! "C(C(C(C(0,C(W,W)),W),0),W)") 5 == some (parse! "C(C(C(C(W,C(W,W)),W),0),W)")
#guard maxBelowN 1 (parse! "C(C(C(C(0,W),W),W),0)") 4 == some (parse! "C(C(C(W,C(W,W)),W),0)")
#guard maxBelowN 1 (parse! "C(C(C(C(0,W),W),W),0)") 5 == some (parse! "C(C(C(W,C(W,C(W,W))),W),0)")
#guard minAboveN 1 (parse! "C(C(C(C(0,W),W),W),0)") 4 == some (parse! "C(C(C(C(W,W),W),W),0)")
#guard maxBelowN 1 (parse! "C(W,C(C(0,C(C(0,0),W)),W))") 5 == some (parse! "C(0,C(C(0,C(C(0,0),W)),W))")
#guard minAboveN 1 (parse! "C(W,C(C(0,C(C(0,0),W)),W))") 5 == some (parse! "C(C(0,C(0,C(C(0,0),W))),W)")
#guard maxBelowN 1 (parse! "C(C(C(0,0),W),W)") 3 == some (parse! "C(C(0,C(0,W)),W)")
#guard maxBelowN 1 (parse! "C(C(C(0,0),W),W)") 4 == some (parse! "C(C(0,C(0,C(0,W))),W)")
#guard maxBelowN 1 (parse! "C(C(C(0,0),W),W)") 5 == some (parse! "C(C(0,C(0,C(0,C(0,W)))),W)")
#guard minAboveN 1 (parse! "C(C(C(0,0),W),W)") 3 == some (parse! "C(C(C(W,0),W),W)")
#guard maxBelowN 1 (parse! "C(C(C(0,W),W),0)") 3 == some (parse! "C(C(W,C(W,W)),0)")
#guard maxBelowN 1 (parse! "C(C(C(0,W),W),0)") 4 == some (parse! "C(C(W,C(W,C(W,W))),0)")
#guard maxBelowN 1 (parse! "C(C(C(0,W),W),0)") 5 == some (parse! "C(C(W,C(W,C(W,C(W,W)))),0)")
#guard minAboveN 1 (parse! "C(C(C(0,W),W),0)") 3 == some (parse! "C(C(C(W,W),W),0)")
#guard maxBelowN 1 (parse! "C(C(C(W,0),W),C(C(W,W),W))") 5 == some (parse! "C(C(C(0,0),W),C(C(W,W),W))")
#guard minAboveN 1 (parse! "C(C(C(W,0),W),C(C(W,W),W))") 5 == some (parse! "C(C(W,W),C(C(W,W),W))")
#guard maxBelowN 1 (parse! "C(C(0,C(0,C(0,C(W,0)))),W)") 5 == some (parse! "C(0,C(C(0,C(0,C(W,0))),W))")
#guard minAboveN 1 (parse! "C(C(0,C(0,C(0,C(W,0)))),W)") 5 == some (parse! "C(C(C(0,0),C(W,0)),W)")
#guard maxBelowN 1 (parse! "C(C(0,C(W,C(W,W))),0)") 4 == some (parse! "C(W,C(C(W,C(W,W)),0))")
#guard maxBelowN 1 (parse! "C(C(0,C(W,C(W,W))),0)") 5 == some (parse! "C(C(W,W),C(C(W,C(W,W)),0))")
#guard minAboveN 1 (parse! "C(C(0,C(W,C(W,W))),0)") 4 == some (parse! "C(C(W,C(W,C(W,W))),0)")
#guard maxBelowN 1 (parse! "C(C(0,C(W,C(W,0))),C(W,W))") 5 == some (parse! "C(0,C(C(W,C(W,0)),C(W,W)))")
#guard minAboveN 1 (parse! "C(C(0,C(W,C(W,0))),C(W,W))") 5 == some (parse! "C(C(W,C(W,C(W,0))),C(W,W))")
#guard maxBelowN 1 (parse! "C(C(0,0),C(C(C(0,0),0),0))") 5 == some (parse! "C(0,C(0,C(C(C(0,0),0),0)))")
#guard minAboveN 1 (parse! "C(C(0,0),C(C(C(0,0),0),0))") 5 == some (parse! "C(C(0,C(C(0,0),0)),0)")
#guard maxBelowN 1 (parse! "C(C(0,C(W,W)),0)") 3 == some (parse! "C(W,C(C(W,W),0))")
#guard maxBelowN 1 (parse! "C(C(0,C(W,W)),0)") 4 == some (parse! "C(C(W,W),C(C(W,W),0))")
#guard maxBelowN 1 (parse! "C(C(0,C(W,W)),0)") 5 == some (parse! "C(W,C(C(W,W),C(C(W,W),0)))")
#guard minAboveN 1 (parse! "C(C(0,C(W,W)),0)") 3 == some (parse! "C(C(W,C(W,W)),0)")
#guard maxBelowN 1 (parse! "C(W,C(C(C(0,C(0,0)),W),W))") 5 == some (parse! "C(0,C(C(C(0,C(0,0)),W),W))")
#guard minAboveN 1 (parse! "C(W,C(C(C(0,C(0,0)),W),W))") 5 == some (parse! "C(C(0,C(C(0,C(0,0)),W)),W)")
#guard maxBelowN 1 (parse! "C(W,C(C(0,C(C(W,0),W)),0))") 5 == some (parse! "C(0,C(C(0,C(C(W,0),W)),0))")
#guard minAboveN 1 (parse! "C(W,C(C(0,C(C(W,0),W)),0))") 5 == some (parse! "C(C(0,C(0,C(C(W,0),W))),0)")
#guard maxBelowN 1 (parse! "C(C(W,0),C(C(W,C(W,0)),W))") 5 == some (parse! "C(C(0,0),C(C(W,C(W,0)),W))")
#guard minAboveN 1 (parse! "C(C(W,0),C(C(W,C(W,0)),W))") 5 == some (parse! "C(C(0,C(W,C(W,0))),W)")
#guard maxBelowN 1 (parse! "C(W,C(C(C(0,W),W),W))") 4 == some (parse! "C(0,C(C(C(0,W),W),W))")
#guard maxBelowN 1 (parse! "C(W,C(C(C(0,W),W),W))") 5 == some (parse! "C(C(W,0),C(C(C(0,W),W),W))")
#guard minAboveN 1 (parse! "C(W,C(C(C(0,W),W),W))") 4 == some (parse! "C(C(0,C(C(0,W),W)),W)")
#guard maxBelowN 1 (parse! "C(C(0,C(C(C(0,0),W),0)),W)") 5 == some (parse! "C(0,C(C(C(C(0,0),W),0),W))")
#guard minAboveN 1 (parse! "C(C(0,C(C(C(0,0),W),0)),W)") 5 == some (parse! "C(C(W,C(C(C(0,0),W),0)),W)")
#guard maxBelowN 1 (parse! "C(C(W,W),C(C(C(W,W),W),W))") 5 == some (parse! "C(C(0,W),C(C(C(W,W),W),W))")
#guard minAboveN 1 (parse! "C(C(W,W),C(C(C(W,W),W),W))") 5 == some (parse! "C(C(0,C(C(W,W),W)),W)")
#guard maxBelowN 1 (parse! "C(C(C(C(C(0,W),0),W),W),0)") 5 == some (parse! "C(C(C(C(W,C(W,0)),W),W),0)")
#guard minAboveN 1 (parse! "C(C(C(C(C(0,W),0),W),W),0)") 5 == some (parse! "C(C(C(C(C(W,W),0),W),W),0)")
#guard maxBelowN 1 (parse! "C(C(C(W,C(W,0)),C(W,W)),0)") 5 == some (parse! "C(C(C(0,C(W,0)),C(W,W)),0)")
#guard minAboveN 1 (parse! "C(C(C(W,C(W,0)),C(W,W)),0)") 5 == some (parse! "C(C(C(C(0,W),0),C(W,W)),0)")
#guard maxBelowN 1 (parse! "C(C(0,0),C(C(0,W),0))") 4 == some (parse! "C(0,C(0,C(C(0,W),0)))")
#guard maxBelowN 1 (parse! "C(C(0,0),C(C(0,W),0))") 5 == some (parse! "C(0,C(0,C(0,C(C(0,W),0))))")
#guard minAboveN 1 (parse! "C(C(0,0),C(C(0,W),0))") 4 == some (parse! "C(C(W,0),C(C(0,W),0))")
#guard maxBelowN 1 (parse! "C(C(W,W),C(C(0,C(W,W)),W))") 5 == some (parse! "C(C(0,W),C(C(0,C(W,W)),W))")
#guard minAboveN 1 (parse! "C(C(W,W),C(C(0,C(W,W)),W))") 5 == some (parse! "C(C(0,C(0,C(W,W))),W)")
#guard maxBelowN 1 (parse! "C(C(C(0,0),C(C(0,W),W)),0)") 5 == some (parse! "C(C(0,C(0,C(C(0,W),W))),0)")
#guard minAboveN 1 (parse! "C(C(C(0,0),C(C(0,W),W)),0)") 5 == some (parse! "C(C(C(W,0),C(C(0,W),W)),0)")
#guard maxBelowN 1 (parse! "C(C(C(C(C(W,W),W),W),0),W)") 5 == some (parse! "C(C(C(C(C(0,W),W),W),0),W)")
#guard minAboveN 1 (parse! "C(C(C(C(C(W,W),W),W),0),W)") 5 == some (parse! "C(W,W)")
#guard maxBelowN 1 (parse! "C(C(0,C(C(W,0),C(W,W))),0)") 5 == some (parse! "C(W,C(C(C(W,0),C(W,W)),0))")
#guard minAboveN 1 (parse! "C(C(0,C(C(W,0),C(W,W))),0)") 5 == some (parse! "C(C(C(0,C(W,0)),C(W,W)),0)")
#guard maxBelowN 1 (parse! "C(C(W,C(W,C(W,C(W,W)))),W)") 5 == some (parse! "C(C(0,C(W,C(W,C(W,W)))),W)")
#guard minAboveN 1 (parse! "C(C(W,C(W,C(W,C(W,W)))),W)") 5 == some (parse! "C(C(C(0,W),W),W)")
#guard maxBelowN 1 (parse! "C(W,C(W,C(C(0,C(W,W)),W)))") 5 == some (parse! "C(0,C(W,C(C(0,C(W,W)),W)))")
#guard minAboveN 1 (parse! "C(W,C(W,C(C(0,C(W,W)),W)))") 5 == some (parse! "C(C(0,W),C(C(0,C(W,W)),W))")
#guard maxBelowN 1 (parse! "C(C(0,C(C(W,W),0)),C(W,W))") 5 == some (parse! "C(0,C(C(C(W,W),0),C(W,W)))")
#guard minAboveN 1 (parse! "C(C(0,C(C(W,W),0)),C(W,W))") 5 == some (parse! "C(C(W,C(C(W,W),0)),C(W,W))")
#guard maxBelowN 1 (parse! "C(C(C(0,0),C(C(0,0),W)),0)") 5 == some (parse! "C(C(0,C(0,C(C(0,0),W))),0)")
#guard minAboveN 1 (parse! "C(C(C(0,0),C(C(0,0),W)),0)") 5 == some (parse! "C(C(C(0,C(0,0)),W),0)")
#guard maxBelowN 1 (parse! "C(W,C(C(0,C(0,C(W,W))),0))") 5 == some (parse! "C(0,C(C(0,C(0,C(W,W))),0))")
#guard minAboveN 1 (parse! "C(W,C(C(0,C(0,C(W,W))),0))") 5 == some (parse! "C(C(0,C(0,C(0,C(W,W)))),0)")
#guard maxBelowN 1 (parse! "C(C(C(C(C(W,W),W),W),W),W)") 5 == some (parse! "C(C(C(C(C(0,W),W),W),W),W)")
#guard maxBelowN 1 (parse! "C(C(0,C(0,C(0,C(W,W)))),W)") 5 == some (parse! "C(W,C(C(0,C(0,C(W,W))),W))")
#guard minAboveN 1 (parse! "C(C(0,C(0,C(0,C(W,W)))),W)") 5 == some (parse! "C(C(C(0,0),C(W,W)),W)")
#guard maxBelowN 1 (parse! "C(C(0,0),C(W,C(C(W,W),0)))") 5 == some (parse! "C(0,C(0,C(W,C(C(W,W),0))))")
#guard minAboveN 1 (parse! "C(C(0,0),C(W,C(C(W,W),0)))") 5 == some (parse! "C(C(W,0),C(W,C(C(W,W),0)))")
#guard maxBelowN 1 (parse! "C(W,C(W,C(W,W)))") 3 == some (parse! "C(0,C(W,C(W,W)))")
#guard maxBelowN 1 (parse! "C(W,C(W,C(W,W)))") 4 == some (parse! "C(C(W,0),C(W,C(W,W)))")
#guard maxBelowN 1 (parse! "C(W,C(W,C(W,W)))") 5 == some (parse! "C(C(C(W,W),0),C(W,C(W,W)))")
#guard minAboveN 1 (parse! "C(W,C(W,C(W,W)))") 3 == some (parse! "C(C(0,W),W)")
#guard maxBelowN 1 (parse! "C(C(C(C(C(0,W),0),W),W),W)") 5 == some (parse! "C(C(C(C(W,C(W,0)),W),W),W)")
#guard minAboveN 1 (parse! "C(C(C(C(C(0,W),0),W),W),W)") 5 == some (parse! "C(C(C(C(C(W,W),0),W),W),W)")
#guard maxBelowN 1 (parse! "C(C(C(W,C(W,C(W,W))),W),W)") 5 == some (parse! "C(C(C(0,C(W,C(W,W))),W),W)")
#guard minAboveN 1 (parse! "C(C(C(W,C(W,C(W,W))),W),W)") 5 == some (parse! "C(C(C(C(0,W),W),W),W)")
#guard maxBelowN 1 (parse! "C(C(0,C(C(0,0),0)),C(W,W))") 5 == some (parse! "C(0,C(C(C(0,0),0),C(W,W)))")
#guard minAboveN 1 (parse! "C(C(0,C(C(0,0),0)),C(W,W))") 5 == some (parse! "C(C(C(0,C(0,0)),0),C(W,W))")
#guard maxBelowN 1 (parse! "C(C(0,C(0,W)),W)") 3 == some (parse! "C(W,C(C(0,W),W))")
#guard maxBelowN 1 (parse! "C(C(0,C(0,W)),W)") 4 == some (parse! "C(C(0,W),C(C(0,W),W))")
#guard maxBelowN 1 (parse! "C(C(0,C(0,W)),W)") 5 == some (parse! "C(W,C(C(0,W),C(C(0,W),W)))")
#guard minAboveN 1 (parse! "C(C(0,C(0,W)),W)") 3 == some (parse! "C(C(C(0,0),W),W)")
#guard maxBelowN 1 (parse! "C(W,C(C(C(0,0),C(W,W)),0))") 5 == some (parse! "C(0,C(C(C(0,0),C(W,W)),0))")
#guard minAboveN 1 (parse! "C(W,C(C(C(0,0),C(W,W)),0))") 5 == some (parse! "C(C(0,C(C(0,0),C(W,W))),0)")
#guard maxBelowN 1 (parse! "C(C(0,C(C(C(0,0),0),0)),0)") 5 == some (parse! "C(0,C(C(C(C(0,0),0),0),0))")
#guard minAboveN 1 (parse! "C(C(0,C(C(C(0,0),0),0)),0)") 5 == some (parse! "C(C(C(0,C(C(0,0),0)),0),0)")
#guard maxBelowN 1 (parse! "C(C(C(0,0),C(W,0)),W)") 4 == some (parse! "C(C(0,C(0,C(W,0))),W)")
#guard maxBelowN 1 (parse! "C(C(C(0,0),C(W,0)),W)") 5 == some (parse! "C(C(0,C(0,C(0,C(W,0)))),W)")
#guard minAboveN 1 (parse! "C(C(C(0,0),C(W,0)),W)") 4 == some (parse! "C(C(C(W,0),C(W,0)),W)")
#guard maxBelowN 1 (parse! "C(C(0,0),C(W,0))") 3 == some (parse! "C(0,C(0,C(W,0)))")
#guard maxBelowN 1 (parse! "C(C(0,0),C(W,0))") 4 == some (parse! "C(0,C(0,C(0,C(W,0))))")
#guard maxBelowN 1 (parse! "C(C(0,0),C(W,0))") 5 == some (parse! "C(0,C(0,C(0,C(0,C(W,0)))))")
#guard minAboveN 1 (parse! "C(C(0,0),C(W,0))") 3 == some (parse! "C(C(W,0),C(W,0))")
#guard maxBelowN 1 (parse! "C(C(C(0,0),C(C(W,W),W)),W)") 5 == some (parse! "C(C(0,C(0,C(C(W,W),W))),W)")
#guard minAboveN 1 (parse! "C(C(C(0,0),C(C(W,W),W)),W)") 5 == some (parse! "C(C(C(W,0),C(C(W,W),W)),W)")
#guard maxBelowN 1 (parse! "C(C(C(C(0,C(0,W)),W),0),W)") 5 == some (parse! "C(C(C(W,C(C(0,W),W)),0),W)")
#guard minAboveN 1 (parse! "C(C(C(C(0,C(0,W)),W),0),W)") 5 == some (parse! "C(C(C(C(C(0,0),W),W),0),W)")
#guard maxBelowN 1 (parse! "C(C(0,W),C(C(C(W,W),W),W))") 5 == some (parse! "C(W,C(W,C(C(C(W,W),W),W)))")
#guard minAboveN 1 (parse! "C(C(0,W),C(C(C(W,W),W),W))") 5 == some (parse! "C(C(W,W),C(C(C(W,W),W),W))")
#guard maxBelowN 1 (parse! "C(C(0,C(W,0)),W)") 3 == some (parse! "C(0,C(C(W,0),W))")
#guard maxBelowN 1 (parse! "C(C(0,C(W,0)),W)") 4 == some (parse! "C(C(W,0),C(C(W,0),W))")
#guard maxBelowN 1 (parse! "C(C(0,C(W,0)),W)") 5 == some (parse! "C(0,C(C(W,0),C(C(W,0),W)))")
#guard minAboveN 1 (parse! "C(C(0,C(W,0)),W)") 3 == some (parse! "C(C(W,C(W,0)),W)")
#guard maxBelowN 1 (parse! "C(C(W,C(W,0)),C(C(W,W),W))") 5 == some (parse! "C(C(0,C(W,0)),C(C(W,W),W))")
#guard minAboveN 1 (parse! "C(C(W,C(W,0)),C(C(W,W),W))") 5 == some (parse! "C(C(C(0,W),0),C(C(W,W),W))")
#guard maxBelowN 1 (parse! "C(C(0,0),C(W,C(W,C(W,W))))") 5 == some (parse! "C(0,C(0,C(W,C(W,C(W,W)))))")
#guard minAboveN 1 (parse! "C(C(0,0),C(W,C(W,C(W,W))))") 5 == some (parse! "C(C(W,0),C(W,C(W,C(W,W))))")
#guard maxBelowN 1 (parse! "C(C(0,0),C(W,W))") 3 == some (parse! "C(0,C(0,C(W,W)))")
#guard maxBelowN 1 (parse! "C(C(0,0),C(W,W))") 4 == some (parse! "C(0,C(0,C(0,C(W,W))))")
#guard maxBelowN 1 (parse! "C(C(0,0),C(W,W))") 5 == some (parse! "C(0,C(0,C(0,C(0,C(W,W)))))")
#guard minAboveN 1 (parse! "C(C(0,0),C(W,W))") 3 == some (parse! "C(C(W,0),C(W,W))")
#guard maxBelowN 1 (parse! "C(W,C(C(C(W,W),W),W))") 4 == some (parse! "C(0,C(C(C(W,W),W),W))")
#guard maxBelowN 1 (parse! "C(W,C(C(C(W,W),W),W))") 5 == some (parse! "C(C(W,0),C(C(C(W,W),W),W))")
#guard minAboveN 1 (parse! "C(W,C(C(C(W,W),W),W))") 4 == some (parse! "C(C(0,C(C(W,W),W)),W)")
#guard maxBelowN 1 (parse! "C(C(W,C(W,0)),C(C(0,W),0))") 5 == some (parse! "C(C(0,C(W,0)),C(C(0,W),0))")
#guard minAboveN 1 (parse! "C(C(W,C(W,0)),C(C(0,W),0))") 5 == some (parse! "C(C(C(0,W),0),C(C(0,W),0))")
#guard maxBelowN 1 (parse! "C(C(C(C(0,W),0),C(W,W)),0)") 5 == some (parse! "C(C(C(W,C(W,0)),C(W,W)),0)")
#guard minAboveN 1 (parse! "C(C(C(C(0,W),0),C(W,W)),0)") 5 == some (parse! "C(C(C(C(W,W),0),C(W,W)),0)")
#guard maxBelowN 1 (parse! "C(C(W,0),C(C(W,0),C(W,W)))") 5 == some (parse! "C(C(0,0),C(C(W,0),C(W,W)))")
#guard minAboveN 1 (parse! "C(C(W,0),C(C(W,0),C(W,W)))") 5 == some (parse! "C(C(0,C(W,0)),C(W,W))")
#guard maxBelowN 1 (parse! "C(W,C(W,C(C(C(W,0),W),W)))") 5 == some (parse! "C(0,C(W,C(C(C(W,0),W),W)))")
#guard minAboveN 1 (parse! "C(W,C(W,C(C(C(W,0),W),W)))") 5 == some (parse! "C(C(0,W),C(C(C(W,0),W),W))")
#guard maxBelowN 1 (parse! "C(C(0,C(C(0,C(W,W)),W)),0)") 5 == some (parse! "C(W,C(C(C(0,C(W,W)),W),0))")
#guard minAboveN 1 (parse! "C(C(0,C(C(0,C(W,W)),W)),0)") 5 == some (parse! "C(C(W,C(C(0,C(W,W)),W)),0)")
#guard maxBelowN 1 (parse! "C(C(0,0),C(C(0,W),W))") 4 == some (parse! "C(0,C(0,C(C(0,W),W)))")
#guard maxBelowN 1 (parse! "C(C(0,0),C(C(0,W),W))") 5 == some (parse! "C(0,C(0,C(0,C(C(0,W),W))))")
#guard minAboveN 1 (parse! "C(C(0,0),C(C(0,W),W))") 4 == some (parse! "C(C(W,0),C(C(0,W),W))")
#guard maxBelowN 1 (parse! "C(C(0,C(0,C(C(0,0),W))),0)") 5 == some (parse! "C(W,C(C(0,C(C(0,0),W)),0))")
#guard minAboveN 1 (parse! "C(C(0,C(0,C(C(0,0),W))),0)") 5 == some (parse! "C(C(C(0,0),C(C(0,0),W)),0)")
#guard maxBelowN 1 (parse! "C(C(C(0,0),C(W,0)),C(W,0))") 5 == some (parse! "C(C(0,C(0,C(W,0))),C(W,0))")
#guard minAboveN 1 (parse! "C(C(C(0,0),C(W,0)),C(W,0))") 5 == some (parse! "C(C(C(W,0),C(W,0)),C(W,0))")
#guard maxBelowN 1 (parse! "C(C(C(C(W,0),C(W,0)),W),W)") 5 == some (parse! "C(C(C(C(0,0),C(W,0)),W),W)")
#guard minAboveN 1 (parse! "C(C(C(C(W,0),C(W,0)),W),W)") 5 == some (parse! "C(C(C(W,C(W,0)),W),W)")
#guard maxBelowN 1 (parse! "C(W,C(C(W,C(C(0,W),W)),W))") 5 == some (parse! "C(0,C(C(W,C(C(0,W),W)),W))")
#guard minAboveN 1 (parse! "C(W,C(C(W,C(C(0,W),W)),W))") 5 == some (parse! "C(C(0,C(W,C(C(0,W),W))),W)")
#guard maxBelowN 1 (parse! "C(C(W,0),C(W,C(C(W,W),0)))") 5 == some (parse! "C(C(0,0),C(W,C(C(W,W),0)))")
#guard minAboveN 1 (parse! "C(C(W,0),C(W,C(C(W,W),0)))") 5 == some (parse! "C(W,C(W,C(C(W,W),0)))")
#guard maxBelowN 1 (parse! "C(C(C(C(0,C(0,0)),0),0),W)") 5 == some (parse! "C(C(C(0,C(C(0,0),0)),0),W)")
#guard minAboveN 1 (parse! "C(C(C(C(0,C(0,0)),0),0),W)") 5 == some (parse! "C(C(C(C(C(0,0),0),0),0),W)")
#guard maxBelowN 1 (parse! "C(C(W,C(C(C(0,W),W),0)),W)") 5 == some (parse! "C(C(0,C(C(C(0,W),W),0)),W)")
#guard minAboveN 1 (parse! "C(C(W,C(C(C(0,W),W),0)),W)") 5 == some (parse! "C(C(C(0,C(C(0,W),W)),0),W)")
#guard maxBelowN 1 (parse! "C(C(0,C(C(C(W,0),W),W)),W)") 5 == some (parse! "C(W,C(C(C(C(W,0),W),W),W))")
#guard minAboveN 1 (parse! "C(C(0,C(C(C(W,0),W),W)),W)") 5 == some (parse! "C(C(W,C(C(C(W,0),W),W)),W)")
#guard maxBelowN 1 (parse! "C(C(C(C(0,C(W,0)),W),W),W)") 5 == some (parse! "C(C(C(0,C(C(W,0),W)),W),W)")
#guard minAboveN 1 (parse! "C(C(C(C(0,C(W,0)),W),W),W)") 5 == some (parse! "C(C(C(C(W,C(W,0)),W),W),W)")
#guard maxBelowN 1 (parse! "C(C(C(0,C(0,C(0,W))),W),W)") 5 == some (parse! "C(C(W,C(C(0,C(0,W)),W)),W)")
#guard minAboveN 1 (parse! "C(C(C(0,C(0,C(0,W))),W),W)") 5 == some (parse! "C(C(C(C(0,0),W),W),W)")
#guard maxBelowN 1 (parse! "C(C(W,0),C(C(W,0),C(W,0)))") 5 == some (parse! "C(C(0,0),C(C(W,0),C(W,0)))")
#guard minAboveN 1 (parse! "C(C(W,0),C(C(W,0),C(W,0)))") 5 == some (parse! "C(C(0,C(W,0)),C(W,0))")
#guard maxBelowN 1 (parse! "C(C(C(W,W),0),C(C(W,W),W))") 5 == some (parse! "C(C(C(0,W),0),C(C(W,W),W))")
#guard minAboveN 1 (parse! "C(C(C(W,W),0),C(C(W,W),W))") 5 == some (parse! "C(W,C(C(W,W),W))")
#guard maxBelowN 1 (parse! "C(C(C(0,C(0,C(0,W))),0),W)") 5 == some (parse! "C(C(W,C(C(0,C(0,W)),0)),W)")
#guard minAboveN 1 (parse! "C(C(C(0,C(0,C(0,W))),0),W)") 5 == some (parse! "C(C(C(C(0,0),W),0),W)")
#guard maxBelowN 1 (parse! "C(C(0,W),C(C(0,W),0))") 4 == some (parse! "C(W,C(W,C(C(0,W),0)))")
#guard maxBelowN 1 (parse! "C(C(0,W),C(C(0,W),0))") 5 == some (parse! "C(W,C(W,C(W,C(C(0,W),0))))")
#guard minAboveN 1 (parse! "C(C(0,W),C(C(0,W),0))") 4 == some (parse! "C(C(0,C(0,W)),0)")
#guard maxBelowN 2 (parse! "C(C(0,C(0,C(0,C(W_2,0)))),W_2)") 5 == some (parse! "C(0,C(C(0,C(0,C(W_2,0))),W_2))")
#guard minAboveN 2 (parse! "C(C(0,C(0,C(0,C(W_2,0)))),W_2)") 5 == some (parse! "C(C(C(0,0),C(W_2,0)),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(C(C(0,0),0),0),W_2),0)") 5 == some (parse! "C(C(C(C(0,C(0,0)),0),W_2),0)")
#guard minAboveN 2 (parse! "C(C(C(C(C(0,0),0),0),W_2),0)") 5 == some (parse! "C(C(C(C(W_2,0),0),W_2),0)")
#guard maxBelowN 2 (parse! "C(C(0,C(C(W_2,C(W_2,0)),W_2)),0)") 5 == some (parse! "C(W_2,C(C(C(W_2,C(W_2,0)),W_2),0))")
#guard minAboveN 2 (parse! "C(C(0,C(C(W_2,C(W_2,0)),W_2)),0)") 5 == some (parse! "C(C(C(0,C(W_2,C(W_2,0))),W_2),0)")
#guard maxBelowN 2 (parse! "C(C(C(0,C(W_2,C(W_2,0))),0),W_2)") 5 == some (parse! "C(C(0,C(C(W_2,C(W_2,0)),0)),W_2)")
#guard minAboveN 2 (parse! "C(C(C(0,C(W_2,C(W_2,0))),0),W_2)") 5 == some (parse! "C(C(C(W_2,C(W_2,C(W_2,0))),0),W_2)")
#guard maxBelowN 2 (parse! "C(C(W_2,C(C(0,W_2),0)),C(W_2,0))") 5 == some (parse! "C(C(0,C(C(0,W_2),0)),C(W_2,0))")
#guard minAboveN 2 (parse! "C(C(W_2,C(C(0,W_2),0)),C(W_2,0))") 5 == some (parse! "C(C(C(0,C(0,W_2)),0),C(W_2,0))")
#guard maxBelowN 2 (parse! "C(W_2,C(W_2,C(W_2,C(C(W_2,W_2),0))))") 5 == some (parse! "C(0,C(W_2,C(W_2,C(C(W_2,W_2),0))))")
#guard minAboveN 2 (parse! "C(W_2,C(W_2,C(W_2,C(C(W_2,W_2),0))))") 5 == some (parse! "C(C(0,W_2),C(C(W_2,W_2),0))")
#guard maxBelowN 2 (parse! "C(C(C(W_2,0),0),C(C(W_2,W_2),0))") 5 == some (parse! "C(C(C(0,0),0),C(C(W_2,W_2),0))")
#guard minAboveN 2 (parse! "C(C(C(W_2,0),0),C(C(W_2,W_2),0))") 5 == some (parse! "C(C(W_2,0),C(C(W_2,W_2),0))")
#guard maxBelowN 2 (parse! "C(C(C(0,0),C(C(0,W_2),W_2)),W_2)") 5 == some (parse! "C(C(0,C(0,C(C(0,W_2),W_2))),W_2)")
#guard minAboveN 2 (parse! "C(C(C(0,0),C(C(0,W_2),W_2)),W_2)") 5 == some (parse! "C(C(C(W_2,0),C(C(0,W_2),W_2)),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(W_2,W_2),0),C(W_2,C(W_2,0)))") 5 == some (parse! "C(C(C(0,W_2),0),C(W_2,C(W_2,0)))")
#guard minAboveN 2 (parse! "C(C(C(W_2,W_2),0),C(W_2,C(W_2,0)))") 5 == some (parse! "C(W_2,C(W_2,C(W_2,0)))")
#guard maxBelowN 2 (parse! "C(C(0,0),C(C(C(0,W_2),W_2),W_2))") 5 == some (parse! "C(0,C(0,C(C(C(0,W_2),W_2),W_2)))")
#guard minAboveN 2 (parse! "C(C(0,0),C(C(C(0,W_2),W_2),W_2))") 5 == some (parse! "C(C(W_2,0),C(C(C(0,W_2),W_2),W_2))")
#guard maxBelowN 2 (parse! "C(C(C(C(W_2,W_2),0),W_2),0)") 4 == some (parse! "C(C(C(C(0,W_2),0),W_2),0)")
#guard maxBelowN 2 (parse! "C(C(C(C(W_2,W_2),0),W_2),0)") 5 == some (parse! "C(C(C(C(C(W_2,0),W_2),0),W_2),0)")
#guard minAboveN 2 (parse! "C(C(C(C(W_2,W_2),0),W_2),0)") 4 == some (parse! "C(C(W_2,W_2),0)")
#guard maxBelowN 2 (parse! "C(C(C(C(C(0,W_2),W_2),0),W_2),W_2)") 5 == some (parse! "C(C(C(C(W_2,C(W_2,W_2)),0),W_2),W_2)")
#guard minAboveN 2 (parse! "C(C(C(C(C(0,W_2),W_2),0),W_2),W_2)") 5 == some (parse! "C(C(C(C(C(W_2,W_2),W_2),0),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(C(0,C(C(C(0,0),W_2),0)),W_2)") 5 == some (parse! "C(0,C(C(C(C(0,0),W_2),0),W_2))")
#guard minAboveN 2 (parse! "C(C(0,C(C(C(0,0),W_2),0)),W_2)") 5 == some (parse! "C(C(W_2,C(C(C(0,0),W_2),0)),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(C(0,W_2),0),0),C(W_2,W_2))") 5 == some (parse! "C(C(C(W_2,C(W_2,0)),0),C(W_2,W_2))")
#guard minAboveN 2 (parse! "C(C(C(C(0,W_2),0),0),C(W_2,W_2))") 5 == some (parse! "C(C(C(C(W_2,W_2),0),0),C(W_2,W_2))")
#guard maxBelowN 2 (parse! "C(C(C(W_2,C(W_2,W_2)),0),C(W_2,W_2))") 5 == some (parse! "C(C(C(0,C(W_2,W_2)),0),C(W_2,W_2))")
#guard minAboveN 2 (parse! "C(C(C(W_2,C(W_2,W_2)),0),C(W_2,W_2))") 5 == some (parse! "C(C(C(C(0,W_2),W_2),0),C(W_2,W_2))")
#guard maxBelowN 2 (parse! "C(C(0,0),C(W_2,0))") 3 == some (parse! "C(0,C(0,C(W_2,0)))")
#guard maxBelowN 2 (parse! "C(C(0,0),C(W_2,0))") 4 == some (parse! "C(0,C(0,C(0,C(W_2,0))))")
#guard maxBelowN 2 (parse! "C(C(0,0),C(W_2,0))") 5 == some (parse! "C(0,C(0,C(0,C(0,C(W_2,0)))))")
#guard minAboveN 2 (parse! "C(C(0,0),C(W_2,0))") 3 == some (parse! "C(C(W_2,0),C(W_2,0))")
#guard maxBelowN 2 (parse! "C(C(C(W_2,0),C(C(W_2,W_2),W_2)),0)") 5 == some (parse! "C(C(C(0,0),C(C(W_2,W_2),W_2)),0)")
#guard minAboveN 2 (parse! "C(C(C(W_2,0),C(C(W_2,W_2),W_2)),0)") 5 == some (parse! "C(C(W_2,C(C(W_2,W_2),W_2)),0)")
#guard maxBelowN 2 (parse! "C(C(W_2,C(C(C(0,W_2),W_2),W_2)),0)") 5 == some (parse! "C(C(0,C(C(C(0,W_2),W_2),W_2)),0)")
#guard minAboveN 2 (parse! "C(C(W_2,C(C(C(0,W_2),W_2),W_2)),0)") 5 == some (parse! "C(C(C(0,C(C(0,W_2),W_2)),W_2),0)")
#guard maxBelowN 2 (parse! "C(W_2,C(W_2,0))") 2 == some (parse! "C(0,C(W_2,0))")
#guard maxBelowN 2 (parse! "C(W_2,C(W_2,0))") 3 == some (parse! "C(C(W_2,0),C(W_2,0))")
#guard maxBelowN 2 (parse! "C(W_2,C(W_2,0))") 4 == some (parse! "C(C(C(W_2,W_2),0),C(W_2,0))")
#guard minAboveN 2 (parse! "C(W_2,C(W_2,0))") 2 == some (parse! "C(C(0,W_2),0)")
#guard maxBelowN 2 (parse! "C(C(W_2,0),C(C(W_2,C(W_2,W_2)),0))") 5 == some (parse! "C(C(0,0),C(C(W_2,C(W_2,W_2)),0))")
#guard minAboveN 2 (parse! "C(C(W_2,0),C(C(W_2,C(W_2,W_2)),0))") 5 == some (parse! "C(W_2,C(C(W_2,C(W_2,W_2)),0))")
#guard maxBelowN 2 (parse! "C(W_2,C(C(C(0,W_2),W_2),0))") 4 == some (parse! "C(0,C(C(C(0,W_2),W_2),0))")
#guard maxBelowN 2 (parse! "C(W_2,C(C(C(0,W_2),W_2),0))") 5 == some (parse! "C(C(W_2,0),C(C(C(0,W_2),W_2),0))")
#guard minAboveN 2 (parse! "C(W_2,C(C(C(0,W_2),W_2),0))") 4 == some (parse! "C(C(0,C(C(0,W_2),W_2)),0)")
#guard maxBelowN 2 (parse! "C(C(0,C(C(W_2,0),C(W_2,0))),W_2)") 5 == some (parse! "C(0,C(C(C(W_2,0),C(W_2,0)),W_2))")
#guard minAboveN 2 (parse! "C(C(0,C(C(W_2,0),C(W_2,0))),W_2)") 5 == some (parse! "C(C(C(0,C(W_2,0)),C(W_2,0)),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(C(0,C(0,0)),0),W_2),0)") 5 == some (parse! "C(C(C(0,C(C(0,0),0)),W_2),0)")
#guard minAboveN 2 (parse! "C(C(C(C(0,C(0,0)),0),W_2),0)") 5 == some (parse! "C(C(C(C(C(0,0),0),0),W_2),0)")
#guard maxBelowN 2 (parse! "C(C(W_2,0),C(W_2,C(W_2,C(W_2,0))))") 5 == some (parse! "C(C(0,0),C(W_2,C(W_2,C(W_2,0))))")
#guard minAboveN 2 (parse! "C(C(W_2,0),C(W_2,C(W_2,C(W_2,0))))") 5 == some (parse! "C(W_2,C(W_2,C(W_2,C(W_2,0))))")
#guard maxBelowN 2 (parse! "C(C(0,C(0,C(0,W_2))),W_2)") 4 == some (parse! "C(W_2,C(C(0,C(0,W_2)),W_2))")
#guard maxBelowN 2 (parse! "C(C(0,C(0,C(0,W_2))),W_2)") 5 == some (parse! "C(C(0,W_2),C(C(0,C(0,W_2)),W_2))")
#guard minAboveN 2 (parse! "C(C(0,C(0,C(0,W_2))),W_2)") 4 == some (parse! "C(C(C(0,0),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(0,C(C(0,W_2),0)),0),W_2)") 5 == some (parse! "C(C(0,C(C(C(0,W_2),0),0)),W_2)")
#guard minAboveN 2 (parse! "C(C(C(0,C(C(0,W_2),0)),0),W_2)") 5 == some (parse! "C(C(C(W_2,C(C(0,W_2),0)),0),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(W_2,C(W_2,C(W_2,0))),W_2),W_2)") 5 == some (parse! "C(C(C(0,C(W_2,C(W_2,0))),W_2),W_2)")
#guard minAboveN 2 (parse! "C(C(C(W_2,C(W_2,C(W_2,0))),W_2),W_2)") 5 == some (parse! "C(C(C(C(0,W_2),0),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(C(W_2,C(W_2,C(C(0,W_2),0))),W_2)") 5 == some (parse! "C(C(0,C(W_2,C(C(0,W_2),0))),W_2)")
#guard minAboveN 2 (parse! "C(C(W_2,C(W_2,C(C(0,W_2),0))),W_2)") 5 == some (parse! "C(C(C(0,W_2),C(C(0,W_2),0)),W_2)")
#guard maxBelowN 2 (parse! "C(C(0,C(C(0,C(0,0)),W_2)),W_2)") 5 == some (parse! "C(W_2,C(C(C(0,C(0,0)),W_2),W_2))")
#guard minAboveN 2 (parse! "C(C(0,C(C(0,C(0,0)),W_2)),W_2)") 5 == some (parse! "C(C(C(0,C(0,C(0,0))),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(C(0,C(C(C(0,W_2),W_2),W_2)),0)") 5 == some (parse! "C(W_2,C(C(C(C(0,W_2),W_2),W_2),0))")
#guard minAboveN 2 (parse! "C(C(0,C(C(C(0,W_2),W_2),W_2)),0)") 5 == some (parse! "C(C(W_2,C(C(C(0,W_2),W_2),W_2)),0)")
#guard maxBelowN 2 (parse! "C(C(0,C(0,C(0,0))),C(W_2,W_2))") 5 == some (parse! "C(0,C(C(0,C(0,0)),C(W_2,W_2)))")
#guard minAboveN 2 (parse! "C(C(0,C(0,C(0,0))),C(W_2,W_2))") 5 == some (parse! "C(C(C(0,0),0),C(W_2,W_2))")
#guard maxBelowN 2 (parse! "C(W_2,C(C(0,C(0,W_2)),W_2))") 4 == some (parse! "C(0,C(C(0,C(0,W_2)),W_2))")
#guard maxBelowN 2 (parse! "C(W_2,C(C(0,C(0,W_2)),W_2))") 5 == some (parse! "C(C(W_2,0),C(C(0,C(0,W_2)),W_2))")
#guard minAboveN 2 (parse! "C(W_2,C(C(0,C(0,W_2)),W_2))") 4 == some (parse! "C(C(0,C(0,C(0,W_2))),W_2)")
#guard maxBelowN 2 (parse! "C(C(0,C(C(W_2,0),0)),C(W_2,0))") 5 == some (parse! "C(0,C(C(C(W_2,0),0),C(W_2,0)))")
#guard minAboveN 2 (parse! "C(C(0,C(C(W_2,0),0)),C(W_2,0))") 5 == some (parse! "C(C(C(0,C(W_2,0)),0),C(W_2,0))")
#guard maxBelowN 2 (parse! "C(C(0,0),C(C(C(0,0),W_2),0))") 5 == some (parse! "C(0,C(0,C(C(C(0,0),W_2),0)))")
#guard minAboveN 2 (parse! "C(C(0,0),C(C(C(0,0),W_2),0))") 5 == some (parse! "C(C(W_2,0),C(C(C(0,0),W_2),0))")
#guard maxBelowN 2 (parse! "C(C(C(0,C(W_2,C(W_2,0))),W_2),W_2)") 5 == some (parse! "C(C(0,C(C(W_2,C(W_2,0)),W_2)),W_2)")
#guard minAboveN 2 (parse! "C(C(C(0,C(W_2,C(W_2,0))),W_2),W_2)") 5 == some (parse! "C(C(C(W_2,C(W_2,C(W_2,0))),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(C(W_2,W_2),C(C(C(0,W_2),W_2),W_2))") 5 == some (parse! "C(C(0,W_2),C(C(C(0,W_2),W_2),W_2))")
#guard minAboveN 2 (parse! "C(C(W_2,W_2),C(C(C(0,W_2),W_2),W_2))") 5 == some (parse! "C(C(0,C(C(0,W_2),W_2)),W_2)")
#guard maxBelowN 2 (parse! "C(C(W_2,C(W_2,0)),C(W_2,C(W_2,W_2)))") 5 == some (parse! "C(C(0,C(W_2,0)),C(W_2,C(W_2,W_2)))")
#guard minAboveN 2 (parse! "C(C(W_2,C(W_2,0)),C(W_2,C(W_2,W_2)))") 5 == some (parse! "C(C(C(0,W_2),0),C(W_2,C(W_2,W_2)))")
#guard maxBelowN 2 (parse! "C(C(0,C(0,C(C(W_2,0),W_2))),W_2)") 5 == some (parse! "C(W_2,C(C(0,C(C(W_2,0),W_2)),W_2))")
#guard minAboveN 2 (parse! "C(C(0,C(0,C(C(W_2,0),W_2))),W_2)") 5 == some (parse! "C(C(C(0,0),C(C(W_2,0),W_2)),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(0,C(C(0,W_2),0)),W_2),W_2)") 5 == some (parse! "C(C(0,C(C(C(0,W_2),0),W_2)),W_2)")
#guard minAboveN 2 (parse! "C(C(C(0,C(C(0,W_2),0)),W_2),W_2)") 5 == some (parse! "C(C(C(W_2,C(C(0,W_2),0)),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(0,C(C(W_2,0),W_2)),W_2),0)") 5 == some (parse! "C(C(W_2,C(C(C(W_2,0),W_2),W_2)),0)")
#guard minAboveN 2 (parse! "C(C(C(0,C(C(W_2,0),W_2)),W_2),0)") 5 == some (parse! "C(C(C(C(0,C(W_2,0)),W_2),W_2),0)")
#guard maxBelowN 2 (parse! "C(C(0,0),C(C(W_2,C(W_2,0)),0))") 5 == some (parse! "C(0,C(0,C(C(W_2,C(W_2,0)),0)))")
#guard minAboveN 2 (parse! "C(C(0,0),C(C(W_2,C(W_2,0)),0))") 5 == some (parse! "C(C(W_2,0),C(C(W_2,C(W_2,0)),0))")
#guard maxBelowN 2 (parse! "C(C(C(0,0),W_2),C(C(W_2,W_2),0))") 5 == some (parse! "C(C(0,C(0,W_2)),C(C(W_2,W_2),0))")
#guard minAboveN 2 (parse! "C(C(C(0,0),W_2),C(C(W_2,W_2),0))") 5 == some (parse! "C(C(C(W_2,0),W_2),C(C(W_2,W_2),0))")
#guard maxBelowN 2 (parse! "C(W_2,C(C(C(W_2,W_2),W_2),W_2))") 4 == some (parse! "C(0,C(C(C(W_2,W_2),W_2),W_2))")
#guard maxBelowN 2 (parse! "C(W_2,C(C(C(W_2,W_2),W_2),W_2))") 5 == some (parse! "C(C(W_2,0),C(C(C(W_2,W_2),W_2),W_2))")
#guard minAboveN 2 (parse! "C(W_2,C(C(C(W_2,W_2),W_2),W_2))") 4 == some (parse! "C(C(0,C(C(W_2,W_2),W_2)),W_2)")
#guard maxBelowN 2 (parse! "C(W_2,C(C(W_2,C(C(0,W_2),W_2)),W_2))") 5 == some (parse! "C(0,C(C(W_2,C(C(0,W_2),W_2)),W_2))")
#guard minAboveN 2 (parse! "C(W_2,C(C(W_2,C(C(0,W_2),W_2)),W_2))") 5 == some (parse! "C(C(0,C(W_2,C(C(0,W_2),W_2))),W_2)")
#guard maxBelowN 2 (parse! "C(C(0,C(W_2,C(W_2,0))),C(W_2,0))") 5 == some (parse! "C(0,C(C(W_2,C(W_2,0)),C(W_2,0)))")
#guard minAboveN 2 (parse! "C(C(0,C(W_2,C(W_2,0))),C(W_2,0))") 5 == some (parse! "C(C(W_2,C(W_2,C(W_2,0))),C(W_2,0))")
#guard maxBelowN 2 (parse! "C(C(C(0,0),C(C(W_2,W_2),0)),W_2)") 5 == some (parse! "C(C(0,C(0,C(C(W_2,W_2),0))),W_2)")
#guard minAboveN 2 (parse! "C(C(C(0,0),C(C(W_2,W_2),0)),W_2)") 5 == some (parse! "C(C(C(W_2,0),C(C(W_2,W_2),0)),W_2)")
#guard maxBelowN 2 (parse! "C(C(0,C(C(0,0),0)),C(W_2,0))") 5 == some (parse! "C(0,C(C(C(0,0),0),C(W_2,0)))")
#guard minAboveN 2 (parse! "C(C(0,C(C(0,0),0)),C(W_2,0))") 5 == some (parse! "C(C(C(0,C(0,0)),0),C(W_2,0))")
#guard maxBelowN 2 (parse! "C(C(C(C(C(W_2,0),0),W_2),W_2),0)") 5 == some (parse! "C(C(C(C(C(0,0),0),W_2),W_2),0)")
#guard minAboveN 2 (parse! "C(C(C(C(C(W_2,0),0),W_2),W_2),0)") 5 == some (parse! "C(C(C(C(W_2,0),W_2),W_2),0)")
#guard maxBelowN 2 (parse! "C(W_2,C(W_2,C(C(W_2,W_2),W_2)))") 4 == some (parse! "C(0,C(W_2,C(C(W_2,W_2),W_2)))")
#guard maxBelowN 2 (parse! "C(W_2,C(W_2,C(C(W_2,W_2),W_2)))") 5 == some (parse! "C(C(W_2,0),C(W_2,C(C(W_2,W_2),W_2)))")
#guard minAboveN 2 (parse! "C(W_2,C(W_2,C(C(W_2,W_2),W_2)))") 4 == some (parse! "C(C(0,W_2),C(C(W_2,W_2),W_2))")
#guard maxBelowN 2 (parse! "C(C(C(C(C(0,0),W_2),0),W_2),0)") 5 == some (parse! "C(C(C(C(0,C(0,W_2)),0),W_2),0)")
#guard minAboveN 2 (parse! "C(C(C(C(C(0,0),W_2),0),W_2),0)") 5 == some (parse! "C(C(C(C(C(W_2,0),W_2),0),W_2),0)")
#guard maxBelowN 2 (parse! "C(W_2,C(C(W_2,W_2),0))") 3 == some (parse! "C(0,C(C(W_2,W_2),0))")
#guard maxBelowN 2 (parse! "C(W_2,C(C(W_2,W_2),0))") 4 == some (parse! "C(C(W_2,0),C(C(W_2,W_2),0))")
#guard maxBelowN 2 (parse! "C(W_2,C(C(W_2,W_2),0))") 5 == some (parse! "C(C(C(W_2,W_2),0),C(C(W_2,W_2),0))")
#guard minAboveN 2 (parse! "C(W_2,C(C(W_2,W_2),0))") 3 == some (parse! "C(C(0,C(W_2,W_2)),0)")
#guard maxBelowN 2 (parse! "C(C(0,C(0,C(0,C(W_2,W_2)))),0)") 5 == some (parse! "C(W_2,C(C(0,C(0,C(W_2,W_2))),0))")
#guard minAboveN 2 (parse! "C(C(0,C(0,C(0,C(W_2,W_2)))),0)") 5 == some (parse! "C(C(C(0,0),C(W_2,W_2)),0)")
#guard maxBelowN 2 (parse! "C(C(C(C(0,W_2),0),0),C(W_2,0))") 5 == some (parse! "C(C(C(W_2,C(W_2,0)),0),C(W_2,0))")
#guard minAboveN 2 (parse! "C(C(C(C(0,W_2),0),0),C(W_2,0))") 5 == some (parse! "C(C(C(C(W_2,W_2),0),0),C(W_2,0))")
#guard maxBelowN 2 (parse! "C(C(0,C(C(C(0,W_2),0),W_2)),W_2)") 5 == some (parse! "C(W_2,C(C(C(C(0,W_2),0),W_2),W_2))")
#guard minAboveN 2 (parse! "C(C(0,C(C(C(0,W_2),0),W_2)),W_2)") 5 == some (parse! "C(C(C(0,C(C(0,W_2),0)),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(C(W_2,C(W_2,C(W_2,W_2))),0)") 4 == some (parse! "C(C(0,C(W_2,C(W_2,W_2))),0)")
#guard maxBelowN 2 (parse! "C(C(W_2,C(W_2,C(W_2,W_2))),0)") 5 == some (parse! "C(C(C(W_2,0),C(W_2,C(W_2,W_2))),0)")
#guard minAboveN 2 (parse! "C(C(W_2,C(W_2,C(W_2,W_2))),0)") 4 == some (parse! "C(C(C(0,W_2),W_2),0)")
#guard maxBelowN 2 (parse! "C(C(0,C(C(C(0,0),W_2),W_2)),0)") 5 == some (parse! "C(W_2,C(C(C(C(0,0),W_2),W_2),0))")
#guard minAboveN 2 (parse! "C(C(0,C(C(C(0,0),W_2),W_2)),0)") 5 == some (parse! "C(C(W_2,C(C(C(0,0),W_2),W_2)),0)")
#guard maxBelowN 2 (parse! "C(C(C(0,C(0,W_2)),0),C(W_2,W_2))") 5 == some (parse! "C(C(W_2,C(C(0,W_2),0)),C(W_2,W_2))")
#guard minAboveN 2 (parse! "C(C(C(0,C(0,W_2)),0),C(W_2,W_2))") 5 == some (parse! "C(C(C(C(0,0),W_2),0),C(W_2,W_2))")
#guard maxBelowN 2 (parse! "C(C(0,C(W_2,0)),C(C(W_2,W_2),0))") 5 == some (parse! "C(0,C(C(W_2,0),C(C(W_2,W_2),0)))")
#guard minAboveN 2 (parse! "C(C(0,C(W_2,0)),C(C(W_2,W_2),0))") 5 == some (parse! "C(C(W_2,C(W_2,0)),C(C(W_2,W_2),0))")
#guard maxBelowN 2 (parse! "C(C(W_2,0),C(W_2,C(W_2,C(W_2,W_2))))") 5 == some (parse! "C(C(0,0),C(W_2,C(W_2,C(W_2,W_2))))")
#guard minAboveN 2 (parse! "C(C(W_2,0),C(W_2,C(W_2,C(W_2,W_2))))") 5 == some (parse! "C(W_2,C(W_2,C(W_2,C(W_2,W_2))))")
#guard maxBelowN 2 (parse! "C(C(C(C(0,C(W_2,W_2)),0),0),W_2)") 5 == some (parse! "C(C(C(W_2,C(C(W_2,W_2),0)),0),W_2)")
#guard minAboveN 2 (parse! "C(C(C(C(0,C(W_2,W_2)),0),0),W_2)") 5 == some (parse! "C(C(C(C(W_2,C(W_2,W_2)),0),0),W_2)")
#guard maxBelowN 2 (parse! "C(C(0,C(0,0)),W_2)") 3 == some (parse! "C(0,C(C(0,0),W_2))")
#guard maxBelowN 2 (parse! "C(C(0,C(0,0)),W_2)") 4 == some (parse! "C(C(0,0),C(C(0,0),W_2))")
#guard maxBelowN 2 (parse! "C(C(0,C(0,0)),W_2)") 5 == some (parse! "C(0,C(C(0,0),C(C(0,0),W_2)))")
#guard minAboveN 2 (parse! "C(C(0,C(0,0)),W_2)") 3 == some (parse! "C(C(C(0,0),0),W_2)")
#guard maxBelowN 2 (parse! "C(C(0,0),C(C(0,C(W_2,W_2)),W_2))") 5 == some (parse! "C(0,C(0,C(C(0,C(W_2,W_2)),W_2)))")
#guard minAboveN 2 (parse! "C(C(0,0),C(C(0,C(W_2,W_2)),W_2))") 5 == some (parse! "C(C(W_2,0),C(C(0,C(W_2,W_2)),W_2))")
#guard maxBelowN 2 (parse! "C(C(C(0,C(C(W_2,W_2),W_2)),W_2),W_2)") 5 == some (parse! "C(C(W_2,C(C(C(W_2,W_2),W_2),W_2)),W_2)")
#guard minAboveN 2 (parse! "C(C(C(0,C(C(W_2,W_2),W_2)),W_2),W_2)") 5 == some (parse! "C(C(C(W_2,C(C(W_2,W_2),W_2)),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(C(W_2,C(W_2,C(C(W_2,W_2),W_2))),W_2)") 5 == some (parse! "C(C(0,C(W_2,C(C(W_2,W_2),W_2))),W_2)")
#guard minAboveN 2 (parse! "C(C(W_2,C(W_2,C(C(W_2,W_2),W_2))),W_2)") 5 == some (parse! "C(C(C(0,W_2),C(C(W_2,W_2),W_2)),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(0,C(0,0)),0),C(W_2,0))") 5 == some (parse! "C(C(0,C(C(0,0),0)),C(W_2,0))")
#guard minAboveN 2 (parse! "C(C(C(0,C(0,0)),0),C(W_2,0))") 5 == some (parse! "C(C(C(C(0,0),0),0),C(W_2,0))")
#guard maxBelowN 2 (parse! "C(C(W_2,0),C(C(C(0,W_2),0),W_2))") 5 == some (parse! "C(C(0,0),C(C(C(0,W_2),0),W_2))")
#guard minAboveN 2 (parse! "C(C(W_2,0),C(C(C(0,W_2),0),W_2))") 5 == some (parse! "C(C(0,C(C(0,W_2),0)),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(0,0),0),C(C(W_2,W_2),W_2))") 5 == some (parse! "C(C(0,C(0,0)),C(C(W_2,W_2),W_2))")
#guard minAboveN 2 (parse! "C(C(C(0,0),0),C(C(W_2,W_2),W_2))") 5 == some (parse! "C(C(C(W_2,0),0),C(C(W_2,W_2),W_2))")
#guard maxBelowN 2 (parse! "C(C(0,C(C(W_2,C(W_2,W_2)),0)),W_2)") 5 == some (parse! "C(0,C(C(C(W_2,C(W_2,W_2)),0),W_2))")
#guard minAboveN 2 (parse! "C(C(0,C(C(W_2,C(W_2,W_2)),0)),W_2)") 5 == some (parse! "C(C(W_2,C(C(W_2,C(W_2,W_2)),0)),W_2)")
#guard maxBelowN 2 (parse! "C(C(0,C(C(C(0,W_2),0),0)),W_2)") 5 == some (parse! "C(0,C(C(C(C(0,W_2),0),0),W_2))")
#guard minAboveN 2 (parse! "C(C(0,C(C(C(0,W_2),0),0)),W_2)") 5 == some (parse! "C(C(C(0,C(C(0,W_2),0)),0),W_2)")
#guard maxBelowN 2 (parse! "C(C(0,C(0,C(W_2,C(W_2,0)))),0)") 5 == some (parse! "C(0,C(C(0,C(W_2,C(W_2,0))),0))")
#guard minAboveN 2 (parse! "C(C(0,C(0,C(W_2,C(W_2,0)))),0)") 5 == some (parse! "C(C(C(0,0),C(W_2,C(W_2,0))),0)")
#guard maxBelowN 2 (parse! "C(C(0,W_2),C(C(C(W_2,0),W_2),0))") 5 == some (parse! "C(W_2,C(W_2,C(C(C(W_2,0),W_2),0)))")
#guard minAboveN 2 (parse! "C(C(0,W_2),C(C(C(W_2,0),W_2),0))") 5 == some (parse! "C(C(0,C(C(W_2,0),W_2)),0)")
#guard maxBelowN 2 (parse! "C(C(C(C(C(W_2,W_2),0),W_2),0),W_2)") 5 == some (parse! "C(C(C(C(C(0,W_2),0),W_2),0),W_2)")
#guard minAboveN 2 (parse! "C(C(C(C(C(W_2,W_2),0),W_2),0),W_2)") 5 == some (parse! "C(C(C(W_2,W_2),0),W_2)")
#guard maxBelowN 2 (parse! "C(W_2,C(C(C(C(W_2,0),W_2),W_2),0))") 5 == some (parse! "C(0,C(C(C(C(W_2,0),W_2),W_2),0))")
#guard minAboveN 2 (parse! "C(W_2,C(C(C(C(W_2,0),W_2),W_2),0))") 5 == some (parse! "C(C(0,C(C(C(W_2,0),W_2),W_2)),0)")
#guard maxBelowN 2 (parse! "C(C(W_2,C(C(W_2,W_2),0)),C(W_2,0))") 5 == some (parse! "C(C(0,C(C(W_2,W_2),0)),C(W_2,0))")
#guard minAboveN 2 (parse! "C(C(W_2,C(C(W_2,W_2),0)),C(W_2,0))") 5 == some (parse! "C(C(C(0,C(W_2,W_2)),0),C(W_2,0))")
#guard maxBelowN 2 (parse! "C(W_2,C(C(W_2,C(C(W_2,W_2),W_2)),W_2))") 5 == some (parse! "C(0,C(C(W_2,C(C(W_2,W_2),W_2)),W_2))")
#guard minAboveN 2 (parse! "C(W_2,C(C(W_2,C(C(W_2,W_2),W_2)),W_2))") 5 == some (parse! "C(C(0,C(W_2,C(C(W_2,W_2),W_2))),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(0,0),W_2),W_2)") 3 == some (parse! "C(C(0,C(0,W_2)),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(0,0),W_2),W_2)") 4 == some (parse! "C(C(0,C(0,C(0,W_2))),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(0,0),W_2),W_2)") 5 == some (parse! "C(C(0,C(0,C(0,C(0,W_2)))),W_2)")
#guard minAboveN 2 (parse! "C(C(C(0,0),W_2),W_2)") 3 == some (parse! "C(C(C(W_2,0),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(C(C(0,W_2),0),W_2),0),0)") 5 == some (parse! "C(C(C(C(W_2,C(W_2,0)),W_2),0),0)")
#guard minAboveN 2 (parse! "C(C(C(C(C(0,W_2),0),W_2),0),0)") 5 == some (parse! "C(C(C(W_2,W_2),0),0)")
#guard maxBelowN 2 (parse! "C(C(C(W_2,C(W_2,C(W_2,W_2))),W_2),W_2)") 5 == some (parse! "C(C(C(0,C(W_2,C(W_2,W_2))),W_2),W_2)")
#guard minAboveN 2 (parse! "C(C(C(W_2,C(W_2,C(W_2,W_2))),W_2),W_2)") 5 == some (parse! "C(C(C(C(0,W_2),W_2),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(C(W_2,W_2),0),0),C(W_2,W_2))") 5 == some (parse! "C(C(C(C(0,W_2),0),0),C(W_2,W_2))")
#guard minAboveN 2 (parse! "C(C(C(C(W_2,W_2),0),0),C(W_2,W_2))") 5 == some (parse! "C(C(W_2,0),C(W_2,W_2))")
#guard maxBelowN 2 (parse! "C(C(0,C(0,C(C(0,0),W_2))),0)") 5 == some (parse! "C(W_2,C(C(0,C(C(0,0),W_2)),0))")
#guard minAboveN 2 (parse! "C(C(0,C(0,C(C(0,0),W_2))),0)") 5 == some (parse! "C(C(C(0,0),C(C(0,0),W_2)),0)")
#guard maxBelowN 2 (parse! "C(C(C(C(C(0,0),0),0),0),0)") 5 == some (parse! "C(C(C(C(0,C(0,0)),0),0),0)")
#guard minAboveN 2 (parse! "C(C(C(C(C(0,0),0),0),0),0)") 5 == some (parse! "C(C(W_2,0),0)")
#guard maxBelowN 2 (parse! "C(C(0,C(C(C(0,0),W_2),W_2)),W_2)") 5 == some (parse! "C(W_2,C(C(C(C(0,0),W_2),W_2),W_2))")
#guard minAboveN 2 (parse! "C(C(0,C(C(C(0,0),W_2),W_2)),W_2)") 5 == some (parse! "C(C(W_2,C(C(C(0,0),W_2),W_2)),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(C(C(W_2,0),0),W_2),0),W_2)") 5 == some (parse! "C(C(C(C(C(0,0),0),W_2),0),W_2)")
#guard minAboveN 2 (parse! "C(C(C(C(C(W_2,0),0),W_2),0),W_2)") 5 == some (parse! "C(C(C(C(W_2,0),W_2),0),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(C(C(0,W_2),0),0),W_2),W_2)") 5 == some (parse! "C(C(C(C(W_2,C(W_2,0)),0),W_2),W_2)")
#guard minAboveN 2 (parse! "C(C(C(C(C(0,W_2),0),0),W_2),W_2)") 5 == some (parse! "C(C(C(C(C(W_2,W_2),0),0),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(C(0,0),C(W_2,C(C(0,W_2),0)))") 5 == some (parse! "C(0,C(0,C(W_2,C(C(0,W_2),0))))")
#guard minAboveN 2 (parse! "C(C(0,0),C(W_2,C(C(0,W_2),0)))") 5 == some (parse! "C(C(W_2,0),C(W_2,C(C(0,W_2),0)))")
#guard maxBelowN 2 (parse! "C(C(0,C(0,C(C(W_2,W_2),W_2))),W_2)") 5 == some (parse! "C(W_2,C(C(0,C(C(W_2,W_2),W_2)),W_2))")
#guard minAboveN 2 (parse! "C(C(0,C(0,C(C(W_2,W_2),W_2))),W_2)") 5 == some (parse! "C(C(C(0,0),C(C(W_2,W_2),W_2)),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(C(C(W_2,W_2),0),0),W_2),W_2)") 5 == some (parse! "C(C(C(C(C(0,W_2),0),0),W_2),W_2)")
#guard minAboveN 2 (parse! "C(C(C(C(C(W_2,W_2),0),0),W_2),W_2)") 5 == some (parse! "C(C(C(W_2,0),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(C(0,C(0,C(C(0,W_2),0))),W_2)") 5 == some (parse! "C(0,C(C(0,C(C(0,W_2),0)),W_2))")
#guard minAboveN 2 (parse! "C(C(0,C(0,C(C(0,W_2),0))),W_2)") 5 == some (parse! "C(C(C(0,0),C(C(0,W_2),0)),W_2)")
#guard maxBelowN 2 (parse! "C(W_2,C(C(C(C(0,W_2),W_2),W_2),0))") 5 == some (parse! "C(0,C(C(C(C(0,W_2),W_2),W_2),0))")
#guard minAboveN 2 (parse! "C(W_2,C(C(C(C(0,W_2),W_2),W_2),0))") 5 == some (parse! "C(C(0,C(C(C(0,W_2),W_2),W_2)),0)")
#guard maxBelowN 2 (parse! "C(C(0,W_2),C(C(W_2,W_2),0))") 4 == some (parse! "C(W_2,C(W_2,C(C(W_2,W_2),0)))")
#guard maxBelowN 2 (parse! "C(C(0,W_2),C(C(W_2,W_2),0))") 5 == some (parse! "C(W_2,C(W_2,C(W_2,C(C(W_2,W_2),0))))")
#guard minAboveN 2 (parse! "C(C(0,W_2),C(C(W_2,W_2),0))") 4 == some (parse! "C(C(W_2,W_2),C(C(W_2,W_2),0))")
#guard maxBelowN 2 (parse! "C(C(0,C(C(W_2,C(W_2,0)),0)),W_2)") 5 == some (parse! "C(0,C(C(C(W_2,C(W_2,0)),0),W_2))")
#guard minAboveN 2 (parse! "C(C(0,C(C(W_2,C(W_2,0)),0)),W_2)") 5 == some (parse! "C(C(C(0,C(W_2,C(W_2,0))),0),W_2)")
#guard maxBelowN 2 (parse! "C(C(0,0),C(C(0,0),0))") 4 == some (parse! "C(0,C(0,C(C(0,0),0)))")
#guard maxBelowN 2 (parse! "C(C(0,0),C(C(0,0),0))") 5 == some (parse! "C(0,C(0,C(0,C(C(0,0),0))))")
#guard minAboveN 2 (parse! "C(C(0,0),C(C(0,0),0))") 4 == some (parse! "C(C(0,C(0,0)),0)")
#guard maxBelowN 2 (parse! "C(C(W_2,0),C(C(0,C(W_2,0)),0))") 5 == some (parse! "C(C(0,0),C(C(0,C(W_2,0)),0))")
#guard minAboveN 2 (parse! "C(C(W_2,0),C(C(0,C(W_2,0)),0))") 5 == some (parse! "C(C(0,C(0,C(W_2,0))),0)")
#guard maxBelowN 2 (parse! "C(C(C(C(0,0),0),W_2),W_2)") 4 == some (parse! "C(C(C(0,C(0,0)),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(C(0,0),0),W_2),W_2)") 5 == some (parse! "C(C(C(0,C(0,C(0,0))),W_2),W_2)")
#guard minAboveN 2 (parse! "C(C(C(C(0,0),0),W_2),W_2)") 4 == some (parse! "C(C(C(C(W_2,0),0),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(0,C(C(W_2,W_2),W_2)),0),W_2)") 5 == some (parse! "C(C(W_2,C(C(C(W_2,W_2),W_2),0)),W_2)")
#guard minAboveN 2 (parse! "C(C(C(0,C(C(W_2,W_2),W_2)),0),W_2)") 5 == some (parse! "C(C(C(W_2,C(C(W_2,W_2),W_2)),0),W_2)")
#guard maxBelowN 2 (parse! "C(C(0,0),C(C(C(0,0),0),0))") 5 == some (parse! "C(0,C(0,C(C(C(0,0),0),0)))")
#guard minAboveN 2 (parse! "C(C(0,0),C(C(C(0,0),0),0))") 5 == some (parse! "C(C(0,C(C(0,0),0)),0)")
#guard maxBelowN 2 (parse! "C(C(W_2,C(C(W_2,W_2),W_2)),W_2)") 4 == some (parse! "C(C(0,C(C(W_2,W_2),W_2)),W_2)")
#guard maxBelowN 2 (parse! "C(C(W_2,C(C(W_2,W_2),W_2)),W_2)") 5 == some (parse! "C(C(C(W_2,0),C(C(W_2,W_2),W_2)),W_2)")
#guard minAboveN 2 (parse! "C(C(W_2,C(C(W_2,W_2),W_2)),W_2)") 4 == some (parse! "C(C(C(0,C(W_2,W_2)),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(0,C(0,C(0,W_2))),W_2),W_2)") 5 == some (parse! "C(C(W_2,C(C(0,C(0,W_2)),W_2)),W_2)")
#guard minAboveN 2 (parse! "C(C(C(0,C(0,C(0,W_2))),W_2),W_2)") 5 == some (parse! "C(C(C(C(0,0),W_2),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(0,C(0,C(0,0))),W_2),0)") 5 == some (parse! "C(C(0,C(C(0,C(0,0)),W_2)),0)")
#guard minAboveN 2 (parse! "C(C(C(0,C(0,C(0,0))),W_2),0)") 5 == some (parse! "C(C(C(C(0,0),0),W_2),0)")
#guard maxBelowN 2 (parse! "C(W_2,C(C(C(W_2,0),C(W_2,W_2)),0))") 5 == some (parse! "C(0,C(C(C(W_2,0),C(W_2,W_2)),0))")
#guard minAboveN 2 (parse! "C(W_2,C(C(C(W_2,0),C(W_2,W_2)),0))") 5 == some (parse! "C(C(0,C(C(W_2,0),C(W_2,W_2))),0)")
#guard maxBelowN 2 (parse! "C(C(C(C(0,C(0,W_2)),W_2),0),W_2)") 5 == some (parse! "C(C(C(W_2,C(C(0,W_2),W_2)),0),W_2)")
#guard minAboveN 2 (parse! "C(C(C(C(0,C(0,W_2)),W_2),0),W_2)") 5 == some (parse! "C(C(C(C(C(0,0),W_2),W_2),0),W_2)")
#guard maxBelowN 2 (parse! "C(C(W_2,0),0)") 2 == some (parse! "C(C(0,0),0)")
#guard maxBelowN 2 (parse! "C(C(W_2,0),0)") 3 == some (parse! "C(C(C(0,0),0),0)")
#guard maxBelowN 2 (parse! "C(C(W_2,0),0)") 4 == some (parse! "C(C(C(C(0,0),0),0),0)")
#guard minAboveN 2 (parse! "C(C(W_2,0),0)") 2 == some (parse! "C(W_2,0)")
#guard maxBelowN 2 (parse! "C(W_2,C(W_2,C(W_2,C(C(0,W_2),W_2))))") 5 == some (parse! "C(0,C(W_2,C(W_2,C(C(0,W_2),W_2))))")
#guard minAboveN 2 (parse! "C(W_2,C(W_2,C(W_2,C(C(0,W_2),W_2))))") 5 == some (parse! "C(C(0,W_2),C(C(0,W_2),W_2))")
#guard maxBelowN 2 (parse! "C(C(C(C(W_2,C(W_2,W_2)),0),W_2),0)") 5 == some (parse! "C(C(C(C(0,C(W_2,W_2)),0),W_2),0)")
#guard minAboveN 2 (parse! "C(C(C(C(W_2,C(W_2,W_2)),0),W_2),0)") 5 == some (parse! "C(C(C(C(C(0,W_2),W_2),0),W_2),0)")
#guard maxBelowN 2 (parse! "C(C(C(C(0,C(0,W_2)),W_2),0),0)") 5 == some (parse! "C(C(C(W_2,C(C(0,W_2),W_2)),0),0)")
#guard minAboveN 2 (parse! "C(C(C(C(0,C(0,W_2)),W_2),0),0)") 5 == some (parse! "C(C(C(C(C(0,0),W_2),W_2),0),0)")
#guard maxBelowN 2 (parse! "C(C(C(W_2,C(C(0,W_2),0)),0),W_2)") 5 == some (parse! "C(C(C(0,C(C(0,W_2),0)),0),W_2)")
#guard minAboveN 2 (parse! "C(C(C(W_2,C(C(0,W_2),0)),0),W_2)") 5 == some (parse! "C(C(C(C(0,C(0,W_2)),0),0),W_2)")
#guard maxBelowN 2 (parse! "C(C(0,0),C(C(C(0,W_2),W_2),0))") 5 == some (parse! "C(0,C(0,C(C(C(0,W_2),W_2),0)))")
#guard minAboveN 2 (parse! "C(C(0,0),C(C(C(0,W_2),W_2),0))") 5 == some (parse! "C(C(W_2,0),C(C(C(0,W_2),W_2),0))")
#guard maxBelowN 2 (parse! "C(W_2,C(C(C(0,C(W_2,0)),W_2),W_2))") 5 == some (parse! "C(0,C(C(C(0,C(W_2,0)),W_2),W_2))")
#guard minAboveN 2 (parse! "C(W_2,C(C(C(0,C(W_2,0)),W_2),W_2))") 5 == some (parse! "C(C(0,C(C(0,C(W_2,0)),W_2)),W_2)")
#guard maxBelowN 2 (parse! "C(W_2,C(C(0,C(C(0,W_2),W_2)),0))") 5 == some (parse! "C(0,C(C(0,C(C(0,W_2),W_2)),0))")
#guard minAboveN 2 (parse! "C(W_2,C(C(0,C(C(0,W_2),W_2)),0))") 5 == some (parse! "C(C(0,C(0,C(C(0,W_2),W_2))),0)")
#guard maxBelowN 2 (parse! "C(C(C(W_2,C(W_2,C(W_2,0))),W_2),0)") 5 == some (parse! "C(C(C(0,C(W_2,C(W_2,0))),W_2),0)")
#guard minAboveN 2 (parse! "C(C(C(W_2,C(W_2,C(W_2,0))),W_2),0)") 5 == some (parse! "C(C(C(C(0,W_2),0),W_2),0)")
#guard maxBelowN 2 (parse! "C(C(C(W_2,W_2),0),C(C(0,W_2),0))") 5 == some (parse! "C(C(C(0,W_2),0),C(C(0,W_2),0))")
#guard minAboveN 2 (parse! "C(C(C(W_2,W_2),0),C(C(0,W_2),0))") 5 == some (parse! "C(W_2,C(C(0,W_2),0))")
#guard maxBelowN 2 (parse! "C(W_2,C(W_2,C(C(C(W_2,0),W_2),0)))") 5 == some (parse! "C(0,C(W_2,C(C(C(W_2,0),W_2),0)))")
#guard minAboveN 2 (parse! "C(W_2,C(W_2,C(C(C(W_2,0),W_2),0)))") 5 == some (parse! "C(C(0,W_2),C(C(C(W_2,0),W_2),0))")
#guard maxBelowN 2 (parse! "C(C(C(C(W_2,W_2),W_2),0),W_2)") 4 == some (parse! "C(C(C(C(0,W_2),W_2),0),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(C(W_2,W_2),W_2),0),W_2)") 5 == some (parse! "C(C(C(C(C(W_2,0),W_2),W_2),0),W_2)")
#guard minAboveN 2 (parse! "C(C(C(C(W_2,W_2),W_2),0),W_2)") 4 == some (parse! "C(W_2,W_2)")
#guard maxBelowN 2 (parse! "C(C(C(C(0,C(0,0)),W_2),0),W_2)") 5 == some (parse! "C(C(C(0,C(C(0,0),W_2)),0),W_2)")
#guard minAboveN 2 (parse! "C(C(C(C(0,C(0,0)),W_2),0),W_2)") 5 == some (parse! "C(C(C(C(C(0,0),0),W_2),0),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(0,0),0),C(C(0,W_2),W_2))") 5 == some (parse! "C(C(0,C(0,0)),C(C(0,W_2),W_2))")
#guard minAboveN 2 (parse! "C(C(C(0,0),0),C(C(0,W_2),W_2))") 5 == some (parse! "C(C(C(W_2,0),0),C(C(0,W_2),W_2))")
#guard maxBelowN 2 (parse! "C(C(0,C(C(W_2,0),C(W_2,0))),0)") 5 == some (parse! "C(0,C(C(C(W_2,0),C(W_2,0)),0))")
#guard minAboveN 2 (parse! "C(C(0,C(C(W_2,0),C(W_2,0))),0)") 5 == some (parse! "C(C(C(0,C(W_2,0)),C(W_2,0)),0)")
#guard maxBelowN 2 (parse! "C(C(W_2,0),C(C(W_2,W_2),W_2))") 4 == some (parse! "C(C(0,0),C(C(W_2,W_2),W_2))")
#guard maxBelowN 2 (parse! "C(C(W_2,0),C(C(W_2,W_2),W_2))") 5 == some (parse! "C(C(C(W_2,0),0),C(C(W_2,W_2),W_2))")
#guard minAboveN 2 (parse! "C(C(W_2,0),C(C(W_2,W_2),W_2))") 4 == some (parse! "C(W_2,C(C(W_2,W_2),W_2))")
#guard maxBelowN 2 (parse! "C(C(0,0),C(W_2,C(W_2,0)))") 4 == some (parse! "C(0,C(0,C(W_2,C(W_2,0))))")
#guard maxBelowN 2 (parse! "C(C(0,0),C(W_2,C(W_2,0)))") 5 == some (parse! "C(0,C(0,C(0,C(W_2,C(W_2,0)))))")
#guard minAboveN 2 (parse! "C(C(0,0),C(W_2,C(W_2,0)))") 4 == some (parse! "C(C(W_2,0),C(W_2,C(W_2,0)))")
#guard maxBelowN 2 (parse! "C(C(0,C(C(0,0),0)),0)") 4 == some (parse! "C(0,C(C(C(0,0),0),0))")
#guard maxBelowN 2 (parse! "C(C(0,C(C(0,0),0)),0)") 5 == some (parse! "C(C(0,0),C(C(C(0,0),0),0))")
#guard minAboveN 2 (parse! "C(C(0,C(C(0,0),0)),0)") 4 == some (parse! "C(C(C(0,C(0,0)),0),0)")
#guard maxBelowN 2 (parse! "C(C(W_2,C(C(C(0,W_2),W_2),0)),0)") 5 == some (parse! "C(C(0,C(C(C(0,W_2),W_2),0)),0)")
#guard minAboveN 2 (parse! "C(C(W_2,C(C(C(0,W_2),W_2),0)),0)") 5 == some (parse! "C(C(C(0,C(C(0,W_2),W_2)),0),0)")
#guard maxBelowN 2 (parse! "C(C(0,W_2),C(C(0,C(W_2,W_2)),W_2))") 5 == some (parse! "C(W_2,C(W_2,C(C(0,C(W_2,W_2)),W_2)))")
#guard minAboveN 2 (parse! "C(C(0,W_2),C(C(0,C(W_2,W_2)),W_2))") 5 == some (parse! "C(C(W_2,W_2),C(C(0,C(W_2,W_2)),W_2))")
#guard maxBelowN 2 (parse! "C(C(C(0,C(0,0)),C(W_2,W_2)),0)") 5 == some (parse! "C(C(0,C(C(0,0),C(W_2,W_2))),0)")
#guard minAboveN 2 (parse! "C(C(C(0,C(0,0)),C(W_2,W_2)),0)") 5 == some (parse! "C(C(C(C(0,0),0),C(W_2,W_2)),0)")
#guard maxBelowN 2 (parse! "C(C(C(W_2,0),0),C(W_2,C(W_2,0)))") 5 == some (parse! "C(C(C(0,0),0),C(W_2,C(W_2,0)))")
#guard minAboveN 2 (parse! "C(C(C(W_2,0),0),C(W_2,C(W_2,0)))") 5 == some (parse! "C(C(W_2,0),C(W_2,C(W_2,0)))")
#guard maxBelowN 2 (parse! "C(C(W_2,0),C(C(0,C(W_2,W_2)),0))") 5 == some (parse! "C(C(0,0),C(C(0,C(W_2,W_2)),0))")
#guard minAboveN 2 (parse! "C(C(W_2,0),C(C(0,C(W_2,W_2)),0))") 5 == some (parse! "C(W_2,C(C(0,C(W_2,W_2)),0))")
#guard maxBelowN 2 (parse! "C(C(0,C(W_2,C(C(0,W_2),W_2))),0)") 5 == some (parse! "C(W_2,C(C(W_2,C(C(0,W_2),W_2)),0))")
#guard minAboveN 2 (parse! "C(C(0,C(W_2,C(C(0,W_2),W_2))),0)") 5 == some (parse! "C(C(W_2,C(W_2,C(C(0,W_2),W_2))),0)")
#guard maxBelowN 2 (parse! "C(C(C(C(W_2,0),C(W_2,W_2)),W_2),0)") 5 == some (parse! "C(C(C(C(0,0),C(W_2,W_2)),W_2),0)")
#guard minAboveN 2 (parse! "C(C(C(C(W_2,0),C(W_2,W_2)),W_2),0)") 5 == some (parse! "C(C(C(W_2,C(W_2,W_2)),W_2),0)")
#guard maxBelowN 2 (parse! "C(C(C(0,C(0,0)),0),W_2)") 4 == some (parse! "C(C(0,C(C(0,0),0)),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(0,C(0,0)),0),W_2)") 5 == some (parse! "C(C(C(0,0),C(C(0,0),0)),W_2)")
#guard minAboveN 2 (parse! "C(C(C(0,C(0,0)),0),W_2)") 4 == some (parse! "C(C(C(C(0,0),0),0),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(C(W_2,0),W_2),0),W_2)") 4 == some (parse! "C(C(C(C(0,0),W_2),0),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(C(W_2,0),W_2),0),W_2)") 5 == some (parse! "C(C(C(C(C(W_2,0),0),W_2),0),W_2)")
#guard minAboveN 2 (parse! "C(C(C(C(W_2,0),W_2),0),W_2)") 4 == some (parse! "C(C(C(W_2,W_2),0),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(C(C(0,0),0),W_2),W_2),W_2)") 5 == some (parse! "C(C(C(C(0,C(0,0)),W_2),W_2),W_2)")
#guard minAboveN 2 (parse! "C(C(C(C(C(0,0),0),W_2),W_2),W_2)") 5 == some (parse! "C(C(C(C(C(W_2,0),0),W_2),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(C(W_2,C(W_2,0)),C(W_2,W_2))") 4 == some (parse! "C(C(0,C(W_2,0)),C(W_2,W_2))")
#guard maxBelowN 2 (parse! "C(C(W_2,C(W_2,0)),C(W_2,W_2))") 5 == some (parse! "C(C(C(W_2,0),C(W_2,0)),C(W_2,W_2))")
#guard minAboveN 2 (parse! "C(C(W_2,C(W_2,0)),C(W_2,W_2))") 4 == some (parse! "C(C(C(0,W_2),0),C(W_2,W_2))")
#guard maxBelowN 2 (parse! "C(C(0,C(0,C(0,C(0,0)))),0)") 5 == some (parse! "C(0,C(C(0,C(0,C(0,0))),0))")
#guard minAboveN 2 (parse! "C(C(0,C(0,C(0,C(0,0)))),0)") 5 == some (parse! "C(C(C(0,0),0),0)")
#guard maxBelowN 2 (parse! "C(W_2,C(C(W_2,C(W_2,C(W_2,W_2))),W_2))") 5 == some (parse! "C(0,C(C(W_2,C(W_2,C(W_2,W_2))),W_2))")
#guard minAboveN 2 (parse! "C(W_2,C(C(W_2,C(W_2,C(W_2,W_2))),W_2))") 5 == some (parse! "C(C(0,C(W_2,C(W_2,C(W_2,W_2)))),W_2)")
#guard maxBelowN 2 (parse! "C(C(0,W_2),C(C(C(0,W_2),W_2),W_2))") 5 == some (parse! "C(W_2,C(W_2,C(C(C(0,W_2),W_2),W_2)))")
#guard minAboveN 2 (parse! "C(C(0,W_2),C(C(C(0,W_2),W_2),W_2))") 5 == some (parse! "C(C(W_2,W_2),C(C(C(0,W_2),W_2),W_2))")
#guard maxBelowN 2 (parse! "C(C(0,C(W_2,0)),C(C(0,W_2),0))") 5 == some (parse! "C(0,C(C(W_2,0),C(C(0,W_2),0)))")
#guard minAboveN 2 (parse! "C(C(0,C(W_2,0)),C(C(0,W_2),0))") 5 == some (parse! "C(C(W_2,C(W_2,0)),C(C(0,W_2),0))")
#guard maxBelowN 2 (parse! "C(C(C(0,0),0),C(W_2,0))") 4 == some (parse! "C(C(0,C(0,0)),C(W_2,0))")
#guard maxBelowN 2 (parse! "C(C(C(0,0),0),C(W_2,0))") 5 == some (parse! "C(C(0,C(0,C(0,0))),C(W_2,0))")
#guard minAboveN 2 (parse! "C(C(C(0,0),0),C(W_2,0))") 4 == some (parse! "C(C(C(W_2,0),0),C(W_2,0))")
#guard maxBelowN 2 (parse! "C(C(C(0,C(W_2,0)),W_2),W_2)") 4 == some (parse! "C(C(0,C(C(W_2,0),W_2)),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(0,C(W_2,0)),W_2),W_2)") 5 == some (parse! "C(C(C(W_2,0),C(C(W_2,0),W_2)),W_2)")
#guard minAboveN 2 (parse! "C(C(C(0,C(W_2,0)),W_2),W_2)") 4 == some (parse! "C(C(C(W_2,C(W_2,0)),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(W_2,C(C(W_2,W_2),W_2))") 3 == some (parse! "C(0,C(C(W_2,W_2),W_2))")
#guard maxBelowN 2 (parse! "C(W_2,C(C(W_2,W_2),W_2))") 4 == some (parse! "C(C(W_2,0),C(C(W_2,W_2),W_2))")
#guard maxBelowN 2 (parse! "C(W_2,C(C(W_2,W_2),W_2))") 5 == some (parse! "C(C(C(W_2,W_2),0),C(C(W_2,W_2),W_2))")
#guard minAboveN 2 (parse! "C(W_2,C(C(W_2,W_2),W_2))") 3 == some (parse! "C(C(0,C(W_2,W_2)),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(0,C(0,0)),0),C(W_2,W_2))") 5 == some (parse! "C(C(0,C(C(0,0),0)),C(W_2,W_2))")
#guard minAboveN 2 (parse! "C(C(C(0,C(0,0)),0),C(W_2,W_2))") 5 == some (parse! "C(C(C(C(0,0),0),0),C(W_2,W_2))")
#guard maxBelowN 2 (parse! "C(C(C(0,C(C(0,0),W_2)),0),W_2)") 5 == some (parse! "C(C(W_2,C(C(C(0,0),W_2),0)),W_2)")
#guard minAboveN 2 (parse! "C(C(C(0,C(C(0,0),W_2)),0),W_2)") 5 == some (parse! "C(C(C(C(0,C(0,0)),W_2),0),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(C(W_2,W_2),W_2),0),C(W_2,W_2))") 5 == some (parse! "C(C(C(C(0,W_2),W_2),0),C(W_2,W_2))")
#guard minAboveN 2 (parse! "C(C(C(C(W_2,W_2),W_2),0),C(W_2,W_2))") 5 == some (parse! "C(W_2,C(W_2,W_2))")
#guard maxBelowN 2 (parse! "C(C(0,0),C(W_2,C(W_2,C(W_2,W_2))))") 5 == some (parse! "C(0,C(0,C(W_2,C(W_2,C(W_2,W_2)))))")
#guard minAboveN 2 (parse! "C(C(0,0),C(W_2,C(W_2,C(W_2,W_2))))") 5 == some (parse! "C(C(W_2,0),C(W_2,C(W_2,C(W_2,W_2))))")
#guard maxBelowN 2 (parse! "C(C(C(C(0,W_2),0),0),W_2)") 4 == some (parse! "C(C(C(W_2,C(W_2,0)),0),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(C(0,W_2),0),0),W_2)") 5 == some (parse! "C(C(C(W_2,C(W_2,C(W_2,0))),0),W_2)")
#guard minAboveN 2 (parse! "C(C(C(C(0,W_2),0),0),W_2)") 4 == some (parse! "C(C(C(C(W_2,W_2),0),0),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(C(C(W_2,W_2),0),W_2),W_2),W_2)") 5 == some (parse! "C(C(C(C(C(0,W_2),0),W_2),W_2),W_2)")
#guard minAboveN 2 (parse! "C(C(C(C(C(W_2,W_2),0),W_2),W_2),W_2)") 5 == some (parse! "C(C(C(W_2,W_2),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(C(W_2,0),C(C(C(0,0),W_2),0))") 5 == some (parse! "C(C(0,0),C(C(C(0,0),W_2),0))")
#guard minAboveN 2 (parse! "C(C(W_2,0),C(C(C(0,0),W_2),0))") 5 == some (parse! "C(W_2,C(C(C(0,0),W_2),0))")
#guard maxBelowN 2 (parse! "C(C(W_2,C(C(C(W_2,0),W_2),0)),0)") 5 == some (parse! "C(C(0,C(C(C(W_2,0),W_2),0)),0)")
#guard minAboveN 2 (parse! "C(C(W_2,C(C(C(W_2,0),W_2),0)),0)") 5 == some (parse! "C(C(C(0,C(C(W_2,0),W_2)),0),0)")
#guard maxBelowN 2 (parse! "C(W_2,C(C(0,C(C(W_2,0),W_2)),0))") 5 == some (parse! "C(0,C(C(0,C(C(W_2,0),W_2)),0))")
#guard minAboveN 2 (parse! "C(W_2,C(C(0,C(C(W_2,0),W_2)),0))") 5 == some (parse! "C(C(0,C(0,C(C(W_2,0),W_2))),0)")
#guard maxBelowN 2 (parse! "C(C(C(0,C(C(0,0),W_2)),W_2),0)") 5 == some (parse! "C(C(W_2,C(C(C(0,0),W_2),W_2)),0)")
#guard minAboveN 2 (parse! "C(C(C(0,C(C(0,0),W_2)),W_2),0)") 5 == some (parse! "C(C(C(C(0,C(0,0)),W_2),W_2),0)")
#guard maxBelowN 2 (parse! "C(W_2,C(W_2,C(W_2,C(C(0,W_2),0))))") 5 == some (parse! "C(0,C(W_2,C(W_2,C(C(0,W_2),0))))")
#guard minAboveN 2 (parse! "C(W_2,C(W_2,C(W_2,C(C(0,W_2),0))))") 5 == some (parse! "C(C(0,W_2),C(C(0,W_2),0))")
#guard maxBelowN 2 (parse! "C(C(W_2,0),C(C(W_2,0),0))") 4 == some (parse! "C(C(0,0),C(C(W_2,0),0))")
#guard maxBelowN 2 (parse! "C(C(W_2,0),C(C(W_2,0),0))") 5 == some (parse! "C(C(C(W_2,0),0),C(C(W_2,0),0))")
#guard minAboveN 2 (parse! "C(C(W_2,0),C(C(W_2,0),0))") 4 == some (parse! "C(C(0,C(W_2,0)),0)")
#guard maxBelowN 2 (parse! "C(C(0,C(W_2,0)),C(W_2,C(W_2,0)))") 5 == some (parse! "C(0,C(C(W_2,0),C(W_2,C(W_2,0))))")
#guard minAboveN 2 (parse! "C(C(0,C(W_2,0)),C(W_2,C(W_2,0)))") 5 == some (parse! "C(C(W_2,C(W_2,0)),C(W_2,C(W_2,0)))")
#guard maxBelowN 2 (parse! "C(C(C(0,0),C(W_2,W_2)),W_2)") 4 == some (parse! "C(C(0,C(0,C(W_2,W_2))),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(0,0),C(W_2,W_2)),W_2)") 5 == some (parse! "C(C(0,C(0,C(0,C(W_2,W_2)))),W_2)")
#guard minAboveN 2 (parse! "C(C(C(0,0),C(W_2,W_2)),W_2)") 4 == some (parse! "C(C(C(W_2,0),C(W_2,W_2)),W_2)")
#guard maxBelowN 2 (parse! "C(W_2,C(W_2,C(W_2,0)))") 3 == some (parse! "C(0,C(W_2,C(W_2,0)))")
#guard maxBelowN 2 (parse! "C(W_2,C(W_2,C(W_2,0)))") 4 == some (parse! "C(C(W_2,0),C(W_2,C(W_2,0)))")
#guard maxBelowN 2 (parse! "C(W_2,C(W_2,C(W_2,0)))") 5 == some (parse! "C(C(C(W_2,W_2),0),C(W_2,C(W_2,0)))")
#guard minAboveN 2 (parse! "C(W_2,C(W_2,C(W_2,0)))") 3 == some (parse! "C(C(0,W_2),0)")
#guard maxBelowN 2 (parse! "C(C(W_2,0),C(W_2,C(C(0,W_2),0)))") 5 == some (parse! "C(C(0,0),C(W_2,C(C(0,W_2),0)))")
#guard minAboveN 2 (parse! "C(C(W_2,0),C(W_2,C(C(0,W_2),0)))") 5 == some (parse! "C(W_2,C(W_2,C(C(0,W_2),0)))")
#guard maxBelowN 2 (parse! "C(C(C(W_2,C(W_2,C(W_2,W_2))),W_2),0)") 5 == some (parse! "C(C(C(0,C(W_2,C(W_2,W_2))),W_2),0)")
#guard minAboveN 2 (parse! "C(C(C(W_2,C(W_2,C(W_2,W_2))),W_2),0)") 5 == some (parse! "C(C(C(C(0,W_2),W_2),W_2),0)")
#guard maxBelowN 2 (parse! "C(W_2,C(C(0,C(W_2,C(W_2,W_2))),W_2))") 5 == some (parse! "C(0,C(C(0,C(W_2,C(W_2,W_2))),W_2))")
#guard minAboveN 2 (parse! "C(W_2,C(C(0,C(W_2,C(W_2,W_2))),W_2))") 5 == some (parse! "C(C(0,C(0,C(W_2,C(W_2,W_2)))),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(0,W_2),0),C(W_2,C(W_2,0)))") 5 == some (parse! "C(C(W_2,C(W_2,0)),C(W_2,C(W_2,0)))")
#guard minAboveN 2 (parse! "C(C(C(0,W_2),0),C(W_2,C(W_2,0)))") 5 == some (parse! "C(C(C(W_2,W_2),0),C(W_2,C(W_2,0)))")
#guard maxBelowN 2 (parse! "C(W_2,C(C(0,W_2),0))") 3 == some (parse! "C(0,C(C(0,W_2),0))")
#guard maxBelowN 2 (parse! "C(W_2,C(C(0,W_2),0))") 4 == some (parse! "C(C(W_2,0),C(C(0,W_2),0))")
#guard maxBelowN 2 (parse! "C(W_2,C(C(0,W_2),0))") 5 == some (parse! "C(C(C(W_2,W_2),0),C(C(0,W_2),0))")
#guard minAboveN 2 (parse! "C(W_2,C(C(0,W_2),0))") 3 == some (parse! "C(C(0,C(0,W_2)),0)")
#guard maxBelowN 2 (parse! "C(C(C(C(W_2,C(W_2,W_2)),0),0),W_2)") 5 == some (parse! "C(C(C(C(0,C(W_2,W_2)),0),0),W_2)")
#guard minAboveN 2 (parse! "C(C(C(C(W_2,C(W_2,W_2)),0),0),W_2)") 5 == some (parse! "C(C(C(C(C(0,W_2),W_2),0),0),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(0,C(0,C(0,0))),W_2),W_2)") 5 == some (parse! "C(C(0,C(C(0,C(0,0)),W_2)),W_2)")
#guard minAboveN 2 (parse! "C(C(C(0,C(0,C(0,0))),W_2),W_2)") 5 == some (parse! "C(C(C(C(0,0),0),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(0,W_2),W_2),W_2)") 3 == some (parse! "C(C(W_2,C(W_2,W_2)),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(0,W_2),W_2),W_2)") 4 == some (parse! "C(C(W_2,C(W_2,C(W_2,W_2))),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(0,W_2),W_2),W_2)") 5 == some (parse! "C(C(W_2,C(W_2,C(W_2,C(W_2,W_2)))),W_2)")
#guard minAboveN 2 (parse! "C(C(C(0,W_2),W_2),W_2)") 3 == some (parse! "C(C(C(W_2,W_2),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(W_2,C(C(C(W_2,C(W_2,W_2)),W_2),0))") 5 == some (parse! "C(0,C(C(C(W_2,C(W_2,W_2)),W_2),0))")
#guard minAboveN 2 (parse! "C(W_2,C(C(C(W_2,C(W_2,W_2)),W_2),0))") 5 == some (parse! "C(C(0,C(C(W_2,C(W_2,W_2)),W_2)),0)")
#guard maxBelowN 2 (parse! "C(C(C(C(W_2,0),C(W_2,0)),W_2),0)") 5 == some (parse! "C(C(C(C(0,0),C(W_2,0)),W_2),0)")
#guard minAboveN 2 (parse! "C(C(C(C(W_2,0),C(W_2,0)),W_2),0)") 5 == some (parse! "C(C(C(W_2,C(W_2,0)),W_2),0)")
#guard maxBelowN 2 (parse! "C(C(0,C(C(0,W_2),W_2)),W_2)") 4 == some (parse! "C(W_2,C(C(C(0,W_2),W_2),W_2))")
#guard maxBelowN 2 (parse! "C(C(0,C(C(0,W_2),W_2)),W_2)") 5 == some (parse! "C(C(W_2,W_2),C(C(C(0,W_2),W_2),W_2))")
#guard minAboveN 2 (parse! "C(C(0,C(C(0,W_2),W_2)),W_2)") 4 == some (parse! "C(C(W_2,C(C(0,W_2),W_2)),W_2)")
#guard maxBelowN 2 (parse! "C(C(0,W_2),0)") 2 == some (parse! "C(W_2,C(W_2,0))")
#guard maxBelowN 2 (parse! "C(C(0,W_2),0)") 3 == some (parse! "C(W_2,C(W_2,C(W_2,0)))")
#guard maxBelowN 2 (parse! "C(C(0,W_2),0)") 4 == some (parse! "C(W_2,C(W_2,C(W_2,C(W_2,0))))")
#guard minAboveN 2 (parse! "C(C(0,W_2),0)") 2 == some (parse! "C(C(W_2,W_2),0)")
#guard maxBelowN 2 (parse! "C(C(C(C(0,0),C(W_2,0)),0),W_2)") 5 == some (parse! "C(C(C(0,C(0,C(W_2,0))),0),W_2)")
#guard minAboveN 2 (parse! "C(C(C(C(0,0),C(W_2,0)),0),W_2)") 5 == some (parse! "C(C(C(C(W_2,0),C(W_2,0)),0),W_2)")
#guard maxBelowN 2 (parse! "C(W_2,C(C(C(W_2,0),W_2),0))") 4 == some (parse! "C(0,C(C(C(W_2,0),W_2),0))")
#guard maxBelowN 2 (parse! "C(W_2,C(C(C(W_2,0),W_2),0))") 5 == some (parse! "C(C(W_2,0),C(C(C(W_2,0),W_2),0))")
#guard minAboveN 2 (parse! "C(W_2,C(C(C(W_2,0),W_2),0))") 4 == some (parse! "C(C(0,C(C(W_2,0),W_2)),0)")
#guard maxBelowN 2 (parse! "C(C(0,C(C(C(W_2,0),W_2),W_2)),0)") 5 == some (parse! "C(W_2,C(C(C(C(W_2,0),W_2),W_2),0))")
#guard minAboveN 2 (parse! "C(C(0,C(C(C(W_2,0),W_2),W_2)),0)") 5 == some (parse! "C(C(W_2,C(C(C(W_2,0),W_2),W_2)),0)")
#guard maxBelowN 2 (parse! "C(C(C(C(C(W_2,W_2),W_2),W_2),W_2),0)") 5 == some (parse! "C(C(C(C(C(0,W_2),W_2),W_2),W_2),0)")
#guard minAboveN 2 (parse! "C(C(C(C(C(W_2,W_2),W_2),W_2),W_2),0)") 5 == some (parse! "W_2")
#guard maxBelowN 2 (parse! "C(C(C(W_2,0),W_2),C(C(W_2,W_2),W_2))") 5 == some (parse! "C(C(C(0,0),W_2),C(C(W_2,W_2),W_2))")
#guard minAboveN 2 (parse! "C(C(C(W_2,0),W_2),C(C(W_2,W_2),W_2))") 5 == some (parse! "C(C(W_2,W_2),C(C(W_2,W_2),W_2))")
#guard maxBelowN 2 (parse! "C(C(W_2,C(C(C(0,W_2),W_2),0)),W_2)") 5 == some (parse! "C(C(0,C(C(C(0,W_2),W_2),0)),W_2)")
#guard minAboveN 2 (parse! "C(C(W_2,C(C(C(0,W_2),W_2),0)),W_2)") 5 == some (parse! "C(C(C(0,C(C(0,W_2),W_2)),0),W_2)")
#guard maxBelowN 2 (parse! "C(C(W_2,W_2),0)") 2 == some (parse! "C(C(0,W_2),0)")
#guard maxBelowN 2 (parse! "C(C(W_2,W_2),0)") 3 == some (parse! "C(C(C(W_2,0),W_2),0)")
#guard maxBelowN 2 (parse! "C(C(W_2,W_2),0)") 4 == some (parse! "C(C(C(C(W_2,W_2),0),W_2),0)")
#guard minAboveN 2 (parse! "C(C(W_2,W_2),0)") 2 == some (parse! "W_2")
#guard maxBelowN 2 (parse! "C(C(C(C(C(0,0),W_2),0),W_2),W_2)") 5 == some (parse! "C(C(C(C(0,C(0,W_2)),0),W_2),W_2)")
#guard minAboveN 2 (parse! "C(C(C(C(C(0,0),W_2),0),W_2),W_2)") 5 == some (parse! "C(C(C(C(C(W_2,0),W_2),0),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(W_2,C(C(0,C(C(W_2,W_2),W_2)),W_2))") 5 == some (parse! "C(0,C(C(0,C(C(W_2,W_2),W_2)),W_2))")
#guard minAboveN 2 (parse! "C(W_2,C(C(0,C(C(W_2,W_2),W_2)),W_2))") 5 == some (parse! "C(C(0,C(0,C(C(W_2,W_2),W_2))),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(C(0,0),0),C(W_2,0)),0)") 5 == some (parse! "C(C(C(0,C(0,0)),C(W_2,0)),0)")
#guard minAboveN 2 (parse! "C(C(C(C(0,0),0),C(W_2,0)),0)") 5 == some (parse! "C(C(C(C(W_2,0),0),C(W_2,0)),0)")
#guard maxBelowN 2 (parse! "C(C(0,C(C(W_2,W_2),0)),W_2)") 4 == some (parse! "C(0,C(C(C(W_2,W_2),0),W_2))")
#guard maxBelowN 2 (parse! "C(C(0,C(C(W_2,W_2),0)),W_2)") 5 == some (parse! "C(C(W_2,0),C(C(C(W_2,W_2),0),W_2))")
#guard minAboveN 2 (parse! "C(C(0,C(C(W_2,W_2),0)),W_2)") 4 == some (parse! "C(C(W_2,C(C(W_2,W_2),0)),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(C(C(W_2,W_2),W_2),0),0),W_2)") 5 == some (parse! "C(C(C(C(C(0,W_2),W_2),0),0),W_2)")
#guard minAboveN 2 (parse! "C(C(C(C(C(W_2,W_2),W_2),0),0),W_2)") 5 == some (parse! "C(C(W_2,0),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(0,C(W_2,0)),C(W_2,W_2)),0)") 5 == some (parse! "C(C(0,C(C(W_2,0),C(W_2,W_2))),0)")
#guard minAboveN 2 (parse! "C(C(C(0,C(W_2,0)),C(W_2,W_2)),0)") 5 == some (parse! "C(C(C(W_2,C(W_2,0)),C(W_2,W_2)),0)")
#guard maxBelowN 2 (parse! "C(C(C(C(C(W_2,0),W_2),W_2),W_2),W_2)") 5 == some (parse! "C(C(C(C(C(0,0),W_2),W_2),W_2),W_2)")
#guard minAboveN 2 (parse! "C(C(C(C(C(W_2,0),W_2),W_2),W_2),W_2)") 5 == some (parse! "C(C(C(C(W_2,W_2),W_2),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(W_2,C(W_2,0)),W_2),W_2)") 4 == some (parse! "C(C(C(0,C(W_2,0)),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(W_2,C(W_2,0)),W_2),W_2)") 5 == some (parse! "C(C(C(C(W_2,0),C(W_2,0)),W_2),W_2)")
#guard minAboveN 2 (parse! "C(C(C(W_2,C(W_2,0)),W_2),W_2)") 4 == some (parse! "C(C(C(C(0,W_2),0),W_2),W_2)")
#guard maxBelowN 2 (parse! "C(C(C(C(C(0,0),0),W_2),0),W_2)") 5 == some (parse! "C(C(C(C(0,C(0,0)),W_2),0),W_2)")
#guard minAboveN 2 (parse! "C(C(C(C(C(0,0),0),W_2),0),W_2)") 5 == some (parse! "C(C(C(C(C(W_2,0),0),W_2),0),W_2)")
#guard maxBelowN 2 (parse! "C(C(0,C(C(C(0,W_2),W_2),0)),0)") 5 == some (parse! "C(0,C(C(C(C(0,W_2),W_2),0),0))")
#guard minAboveN 2 (parse! "C(C(0,C(C(C(0,W_2),W_2),0)),0)") 5 == some (parse! "C(C(W_2,C(C(C(0,W_2),W_2),0)),0)")
#guard maxBelowN 2 (parse! "C(C(0,C(C(0,0),C(W_2,W_2))),W_2)") 5 == some (parse! "C(W_2,C(C(C(0,0),C(W_2,W_2)),W_2))")
#guard minAboveN 2 (parse! "C(C(0,C(C(0,0),C(W_2,W_2))),W_2)") 5 == some (parse! "C(C(C(0,C(0,0)),C(W_2,W_2)),W_2)")
#guard maxBelowN 2 (parse! "C(C(W_2,C(C(0,C(0,W_2)),0)),W_2)") 5 == some (parse! "C(C(0,C(C(0,C(0,W_2)),0)),W_2)")
#guard minAboveN 2 (parse! "C(C(W_2,C(C(0,C(0,W_2)),0)),W_2)") 5 == some (parse! "C(C(C(0,C(0,C(0,W_2))),0),W_2)")
#guard maxBelowN 2 (parse! "C(C(0,W_2),C(C(C(W_2,W_2),W_2),0))") 5 == some (parse! "C(W_2,C(W_2,C(C(C(W_2,W_2),W_2),0)))")
#guard minAboveN 2 (parse! "C(C(0,W_2),C(C(C(W_2,W_2),W_2),0))") 5 == some (parse! "C(C(W_2,W_2),C(C(C(W_2,W_2),W_2),0))")
#guard maxBelowN 2 (parse! "C(C(C(C(0,W_2),0),W_2),0)") 4 == some (parse! "C(C(C(W_2,C(W_2,0)),W_2),0)")
#guard maxBelowN 2 (parse! "C(C(C(C(0,W_2),0),W_2),0)") 5 == some (parse! "C(C(C(W_2,C(W_2,C(W_2,0))),W_2),0)")
#guard minAboveN 2 (parse! "C(C(C(C(0,W_2),0),W_2),0)") 4 == some (parse! "C(C(C(C(W_2,W_2),0),W_2),0)")
#guard maxBelowN 2 (parse! "C(W_2,C(C(0,C(W_2,C(W_2,W_2))),0))") 5 == some (parse! "C(0,C(C(0,C(W_2,C(W_2,W_2))),0))")
#guard minAboveN 2 (parse! "C(W_2,C(C(0,C(W_2,C(W_2,W_2))),0))") 5 == some (parse! "C(C(0,C(0,C(W_2,C(W_2,W_2)))),0)")
#guard maxBelowN 2 (parse! "C(C(C(C(C(W_2,0),0),W_2),0),0)") 5 == some (parse! "C(C(C(C(C(0,0),0),W_2),0),0)")
#guard minAboveN 2 (parse! "C(C(C(C(C(W_2,0),0),W_2),0),0)") 5 == some (parse! "C(C(C(C(W_2,0),W_2),0),0)")
#guard maxBelowN 2 (parse! "C(C(C(C(0,0),C(W_2,W_2)),0),0)") 5 == some (parse! "C(C(C(0,C(0,C(W_2,W_2))),0),0)")
#guard minAboveN 2 (parse! "C(C(C(C(0,0),C(W_2,W_2)),0),0)") 5 == some (parse! "C(C(C(C(W_2,0),C(W_2,W_2)),0),0)")
#guard maxBelowN 2 (parse! "C(C(0,0),C(C(0,0),C(W_2,W_2)))") 5 == some (parse! "C(0,C(0,C(C(0,0),C(W_2,W_2))))")
#guard minAboveN 2 (parse! "C(C(0,0),C(C(0,0),C(W_2,W_2)))") 5 == some (parse! "C(C(0,C(0,0)),C(W_2,W_2))")
