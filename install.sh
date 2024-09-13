#!/bin/bash
#
# This file encrypted at Fri Sep 13 19:41:35 WIB 2024 by
# +------------------------------------------------------+
# | Author: Rerechan02                                   |
# | Reguon: Indonesia ( Asia Tenggara )                  |
# | Chanel: https://t.me/fn_project / Admin  @Rerechan02 |
# +------------------------------------------------------+
# Don't forget follow me on:
# -  https://github.com/Rerechan02
# Sponsor this project:
# -  https://t.me/fn_project/245
# -  https://prof.rerechan02.com

skip=70
tab='	'
nl='
'
IFS=" $tab$nl"

# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @Rerechan02 / widyabakti02@gmail.com
USER=${USER:-$(id -u -n)}
# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @Rerechan02 / widyabakti02@gmail.com
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# PC does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

shctmpdir=
trap 'res=$?
  test -n "$shctmpdir" && rm -fr "$shctmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  shctmpdir=`mktemp -d "${TMPDIR}shctmpXXXXXXXXX"`
else
  shctmpdir=${TMPDIR}shctmp$$; mkdir $shctmpdir
fi || { (exit 127); exit 127; }

shctmp=$shctmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$shctmp" && rm -r "$shctmp";;
*/*) shctmp=$shctmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "fn project | 5Y:ZB:gd:91:zP:br:ZH:nB:Ef:LC:y1:oE:7M:yU:yV:57:sx:4e:ZK:Ml:vQ:QQ:gR:lD:jU:wz:Zi:jb:x0:xo:jh:c5:tP:cI:Ed:lE:Fh:Zg:dW:Js:a4:0p:1v:e2:SU:WC:Aq:2f:h2:PA:hP:Iw:jR:c2:mu:1D:pW:xh:dS:Y8:Eo:Ux:2H:f7:F8:8N:Lf:E6:zc:hy:I3:xi:wW:WJ:2d:3l:It:2G:6m:jv:Q9:GK:Wz:5V:ak:UL:EQ:Zv:0Q:JH:U4:Ux:Ps:wP:Dd:gw:oS:oa:et:3I:jx:VF:0U:Hl:SU:5B:CJ:Y8:9o:OV:cw:WC:4T:Ox:Pb:QQ:b8:pd:YO:jJ:0G:N7:5m:yA:ar:mL:0I:zQ:pb:Bj:LT:rW:KA:jW:Bz:zO:Ek:p0:EA:TY:4X:Xv:rg:Ph:xt:ww:sK:oD:rv:oL:1A:JW:Vo:tk:4U:8U:xe:cF:eF:jK:qN:rn:NQ:ye:L8:Ed:9M:z4:us:z4:se:nq:w6:nC:Ar:zN:qo:cX:v2:9g:wX:F4:YN:ag:Gs:DI:vA:N3:u7:MB:bC:pb:A3:TA:QC:qV:An:Uq:8P:GP:fL:ya:Wn:st:yM:ts:pM:T7:Sy:vk:yJ:dU:8n:XE:UD:py:Kz:Bs:ax:sb:WT:Sx:S4:gw:Ic:Ed:lf:GX:uR:hA:H4:xV:KR:2i:F6:ZU:rJ:d4:CY:77:TQ:gm:mV:H6:7v:XM:RV:di:of:YE:zl:8K:fm:RE:qb:92:wN:EX:sU:tZ:Sq:si:v7:eh:LI:vA:qI:5f:Wh:Fp:TZ:3G:Zi:pK:tK:qq:IH:L0:6Q:ol:vJ:1M:7p:4M:la:N3:Je:8A:mL:PH:hz:9J:0F:FB:he:Ob:zj:Nl:oa:qe:UT:VY:eK:ao:Vx:yG:4L:jd:Fe:Vx:Zb:Co:3p:Yn:PM:d0:Cx:KD:Xa:rq:rr:gB:Jl:QY:6z:yO:lw:P5:7W:Zw:vw:OB:iH:yV:Jg:pD:hf:N2:zW:Nf:vF:ai:7T:lQ:D3:Dv:2e:Uj:Z3:h6:mK:hS:fQ:2G:v0:WY:Oc:70:Hx:bq:i5:5P:aL:NT:CO:9r:BI:i3:co:hI:Vl:gP:eT:C8:Ji:Zm:N5:1C:QV:qR:D3:Lk:gQ:Xl:Hn:aF:A2:Iq:Mm:XA:5o:iI:HM:CL:dV:Gj:zF:j1:Lb:Rv:Il:JB:fI:PB:un:2h:EO:b1:RV:tx:yI:1U:iV:nk:j4:Ah:y9:Zq:k0:ig:kM:OC:0R:il:Ap:uJ:bh:l7:jx:bE:JD:Gr:It:Mg:IX:TL:rR:f0:9C:Nd:3W:Pn:WX:Ck:U3:AM:i7:un:zm:Sv:T4:bM:ob:Ki:w1:j7:gO:NT:7N:TQ:jN:Oe:3j:qh:Wk:sX:eA:gy:68:Ek:wW:De:Tp:8Y:Zh:yF:An:8V:1Y:Bz:lB:pk:QF:iq:T7:ct:Zr:48:fn:Xp:4X:Yp:Ei:hu:uW:9S:5F:GP:6a:Ij:8P:2a:Ml:Yo:xd:Dc:vK:pu:Hx:5v:ig:rA:Ci:UF:5G:so:z6:ve:Pb:vU:ik:5h:2Q:RJ:bC:O1:7D:nR:X6:MR:9L:xm:Ik:13:8Y:1e:Fx:YA:zt:9o:T6:j7:tZ:Lg:Um:ko:mM:IZ:2y:Ox:Ms:4T:jA:4V:NP:mB:pM:yL:3t:RM:vP:eN:Pg:86:ya:1r:e8:MT:7O:m7:vK:MR:vm:5G:io:vW:9D:CR:0z:zT:BH:Lx:g4:FL:F5:3l:bq:nl:1e:Tc:O0:io:ud:QV:Do:bV:Ms:3x:86:cN:pR:7z:Ux:eT:t2:dr:U2:aD:w4:cD:q2:Tc:5v:Pz:KH:19:Co:Q2:H6:n7:WP:By:zp:8y:Oh:lP:rf:TO:PI:2Z:Is:4v:pw:XH:Bb:lw:MT:Oi:qP:Y0:QJ:B3:BG:GP:Mz:LK:46:nn:4c:00:LA:Kh:q8:YD:tn:sv:uo:Ak:6g:Pk:cb:KS:Ef:rL:84:IB:J6:Bz:pz:Zp:RY:qx:46:hX:Te:8o:SI:Kn:m7:1j:nm:vb:TD:e9:qb:EI:Lh:pz:fe:5r:HA:ee:Gk:LS:uW:Ic:MY:CV:pa:8N:7P:dp:I7:ae:v5:Mj:Pd:FK:2X:k2:qX:Fj:S3:qP:aH:fc:S7:Kv:DF:8x:6Q:qS:qC:Eq:g0:YF:Tw:Qy:Jt:DC:Cu:sr:RW:Ca:uP:sE:UU:jh:D9:HC:d7:YW:Wv:Kr:V2:5j:gC:Fh:1j:Ej:eo:Sc:QB:5q:tM:s7:7e:K3:Gw:FK:NK:KR:Cb:cV:51:AG:v7:ge:BP:Ld:qK:p9:fo:RH:f3:Vj:6M:0F:HZ:u2:cl:li:Bm:bz:hu:ba:8Y:Qd:kj:ul:tm:9a:qW:LV:Qh:Jx:zU:Pr:XU:sR:wB:Mf:s8:Vd:X0:7K:Wq:B9:0d:S8:N1:wP:Rw:ao:ON:ii:Jd:8s:Wg:Dy:Oq:Um:Xj:wz:Ti:pu:Hx:DX:Bi:AB:5F:Jh:Ke:jh:K7:ZI:bw:U3:zA:hc:Xb:a1:Hq:Jx:rU:u5:2M:6R:ql:jZ:7i:jH:MC:HU:yS:NU:AQ:4m:g6:d3:Ui:GK:U6:Ov:yV:Pd:1Y:cX:7x:LJ:HU:5T:6X:qi:W8:IL:Z9:Nu:pk:UW:J9:e0:e5:Mp:Mb:i7:Bb:ff:j5:Ul:3c:DX:uJ:OA:1v:1O:DS:t2:eh:wP:wr:sK:V2:zu:Uh:2r:LL:4w:7v:1n:DA:ni:ZW:T9:E0:Bl:fh:QK:uP:OM:af:X6:jR:I0:bX:dh:7o:qR:90:Jm:d6:Qe:hr:rl:8z:TN:qF:xt:wO:Dq:j2:L4:Un:Bb:Ev:pH:Qu:Fk:z1:IL:rQ:a5:of:F5:8f:5j:xS:Fl:Rb:eY:9I:QH:SH:Cm:so:Wh:lV:KY:6q:3Q:yd:LB:7Z:5D:u8:kp:QV:P1:wF:pW:h2:ku:GL:l2:CF:BA:Z3:I7:Be:Er:5B:Ux:6H:Az:2v:w2:tO:S1:EG:Z1:lX:ak:TJ:FH:NT:1r:WO:Wh:nA:6t:nB:Uz:W0:Dq:Y2:tH:Ra:vL:WD:b9:qy:x4:mR:ZK:DI:pV:sg:NH:M6:P4:sK:Z6:6m:gG:Nr:XD:Uk:yr:Dg:BC:Fl:gs:NC:q6:Fs:7a:fi:Gg:Ca:tv:eS:Pt:jJ:6G:kT:Ho:DN:ZZ:Ed:qk:1T:mJ:zA:IN:4j:vs:Dx:cU:wT:r2:64:rK:oP:tm:eA:GQ:EQ:Bw:ut:TH:6e:Di:r8:4j:TI:Y2:nT:jn:bO:Qn:ZT:K4:ks:k0:n5:3A:VY:dh:Xa:0c:uw:fp:lX:Gv:Xm:7O:1t:4Q:km:D8:Xf:kA:Di:FK:vl:iN:ID:67:Mp:P7:hi:cY:gC:qo:XV:SR:TV:6C:RP:27:z0:qu:Q1:1Z:bn:iD:mI:Cw:8Q:rs:uW:4U:Qt:Sv:Ev:Va:yf:85:bZ:7o:6d:gO:Hd:89:ff:YC:Hp:9l:OF:2n:Ms:lJ:JW:F6:xX:1W:QH:yl:HY:XS:1z:vH:H9:mF:c3:5e:qO:IX:eD:MR:vJ:bf:wi:F8:Q8:Wg:jt:lP:b9:Pf:pk:yh:Ym:Pj:u1:Sh:u3:QL:2a:3s:Zf:L2:hA:Za:KZ:Gy:i1:xW:QZ:ci:nG:kM:DJ:9L:xG:RL:J0:qp:6i:SO:WU:1S:SE:50:4s:n1:5E:ZZ:E4:pd:xE:Cl:xF:kK:FR:Wj:UY:aO:0d:BX:7d:yy:p0:qI:Au:xS:Cr:cX:zj:6K:F6:Rs:qz:zp:fa:O5:vH:JE:XR:01:jv:jL:xE:23:vi:3y:7h:OP:PD:PR:Um:9E:sN:lz:nb:wO:Zw:8o:xn:nG:87:QR:Xv:aw:aE:6s:HE:Nc:Ic:XS:BV:5j:T7:AG:Hg:iA:WS:Wc:gW:An:mM:WJ:dY:3c:RI:cx:Y7:Ks:1e:yE:oy:lC:E9:Wd:nj:Il:wy:12:oU:oX:5p:F7:r5:OZ:F3:ih:Dv:Is:4k:QG:OE:Iz:Wi:M4:eL:PN:Ez:nX:6j:VG:Yc:FR:WO:t0:Ye:zI:w8:xl:zt:sw:dQ:Tv:RL:LV:yW:0U:Bq:fU:9J:UK:Ls:23:Gx:Sr:VT:z7:BI:4w:uY:mY:Dr:fj:Gn:E0:kE:FP:Q4:Aq:Pk:ck:fr:ha:OU:H7:YI:KO:7S:3S:S2:7u:dh:q7:Gw:EN:MX:X1:Ep:UT:Qj:Q0:Ox:rJ:mi:WD:Gp:7D:Jg:j3:gI:6q:4U:CP:Tv:Dg:eC:qf:q1:Kb:kz:r7:RX:Dg:Ts:7E:bi:5Z:W5:sX:A2:KB:Mf:dG:EC:hJ:xK:Ly:20:PR:MS:CV:p5:Q6:rn:8X:cq:h9:xi:1W:Xk:NO:bY:tT:cp:0H:Oi:Pn:p3:fo:x4:jk:oP:zc:La:yW:4b:t5:sm:hU:yj:P9:Wo:q4:Mb:0J:fO:PC:j3:DE:k3:qe:t5:ml:At:OH:Ci:b7:fa:N5:m6:7m:cW:sq:uz:12:Z6:n9:do:15:Gl:LY:bn:pG:nq:NT:vu:d8:yF:s7:tY:kC:K8:rK:eq:iy:92:TG:5Z:wz:XG:GX:Qp:Y4:mT:io:wT:Io:Ma:XF:dP:Hf:mP:a2:t5:oi:9o:JV:BD:8C:gb:bX:d0:8H:5X:Hx:Lz:m6:Bk:Yd:BX:JJ:45:Ly:jt:bO:Eg:8v:Of:C2:3c:ED:gl:LJ:Vs:YY:2c:GY:c7:Hv:6C:ri:5e:uv:aJ:st:yu:bs:lT:DE:QC:Su:Ci:Lm:VH:RC:pO:Pe:qD:3b:8q:QB:G3:OE:0Q:NO:pq:LZ:Zy:r1:Gg:u6:qd:dr:9F:BL:YO:8O:Dm:4v:vR:sP:zK:KK:Xs:Sa:k4:nK:P3:A1:pM:FN:hn:bG:1c:5w:Pv:Py:0X:Iz:DE:7D:8H:hs:Fn:C7:UI:Ak:Dd:wp:vF:UW:2g:U7:4g:1z:P8:op:CE:PM:6p:WR:BO:Nt:Jq:Lz:Oj:1e:23:Yj:Is:L6:Mm:fO:0T:K6:hS:2N:Q0:rT:bK:kn:ak:r1:sW:j7:pd:eJ:ED:Uv:vz:IF:cW:6Q:Q7:Lv:tj:IS:W4:zX:QV:XB:ZC:AQ:CY:4M:AG:PM:UF:1h:jM:qy:sI:Sa:Qf:iO:vW:zQ:3C:VS:XP:U3:qy:6q:1s:Oo:ss:RD:3K:Ze:uf:Hq:u6:MB:VQ:TC:bx:zU:rq:4u:74:da:6l:6E:VU:S8:H6:OK:oH:4v:sS:VL:bN:Sb:Ob:tk:R9:bz:4J:MC:3B:zv:Qp:5C:9I:Zb:k9:uc:xY:s0:2g:UG:Lg:fS:Hq:m0:66:do:ZQ:Ez:7e:c7:7Y:UP:aN:fR:YP:Zx:nc:P7:4j:3r:uQ:uQ:vW:Pk:Ns:EB:W1:d3:2O:4b:K9:c8:rQ:lg:Rm:fh:Sv:uI:8B:bT:kv:Zl:Nv:mS:EB:p2:ex:ml:T4:7z:Na:kv:RS:iO:m4:yd:Vl:r4:iB:28:lw:Jb:3v:w5:up:mA:yu:dT:89:BS:Ws:fT:bH:Mg:yy:ho:Li:zR:XF:Xb:hC:tJ:Wx:5B:0q:Mg:m2:QI:rc:SC:r3:J2:L8:sy:c2:X7:5C:AO:BO:mB:mO:ke:0X:sb:6D:hJ:kt:fS:DJ:W9:yJ:AI:00:P9:Tf:hG:Yv:pa:gv:AE:fM:Pr:f3:Fd:nB:uU:Il:ui:pz:hv:bg:9S:og:KN:fe:6M:sz:9U:tM:EB:3a:WX:Uz:8D:1z:XA:OW:iS:Hz:kV:en:hV:Nm:eM:dE:Gk:5j:Zv:WK:LW:zo:lK:po:ti:Cp:eJ:4R:xQ:c0:qo:93:OX:TH:TU:Ub:ND:LQ:f9:29:e6:g5:4E:kF:2M:gk:36:8H:ch:GG:YQ:8F:cX:mq:ja:qH:5z:BZ:LP:Tu:Kw:Do:Kt:0G:2x:AD:9j:T3:5D:V0:p0:fR:mF:NP:8v:f9:Th:Me:Pi:Q2:hy:fK:V8:FI:31:lz:fg:nD:oL:59:69:y8:Fr:SU:ys:kh:k5:bl:aw:AL:Bz:nX:tt:Q4:Un:yv:b7:L6:a7:sK:Hf:t7:sK:J2:ot:HS:OP:vU:gy:jW:vk:gV:ud:bk:Xc:nH:a6:UE:ou:6P:TA:di:El:rG:6A:cw:NA:O8:sB:0N:uw:h3:F8:K3:aN:pK:OG:Ss:X6:M5:nY:Hj:6f:gv:uW:bQ:19:2y:Wf:1l:UL:pj:20:xl:g0:i3:kt:t3:82:fz:yU:iA:Ll:Rx:sQ:Mx:fX:GC:qt:RP:pb:vI:gu:M8:E2:tf:A3:kD:nz:yK:5Z:GX:zz:gd:dG:Vi:Kz:ia:l8:V5:qv:RK:PD:T8:fH:XE:OC:hd:EJ:oE:Fo:4y:cu:hT:QK:C8:P9:uS:sY:OP:Cl:wN:9e:fl:2T:zz:6E:Bk:fV:Wz:kT:hn:Lk:bd:5W:9A:0T:Gr:kN:MJ:Pb:Iw:tk:oa:oL:lP:2q:6x:If:ux:Vu:cW:1Z:9J:5K:1f:Na:DI:eF:4K:gB:kK:Vi:K3:ig:dg:n0:he:1c:67:pS:dZ:sq:4K:iJ:RM:OO:s6:2X:5l:7C:p4:UF:qA:yt:Hn:B3:cy:vQ:sL:9E:fC:FK:zt:dK:8r:r8:ZO:7M:P2:Hf:Si:rK:yx:pN:sl:YY:ne:44:LT:fU:4o:Ow:AJ:GR:fR:QW:ST:ZI:JR:ef:6p:lO:wa:kL:fe:XR:Ob:Iv:dA:X5:NN:jy:CZ:9b:VN:Lp:f0:9i:za:cj:tL:bS:uz:7c:ih:Rh:Cw:ou:NQ:MW:XA:ES:kZ:UD:PS:3g:RJ:bj:Gu:Ox:O4:8O:dP:FS:YT:IW:b1:oM:3C:8X:xU:gR:6b:o0:wU:R4:Ne:ir:vM:T8:cd:Qa:wh:YW:ga:vY:ku:ez:pL:G7:L8:Xx:hN:a7:O4:ze:Vl:Ne:W4:cO:cf:WU:bP:qB:vC:HS:Ip:AB:el:Rl:Os:UE:A2:ow:6s:F3:WH:Cy:nO:5Z:Jc:lT:xZ:cp:Bw:jd:9O:Bh:U2:pS:PF:R5:Qv:y9:ed:By:u4:0J:wA:7q:5g:Q7:gp:GV:8J:bS:Ob:bR:f6:U4:nH:Be:4H:qQ:Yy:2B:Ha:cP:nE:7S:T7:sN:NQ:Ib:wf:M4:PF:Fk:Xl:f6:Oe:BY:4g:j5:mp:po:DJ:n3:iu:md:mN:kY:TE:X5:M4:tg:90:X1:KX:V1:3l:HE:3y:sU:jm:2a:N0:AG:4C:uk:1f:LH:wf:ST:2D:wz:km:mf:uM:yp:zB:65:Y4:9G:n6:k6:0P:W1:pT:8W:2A:4A:6N:tY:jT:D9:tt:aG:aJ:FJ:MU:Tq:Yk:ic:Cq:L2:LK:Xg:qR:BJ:ut:lZ:jc:q4:m3:bV:jD:jX:sU:mc:9o:1Z:B0:uH:Nj:sB:Ug:g3:zC:8q:oO:eH:2C:D5:k3:sb:0N:Zk:5h:cK:31:Jz:Zs:fV:VM:NP:gl:p0:G0:KW:Kh:gG:XJ:pZ:AZ:YO:bF:j0:f4:3J:XD:Ye:SS:Hz:0g:cy:oY:KH:Ek:0U:K2:kn:2R:qg:eq:Sd:rv:ZB:k6:of:U9:Bs:2H:UW:Xy:cv:PX:eP:YD:7P:fH:MA:rE:9a:oz:BJ:Js:7x:VM:6N:rl:vG:Kl:sY:JH:L6:XB:OZ:QG:Nt:Yx:fu:gu:VK:zw:Zm:pK:ma:aU:JX:9f:zy:9B:OP:RQ:kP:3W:Cs:3i:si:4J:OX:C7:hb:bQ:g2:Cc:Dc:1N:wN:QX:xx:A9:XC:RQ:IL:he:Wm:09:Kh:lF:St:dp:Mn:6b:Ir:tq:xt:3l:fy:O8:73:ed:7I:3a:8R:cm:IC:E2:1K:TY:oV:pi:qI:nF:F6:p1:SW:Sy:oX:1C:fP:I7:hl:k5:JT:N7:H9:LM:5g:rG:x5:t7:yn:jr:UA:1A:oo:qw:1E:7u:8G:ry:0F:BE:vL:Pf:Q3:0B:00:Ab:lo:za:F0:oI:l8:q5:lO:EW:Y1:Z7:LH:xg:mf:zy:wl:BC:8n:c5:Cz:hP:P0:EE:ks:ut:d0:vJ:zy:Wr:9H:yo:n6:fl:qX:Yn:QF:x9:ZW:Rr:bX:kA:UR:vE:FB:Hw:73:Om:bD:ez:b9:Ca:is:rs:Kw:7O:F2:23:1q:Wn:WA:c9:Wl:5P:wA:vm:6x:xY:6x:lL:Ot:QF:97:Y0:Wz:65:Ep:Hm:ZZ:ry:wS:Sa:aC:ds:zP:11:Qn:WL:Wo:6f:Jn:Bz:19:BC:t4:Ii:FX:W0:sc:y3:gp:pQ:EI:E5:L3:kN:aj:9v:YS:Gc:SJ:U3:75:dD:8h:z3:z8:BI:1W:Tz:tQ:nm:T2:5U:u8:Nt:Rw:EO:Yu:Pm:su:D2:in:Z4:V1:ll:I0:G7:TZ:Ka:QL:u6:br:QG:zF:wf:UL:gr:Qm:SN:jb:p7:px:1o:Z6:VY:e8:Uf:es:3Q:HW:Dg:IS:rS:vV:oV:DV:pf:is:nP:E4:CH:NU:qm:rM:jo:Oi:h8:t5:TR:Gi:dM:Lg:Wc:D0:fW:r5:Z1:Ec:8X:eb:Ep:Yw:41:gC:i5:IP:lS:C4:e2:Go:7J:qC:O2:Cv:On:fF:za:sY:DD:sk:JF:5o:VD:nW:Xq:uZ:Aj:Xe:1E:WE:6W:be:o3:v9:7P:LG:g1:OG:ZG:PR:ba:3l:B5:d2:Wf:nc:ei:mu:LX:Sb:8n:wI:to:12:3a:ha:6g:Tt:NI:7X:Uc:Yj:yX:ZY:uk:4X:sx:Ex:iE:UB:nA:2l:RN:DE:Tt:Bq:uY:3v:mk:G4:wZ:JN:xc:Sg:QZ:du:SP:nu:Lm:h6:EQ:Pu:My:O5:Tt:mv:Lh:ZY:VU:Lt:vr:LF:p2:co:zk:SF:k9:fn:2F:7t:tz:hm:3l:el:um:pp:p6:32:iy:v8:oI:SD:nD:s2:Nv:64:Pq:T0:1K:KZ:bJ:Vv:sv:rW:sd:1Q:ZL:3u:aS:Gd:BK:uD:LR:DC:f5:I9:eR:pg:L7:0Y:AE:fs:aI:RN:t3:iD:5p:Bc:QE:wa:g1:Qy:0X:xK:79:1L:DA:kq:ux:0x:b1:vC:ir:15:VS:iF:bs:Bs:ow:wm:qH:AE:vr:2n:8S:pX:K3:Jc:zs:gC:Oi:mo:5o:ps:en:0M:6U:Lc:rU:XZ:mU:kC:qT:sN:KI:Uq:oo:JR:9H:jJ:WL:SY:X3:EV:AG:cC:A3:yZ:F3:1j:mV:DH:PX:zs:1q:IW:wc:Ds:CT:Mt:Mm:5P:Sp:nN:EF:FH:wP:mp:rQ:B3:m3:tE:Hu:Qa:Co:CT:z6:Iw:qi:Ib:Bm:F6:gI:HN:Mh:Rx:Nj:5x:gr:lk:pk:PV:wy:5U:eH:eV:eS:6G:l6:bo:Ck:fU:cH:71:PE:tB:3A:wl:Ij:N1:vd:T6:RS:2O:Tq:eD:l0:Ym:jz:xi:Wn:7R:vv:HN:nM:mr:JW:ew:HR:Yf:NV:4I:Mm:Ze:YF:6v:tX:N1:9B:h1:2e:B2:wG:EL:dK:aT:rp:cp:ny:3Z:7o:0v:4C:D6:kO:ai:j2:e9:xg:W8:Jw:mN:cq:hi:JI:U0:6T:KQ:Rh:9r:1s:FZ:0k:9r:IX:cv:36:HI:36:h8:bh:uZ:r9:BP:Bz:ed:US:Wt:0j:EB:qy:eN:ky:cY:9Z:m4:vj:2L:pn:UD:tw:MA:X9:vF:RE:9R:yA:lE:Ne:I7:Ls:gE:Lj:Aj:Kx:pg:V1:UV:VF:ap:JM:9d:KO:eS:FN:iG:i5:pw:Kp:3R:qJ:jC:Ya:gv:o1:qS:9p:mT:xi:sq:XL:na:lW:XK:HV:Ln:ic:dh:8l:uL:wR:d7:E7:26:TS:wc:2d:3v:B7:Df:JJ:j3:NA:Yv:9r:DH:zo:R1:sj:Z4:2T:OL:SU:ja:eW:F2:i1:Zc:U1:wo:gI:44:gr:ql:xH:5u:vT:vj:Ct:0s:2d:94:yH:HF:SQ:7A:hH:bK:ON:oA:I7:qi:sI:at:DG:eB:F4:Hp:9F:fV:Tv:MX:qY:TI:BE:T7:en:zv:EH:Ga:sZ:Z5:Ki:iF:oN:o8:69:DH:Vq:eW:Wx:BI:63:b0:pc:ve:B2:rS:oj:q3:zj:9g:Jl:76:rF:KM:65:fo:r8:dk:1v:oC:69:31:GB:L9:z2:Cb:tX:W4:Us:yY:rH:1W:eh:1c:5l:U9:Os:JD:E9:SO:nx:9s:ku:OG:Ih:hp:z7:AZ:w3:RS:A9:7p:Gr:Ap:eh:ns:IY:tP:SF:Sa:pn:pA:Uv:xg:cE:py:x6:gW:VU:Ko:qM:AY:OA:oe:KP:1j:JX:fY:wL:kh:DJ:A9:TH:WB:gD:OY:KX:eZ:Vv:mw:mn:bw:lb:Tg:aO:AO:UH:R5:Dr:Mr:N2:6F:Y3:WN:V0:la:gx:Vk:2m:YG:hR:ul:hm:F4:Rd:fz:Q1:Cf:ol:i1:DP:91:qs:wc:iM:4k:LV:4V:zY:Tz:Oi:hY:LT:OP:ZP:sy:ZS:we:20:CO:Lu:Ap:ah:zI:tE:rS:E7:DI:3N:5D:ez:9W:h0:xM:PW:gT:Ur:Sf:UQ:OX:es:qy:CW:DF:T3:aF:M3:5s:Ri:Iv:yF:Cp:zm:Sn:Cg:EU:js:z5:Nw:S1:uB:ig:fP:UI:MA:uz:5H:lJ:Qf:D5:Qb:JP:IQ:nu:dn:ER:RD:UM:72:hG:l8:2D:o3:JI:e9:ZZ:1z:as:Bh:qj:d0:fc:EH:xq:BG:Kz:B2:jZ:bN:ks:KG:ji:27:wE:f6:Fk:tU:Bn:B1:k5:Po:Ra:Ec:4v:CO:K3:hM:RJ:2B:ka:mb:JS:7Z:C4:DW:xc:8i:OK:N3:4l:lc:bD:7T:Qd:LU:1C:b9:7P:EU:aI:HS:li:mg:We:rc:HD:T0:5I:Ba:Wk:iA:eD:kr:tH:Pt:l3:IS:BO:M5:1G:WK:7u:lt:gH:zd:b7:Xb:g2:08:Xe:aQ:pR:id:6E:yW:8x:aR:qX:yT:p0:Sb:bc:GV:xC:2x:vh:c0:Vx:D9:wp:zw:M7:VZ:gq:9h:B0:3x:VZ:Xw:pi:2e:kw:0P:Yw:Ym:dQ:Ve:KV:bh:30:9C:j8:RR:Ai:TC:58:lF:Cn:GT:2F:sx:1w:9c:Xh:oa:4o:vS:BN:KJ:A3:d4:Fn:ph:u0:I3:cx:Gt:PI:YI:N4:Sz:bi:Br:a0:3e:dB:3h:yr:dt:2z:gF:cR:WH:cL:ZS:V2:RG:Bu:xM:bH:mM:9C:Qs:Kn:p2:6f:Oy:zr:ht:JT:5Z:Dq:RP:H8:UC:8y:t9:cm:Nm:4C:YC:uD:1K:CX:hc:TR:Xi:mf:tR:i4:yl:36:Xe:up:LU:h2:fa:b6:Zb:ll:zW:8E:kp:lL:as:Pf:L6:3u:4e:us:TB:gy:t7:vV:JP:ud:dQ:TC:dr:bV:3R:8J:q2:SD:KB:Qo:4V:8A:bY:6v:I1:xe:l1:90:xV:4I:wK:B3:2B:5D:p1:UE:RE:4Z:WN:aC:i7:Rd:zj:bN:a2:wu:1I:Pn:cT:nF:BU:cF:Kq:BW:YM:Gv:QH:kE:lZ:A2:M3:G6:Yb:MG:g4:ad:UL:Lm:Et:HS:mu:gm:LV:bc:kR:jb:ay:r0:Tf:0h:SE:jk:NS:ke:09:G1:mF:QM:tQ:sp:C5:2l:UU:qi:lQ:Sj:vJ:j4:xu:35:Cx:H7:6X:55:oE:n8:sI:OV:EY:1I:wC:dv:KG:sG:PD:Ss:99:tY:5q:Iq:mM:sq:Mk:uF:2l:tI:SW:K2:Rs:Or:ig:XF:qg:Ij:Lm:pm:Fi:eZ:mN:l2:tw:DB:Fw:ix:4v:DL:UF:90:Z4:7b:JI:R5:pn:gC:yH:xl:XV:8D:Mw:Bn:Io:se:qW:nM:Xq:dG:Zb:hh:85:ne:bM:v6:aE:Ih:Wr:mj:1O:CW:PD:o8:W2:rK:y8:WX:6O:Lx:NS:HU:kT:nC:qE:VA:9q:IT:YE:04:IG:sX:ru:FH:S4:SD:eo:dZ:wY:B7:jg:Qj:OU:to:72:Do:Ou:0X:KK:6O:25:Ye:ek:fY:fR:yj:QB:i5:1y:Zw:Oy:Ou:Nk:ku:Qu:Xa:lI:t4:3y:JN:XB:Uv:xr:Mj:kD:P6:iJ:Bf:3V:hQ:2y:Io:dy:c7:Nn:li:FJ:6h:OL:S3:b1:Kp:Up:Mh:0J:Zm:G0:OV:hW:BM:t3:l6:4u:G2:6e:Xz:Dt:Hn:jR:ev:op:MV:B9:gz:rM:r7:BN:uN:ju:d0:Tp:rf:rR:fs:6w:l2:Jw:tY:FG:xw:FE:ed:pZ:An:WX:ks:6V:Iv:gs:F5:xs:k6:iL:Zd:L8:z4:Sk:8G:22:ym:9s:0w:75:bK:8d:zU:s2:es:ar:vp:lo:JC:8A:N6:Oo:5V:MO:YV:ve:R5:DH:He:Zn:6n:A5:17:oZ:Co:v9:IL:a1:7t:Dh:Fq:4b:Rc:mu:1e:pa:Ow:sl:xi:ku:hu:PA:wc:Tt:FH:2S:W9:nW:M0:bJ:Hu:pK:FL:A4:zc:0w:99:Lj:30:km:wl:tt:MG:xl:rL:mh:Hw:dX:uL:EU:kC:d3:CX:tE:t4:K0:3E:jv:fw:7a:8N:PX:58:es:H3:kd:MB:UL:zX:hL:gK:bj:Dg:wi:hG:Wh:Td:pb:C4:RJ:fO:FN:4t:lh:2m:DF:8P:T8:MH:tO:8S:f2:Di:hJ:le:Q9:CC:z0:fl:OE:Ic:54:Oo:oT:uO:dH:P4:AM:SH:bD:kw:Dy:6o:jI:zY:A2:f5:jM:pT:dF:nf:7v:KJ:7o:AW:AY:3O:qo:as:mo:ew:X3:3F:Z0:bY:GD:kS:sC:Tm:tj:Dh:lF:35:M8:H0:jo:tM:wM:Qk:Do:HC:w6:bO:Ns:e5:4w:yh:WI:IU:50:tR:a5:Zr:jN:ov:6W:jj:Ju:vc:Qo:Hy:C6:7x:iL:Ek:Zz:Nc:ZY:qS:07:Kl:6S:aY:iu:Iu:Uw:Cp:oA:YR:Pn:S4:yh:S1:86:s1:C8:bY:v0:Xh:CW:9C:9e:dN:t3:oA:2c:SA:dt:Ls:K1:w0:zT:KF:ni:Bm:AG:Tj:7h:gp:VS:6w:cK:7g:Iq:FI:s7:S6:j5:q0:8y:mf:Cn:q2:CJ:Rp:vw:MN:SV:SZ:0r:9I:gg:UT:m4:15:Bf:3C:89:Jd:5P:Vi:AU:zO:UZ:CZ:Lb:8i:T9:oU:Fr:cM:J7:Fb:pa:Qp:cx:mX:1w:RP:u3:sC:7H:DK:OF:fr:pi:6T:Qy:J6:zw:H2:IZ:5n:Bg:sx:1g:eJ:zT:3Z:NU:Ot:P9:5B:vC:LQ:Gg:vY:H1:j0:Aa:km:wN:cO:SE:vR:BQ:zs:Hg:Ed:tW:gC:Bu:ZT:5J:P1:Qw:nz:Z4:tT:ER:L2:hh:AX:yG:FL:z2:Se:fz:z4:bR:zg:ry:v8:jA:XP:zJ:ws:KE:OV:IE:VH:q8:cB:XC:8z:CA:jQ:E8:JD:OU:U1:Po:Fv:ox:rc:rk:dt:U6:jB:QU:Jy:K4:12:NK:R3:u8:Tv:98:Aw:iB:sA:FR:nB:lF:fz:j2:ay:Fc:Bl:ES:ak:xs:vK:Bd:kh:IM:Gn:RI:aI:px:KV:SF:mP:mM:HC:Ez:mo:M0:e3 | Rerechan02 | @Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot@Rerechan02 @funnyvpn_bot $ | Projeft FN" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <widyabakti02@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	���L�R#�������d��P|�z���g�/}��,YF�v��r�Q��P��44�C�
xC2���&H*.���Pm�{/!�Go�v��@�0 e\�v.ː�yD�S��!�������d�?1:�5Y�(���(V���,�q�S#��"��둴 � 7��+��s_Z�*��y.1I�XJ��h�o��Wb��&�N��$��4�}3]�|�s��ro�տ��VZ�	��]�T)�}R^�m���w�<�B4�sJ|х�{�KI-���<����cq�g��Z6I	Rl~��f����!��M�zXޮ��4}2!9'��L����u�*C{Āڂ�I�D]��$/<;�|Հi�^��<����<��S��SN[�Π6��'!/�S���6Ρl�5 I�U՝��Y pAa�;���I�c�Ya|9>=�;���W�4���8�5vW~ٮ��%9��P�*ZO�D�����ʛ{�yΣ7�l(���l�{�*:�{7�_�d_1qv���S�[�H)�)��}��x��s2
{����^:�-B,��4 ��S��8��?O't�~H�����e:��	��@*}�!b�n�̫��E�D?��H9�b�x�Q���GߧR�����Z2�����2wĎ�rѾl=3��$�X�񝻨�GX�ߛ�n�T�ϵK]ʖ����£�9tX|+�p�v��of�&Ѳc�vf�Q��9b�d�"ViF��I�vR��&�<������[h�QfN��`פ��F94`�XH��-�s@
L���fի�&#߁pv��Ǵ���!�bi.�Ott�B�t��؅	���~�b�!Y�!.~�����3X�%l�!����ZQ�"σ���,Ze6��y�%��>Z���}�c(�z��dHU>1>F�ˣ�]#�� ��
F���Y%RL��"��Z��)Jivb�.q��W3��S|�o�����@���}��'/s���z�R�Y��o�c�q�ni2?��,��	g�a��̀�Ah��Q�6N�k4QpֈO�Xw�J����ݿ�������yf}!�����=y-O#c�d�[C��dc�Y�=��[f=w�5��0�����D���V-�������g"�τ�+���+��������{�x���J��n��i�O}��l�B0[F�u��䤴?�kh���'�{BE����.W|��������JQ�������sdHҹR�z�$ؚ]E�נjH�������*�D[���E6�ܥT$�	f$���I�%������e�ӭ��*�E;��,�����dG�-���F��b�ȕX�."�C����1�@{/s�1��c@�6��ب��\��l��<���kc>m���i��M�Jl���xtHp���ds*��#}�,s�O���O��P�7bֽ���V�.��A7��y7�\eB綴��|:
r��f�4�	��9�e>R�����D�n!V�4O+���N�N��o�(ٸEgs��f���q�@u��Q�9� �]r�ǐ>^X������$N�]-����C�S.|0��x��$�A�(ݷ&A��|y���*w���O��sw���g�}�q���5�ɚ��J�A �-p���M^��5I�����>`_�d!Arb���P+U;CS��z-P9!�|K��1ˊ�\C�	$��n	l�����D���$O���,�@ڝ��kv��4sTt��Ч�^b3���3{��p��J�R~^����J4�z��X-�����:��o�z�H�vU��T�7���pYQ�G</���²�|��?�Y����o�'��B��9��Fms��b��'��W-Y��=�h�x�Ӆ�|�BV�?)gu���6�R���j�OH���
<�~Y/:�o���z\c>�,��$ �7� ��"HXÅ8�R�?-VG�t��1�}�����8���N�����;� '��ӗ������鸳�R��/c��*$s��v0\m�����^�W�-�\v�J�ɮ�^��2Gpa�Q���B�*&�g��.��
+��8;,����i�=mh����~�|5����3��dAZf��,Wx��'f��]�7������ψ3��*��k���,o���&�Q%���f�<װZ�F�-�8��l!����{��9R1˙���禑���K@���Ƞi#ͺa��6-�]D`�l��IF�"t�!2�Ƨ�0|�lp�e���&R�Qx2g��̔���[cex%��=$��J8��f!��9�8��a��&�7�њ�b��J6����U6]d�TMƃeX�z�}�F�.`:
~t����s{gc���I��2�������r��K����HYx�\bZ�w�n�M��H����g4�����d6`Z���]��8Ԟ�s��[WS����We����C�%�ney���r�@ݍ�׳��3�Y��"N�Bxe0i�jr2���}+�}�V^�r"��ē��0�ĆY{�s��w���,�x��U�Kx�s<��:��Wmsy�X'�D��Gώ1��w��(50�t|���L����#'2Q��z��*j�����7�Kx��EU��,zg�%�܍��F�ʚ�"=���j�늻���c��Ўv}��\lA:��_:rQT�sC��+��i([K���Y^�h�lP���ہ[KC_����7_h����ʸ�����o��*�#��	ߩ�ȟa�\�I�	� |�m�0��_�#�5���eW:c-�l~�n�@�\����I�͝����d]��Y�5on���ǿ2��.��|�	��w`dN��#R�I�g��
���:������1I;�؊ZD���dnc�5�l��ǲ�2����E �D�+�[R(�/��@9���u���2�6q,���<�C7�ې�>��{ݥWz��ʱRQ��EӬ9[E8ւ�F�~t�UC�ʹ�j[UŒ�y�_��t\j�Ց�$O�U�2������4�p��sC���j�٥�i!��_��s�g~{ts��~]��\G��i��}�R�!ɮ��t�/���k�ߧ�}jF�J^!�?��6���RʹĲN(Vi&o�R��"�x]��D�֔5?ɽ�w޺3
��DĢ�,�?��5���-!u��e�R~@�< �+�N�Q�#l�Q�&��C��H����Ta��/?{�
��?u3>M31���0��)�MO`���W�޴^�F#d}���wЎ@�[/�s�s�����|�����~�8I�oi�vD4SR5�4�h5��X���٤6�u �	<BC�Х�q�"�%Y2H +��7�<&��w�W����`�lX�I,�fX�i��/� s��'�L"�*�9PM�KhZi/�CJ�̗�����wӃw�o|��Y�(�T�n[��RS�]��d���]����+��*���Q����:�$�&�a�d=�[���]�k$.^�@�"�1�GS�U�TF)�ͭ-��w66��30�l�l���4`C��9h���#_�ل�X�Xj�ժ�k�Ek�k�i�<h)�я;�%�Q0����8(6x��v�m�B��j|K�2ʈ��j0h��L�o2C��m:�;悴��I�L�"�,gh�}�s��ٳ�O_��1):�-@Z�@�Vz�X�����\Ze��y������F�O�FE,�虙�t�:a�o�ֶ��e�!FP�5�}h#d%����\�^�/����c�6X�������k��/���l��I�_И���5�p�~�૷���ҝ�й�����4W��Ͳ?��2f٠%�����B��<�������l_=�)�A�w���bo�{ " �&/=Y죟q�s���T|x�i�=������c;�<��������s�Z�ێ�&�{����e��ۭ�9���1��dvT�όaQ;l�X���_���A/�b��jDJ.G��ְW��W��z��b�X�Ň)ہ���s�P��T����6Â˅3z�U�N���V���k|c,������n�-�h;�G��������])M��ʚ@_n;���^�=-nQֽ�k!j�����u��[�T�j�"�kw������[��^�{5�"�o>i(�d��f&_�u�e��rj��0�"��1*g.��
���T����JGvI$�po�b�W��p ��f��.����8���WC�˱�N�8&/>�Ψ��0]�6]w�^�!U)DL�0���5o
d�v��������g4\�h�"1̙q�6���9���Z��e�JN^���z��Aҧ�7�Tj�55��3�tavX���G��ݲpVE��&'�	�p��;x7K����F*�bz�� �>�da�ito����W�:�QM�<�<��Z�q$�O�Ӝ&*M�yu�+����AzZ���d�B]\�Uɂ�,�hD0}o4�jT���6��n�[�z����+Ij)В>޶�ܾ�;�I1UL�ttb���sq�[r�L�>���4�*a�X�e�me���P�ϧ2�Zy3Ә����MQ<c{\&�Аbs�Y�_⹚�7"�:9����,�WӬ���l0�kq¦_lX�ƣ�<�TP��R�z+!�&�9�Zk��ЀO!�$���񠗈�#��CsM\��*��mEq6}'��FoP�L��?���p�r��:XЖ��������)T�.�����!�-XP�`U���� ؟�'��,ّ�o��}8�	����/�	_�+�(�,&E�aԢ��d�qvG��1w���N�k.���Y���[�z��b�K��b���R���2D</���6��e�o�u���m�l��mJ7�,�ʿ�����B:�j��c�U�j�A�
��U%QƮ� bb�
a	�Iz�H��q�z��8������E�����ݓʽ�h��汕5�y�d&vx�3� C��df�Ul{��0���1��(*�Itq?m���k�.E��R�����q�}&b��aM��9��?E�Sv虱��,ʵ�H�ȳG��Hvy-�m+���~Еa�Ն�h2��}�ڈ��04��L5"�>���^�*���%��g��nQ
��q�Oiu�'���y�q9>
r���#�I�e��K�mYՓ����� N7upUƜ�H��~Sx��	��AO$��c�m��� &�5��i1t��З=<'�_��
-�����/LQ&��<�~�r"p�7L��R#-�����cd\�䅑�?���>1�r��S���`��.�=,�T�Ŷp���q ��[�N� �E1���y������b���+�0@�����(�=ۀl�a�NH�N�<�7���]�������(�v��# җi��7E���U�Y�B����R�ݝ6-ֽ�ڒ��'���pL�8���;\�TY��	٧��7��6TU�(j
ҖO�&9�b�E������
i���_��lH�h��V�A�y�U�"V�F�s��w���a����Q�~Ne85�i=.jL�KgR~�?��P��
o2��l�-Ќy�N����T_��t������u^l��#g�1��SS�v#g�ƺW�Y��e}8��)��^f�nb�b�dMN]e�OB�:ӭD���خ�p���v�O1����|�q��s��d.`g����ы%��`��~ʣ'��]��DDJ�ֆ_�`P�s"���p������T��{��֑@����3�Wp@��Y�6H�9�2i;=���s�?:	��<K/�~l���ڋ�#"DO��u����[O�O�ɇ�򇔻���zY��k"h~�KR+A�q�/����RN�ELݔ�K�tP��b�#����3�T�?c������@��V��Vv���K���y��_,NV{[U�s��U͵ϩ�����	D��Gj,�������x�?�"2B�o���}q�uH������gm�n��d",V�"&���U�:�u9��	w˾���Iw�{坨��$B߻��lϋDSz�}6���FD�#y��fG`�����
&�̤�;P����
f-�`K�a�I�Y	D�)�ħ��H=�I�೽��'1��S���ca���E���Ni1������]��~C���R���̞���8Us$���3z�& ���@�뙧�O��7$o�!]fu�)4&����!%s�|^� Si@��cI�#*"�k`$�˫}ۢ�Г9��hg���lthjx��Ϗ��l�߹%*BJ)�e\Q½CS,�}A}��_�����M��K��6�.^&W{:�_csHu�Q��T�"�gPʬ��i;�����u�W���{��9�S�N���T�I�͋]Vs�[Y*��gϑ��>vJ/K��Bm�^���u���D%�����m���,'ߚ���N��/�o ��ˣ$�������ߪ�#XM�K>�?:S�K�>�!e��[�<'��,��.U��i	)�(h��$��������>4��Ul�� D���lz��!�A�62>Sc�4�׷�6+�ĭy<B�ف��5����@�i:dEA��k�!�SX�4t����Y��
��mȍ���`�'�#䣬����Ö�# �*O�я��o��-!tbT���<9F���\;���Z�]�������~<�;X,*$p�ل��X5J8 � �l
��g�	Z>��24���fIo�b<��b����`��Sv����#�����T�{?o�JO�4�:��o����|�v�N�M�_��}c��U�c��43����]l>\ȭ�Q/?���A}~c��
�W�
*�X̃@��j�/�J!-GUf�{�	�@}�T�ox��L:�Aw��Q��y��
��Z7��d��d]�.��<������Xˍ�=�:,�]<U��?�����P�A��(�#4AQ��W�򛭍�US������B�)�_X�D�aUU�L ��Gr�}����w�>�y{�.P��"_G�eG�Ikx%���b�E\���Ǆe*-V�k���^y�>�(��0��'�跭��*�?ِQ�;�S�-6k+��k�� �Ӿ�c��A�_�dY�w�d��m�7ǇY�M�Jbl5�bs��cu~6_WK�I@��#��>f���G�A�T�n���z���**���A���8-*
�FB?~{Y���)ϐ%�1N-1KƷ��!��ϴ�)�S�xBՔi����Ȓ6@��Lt���i�b���3�Vw��j01^_Y<[=S:\b�@J�@�����gK�Mjw8�Ǔ�EVt"�����D����;��Q��\���㽯~U˷c
8:3�%m r��h�,�Wr�� �u"^����
�}گr��A���]�˱� kJE����_,~�HjS ^7"a�ng0�Og�q6��Am��~�,\��2�ܣ���n(%�1e��8��-nɞ�nCЌ��I�B�u��Y���]�^!�e�R�����QXO��IG�?���Wȫ"�{!ǂ;�d�+Sy7|:C���eX�q8$Er�#���b	����O�|�CY��a�Ҷ���{�В8��'���Ҙ�Og	�5 �z���&��<�I�1�r
$O��0?���kM@���)]dk��qK[������$L��*�r�zl
[s3�>qh�5q��U32mJV��S�v�F��T%k�G�