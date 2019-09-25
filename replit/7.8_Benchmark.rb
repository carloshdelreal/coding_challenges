# frozen_string_literal: true

require 'benchmark'

def full_counting_sort_juan(array)
  helper = []
  array.each do |item|
    helper[item.to_i].nil? ? helper[item.to_i] = [item.split(' ')[1]] :
                             helper[item.to_i] << item.split(' ')[1]
  end
  helper.flatten
end

def full_counting_sort_carlos(array)
  count_array = [0] * 100
  array.each do |item|
    count_array[item.split(' ')[0].to_i] += 1
  end
  count_array

  count_array.each_with_index do |item, index|
    count_array[index] = count_array[index - 1] + item if index > 0
  end
  sorted_array = [0] * array.length
  array.reverse.each do |item|
    count_array[item.split(' ')[0].to_i] = count_array[item.split(' ')[0].to_i] - 1
    sorted_array[count_array[item.split(' ')[0].to_i]] = item.split(' ')[1]
  end
  sorted_array
end

test_arr = ['24 oz', '36 xr', '43 cu', '44 oq', '55 qf', '2 oz', '96 bk', '1 tv', '2 jy', '27 wy', '30 kj', '11 mn', '85 mp', '3 wu', '54 zq', '80 ee', '29 rv', '46 wi', '13 zu', '37 rv', '29 sc', '59 on', '76 ts', '86 wf', '49 gg', '9 yc', '2 gr', '46 ny', '56 ws', '15 jr', '74 lc', '50 ag', '77 vk', '16 er', '84 cf', '82 dn', '12 ss', '4 pe', '35 pm', '28 qo', '47 ym', '54 lr', '34 bx', '18 jm', '20 kn', '86 av', '17 rx', '35 zb', '14 il', '10 zo', '43 lk', '58 fk', '0 xs', '91 cn', '4 qq', '95 fw', '75 eo', '83 pr', '65 tc', '11 vd', '32 kr', '55 so', '24 dk', '51 br', '38 db', '19 sr', '91 ir', '76 fe', '60 hr', '0 jz', '44 ju', '26 td', '70 ki', '62 zd', '42 tb', '60 cg', '71 zj', '31 bw', '57 ti', '69 we', '28 ur', '24 pd', '24 tj', '65 dk', '94 cc', '27 az', '33 pm', '42 dp', '57 pz', '49 dt', '73 ia', '17 li', '69 rv', '39 hm', '41 vq', '4 br', '73 xo', '70 nr', '45 hv', '75 yl', '58 ah', '39 fv', '48 tw', '45 eb', '94 zy', '57 vo', '42 sq', '41 kn', '1 io', '13 iz', '29 yu', '21 tn', '91 ov', '75 jq', '91 yl', '46 br', '86 vc', '84 mm', '30 ls', '78 rf', '99 uj', '24 nk', '15 ln', '76 nn', '83 jw', '71 hm', '72 hm', '46 pz', '10 ms', '40 un', '96 vf', '62 cn', '87 hj', '6 kz', '41 bt', '78 qa', '97 yo', '26 qc', '1 gr', '61 eq', '7 gh', '73 dt', '7 zb', '88 at', '67 wq', '35 lo', '81 jw', '17 de', '24 vf', '75 eh', '79 mo', '68 ol', '41 gs', '31 pa', '22 ji', '80 nu', '82 jl', '95 ln', '15 fy', '57 xd', '91 jb', '85 pv', '84 ra', '73 qg', '73 lf', '51 py', '84 br', '68 nd', '13 ve', '98 xb', '24 xo', '0 sy', '15 dl', '28 oy', '94 el', '54 mf', '47 fu', '9 fb', '34 zg', '99 tb', '56 ho', '74 wy', '88 gb', '72 uh', '66 su', '83 qf', '59 zy', '69 ye', '35 tj', '63 du', '25 cw', '73 og', '62 bv', '6 gp', '92 ux', '16 eg', '27 vo', '19 vz', '94 ly', '17 ip', '23 bf', '28 wh', '62 tm', '87 jp', '87 la', '0 yv', '57 hq', '54 rd', '61 ga', '32 ss', '37 sn', '18 ft', '83 hm', '50 es', '72 mz', '41 ka', '0 ww', '30 wl', '62 dg', '4 ov', '85 ch', '58 fm', '41 bq', '81 rm', '92 ho', '22 sy', '49 gh', '19 zg', '25 fv', '58 mh', '25 tu', '5 km', '74 ob', '73 rv', '12 ia', '0 zp', '23 pt', '62 cw', '98 jc', '13 hp', '47 oz', '85 ye', '46 qi', '40 qf', '60 iy', '3 ie', '85 ab', '40 ro', '33 ym', '43 rg', '26 yc', '88 vu', '85 os', '54 el', '1 un', '10 ah', '93 fe', '78 zo', '78 xo', '14 hj', '20 ht', '88 px', '79 vv', '70 rn', '20 tc', '0 oh', '5 xh', '57 kt', '45 wb', '22 jt', '24 ke', '67 fc', '33 uk', '59 jz', '42 nk', '16 gb', '91 ba', '48 nl', '86 gz', '89 ae', '73 fa', '19 yi', '95 kt', '61 jv', '45 ue', '29 jq', '8 mz', '99 yr', '81 mp', '53 jw', '48 kb', '6 tj', '67 xt', '40 ou', '6 bc', '38 sa', '11 xk', '1 bq', '78 pf', '69 vr', '19 ex', '52 ij', '59 cl', '95 mj', '13 bk', '30 pe', '65 yf', '54 nh', '80 tl', '11 xp', '15 fx', '71 on', '18 rk', '12 vf', '54 dc', '59 ni', '99 su', '89 bl', '2 rm', '77 eu', '3 ur', '0 fu', '90 mh', '93 oc', '22 vu', '60 ax', '59 zk', '78 kl', '68 np', '29 nw', '98 yj', '88 qh', '36 vo', '40 za', '75 fv', '10 mu', '53 sp', '39 nb', '42 qe', '31 cv', '48 bq', '27 is', '88 qo', '27 un', '22 hp', '42 ui', '35 jb', '46 nm', '15 ed', '56 rn', '11 tn', '64 ro', '29 yd', '6 rj', '69 va', '53 cb', '13 tp', '23 ck', '59 bl', '45 co', '7 iw', '23 pv', '6 ec', '75 sp', '80 zm', '77 mk', '44 zo', '88 ha', '42 om', '41 po', '34 on', '5 le', '78 fm', '27 rv', '9 bk', '49 up', '75 nj', '20 hf', '41 wp', '18 lv', '91 aq', '95 np', '35 hu', '12 km', '29 qh', '19 zt', '25 ez', '33 us', '53 bo', '76 ki', '61 jd', '8 rp', '87 hb', '88 ok', '70 ay', '64 sn', '16 ty', '53 si', '18 om', '12 rs', '12 yv', '80 ft', '80 ll', '22 sj', '75 nc', '69 xx', '54 qx', '16 rz', '67 mr', '74 wb', '17 wf', '64 rk', '49 hq', '6 jw', '74 fa', '8 gl', '7 lx', '40 oo', '29 yk', '65 nc', '37 vm', '97 ir', '80 au', '2 ho', '30 xi', '91 rr', '9 jo', '89 zb', '51 dl', '98 vj', '81 cr', '59 dc', '7 rq', '17 sm', '64 ur', '36 de', '37 rh', '15 yt', '59 ah', '89 at', '82 yw', '73 ww', '34 ar', '46 xa', '92 fv', '33 oq', '88 ol', '85 cn', '29 sz', '44 cg', '33 no', '30 bv', '97 vs', '0 ou', '18 cg', '33 pm', '34 wn', '12 vd', '31 el', '4 ah', '69 ke', '98 lo', '69 hw', '4 ks', '23 ca', '72 yb', '72 ie', '57 qt', '66 sj', '74 vu', '45 hn', '76 gf', '26 oy', '92 kv', '53 ji', '66 sn', '84 pu', '60 kq', '37 ul', '54 gi', '93 gv', '12 pl', '6 by', '90 ux', '30 gj', '38 gl', '93 ja', '87 fu', '36 dk', '76 zz', '73 db', '79 rd', '11 qi', '63 oq', '22 fu', '57 wn', '99 cs', '99 hy', '69 wo', '20 zo', '69 bv', '43 di', '38 iv', '32 mn', '57 dv', '43 qk', '9 op', '71 zd', '34 ry', '67 ft', '25 nq', '52 fe', '0 pq', '43 lf', '80 bx', '91 df', '59 ku', '91 vp', '31 so', '60 hc', '4 qd', '30 jp', '27 cz', '25 zh', '39 kj', '18 jh', '8 ot', '16 fa', '76 cg', '17 wv', '38 yw', '45 ei', '11 ek', '48 rh', '83 bx', '62 ev', '36 cw', '7 iz', '95 jk', '61 ku', '89 gc', '17 jy', '52 qs', '43 ud', '26 bq', '21 bq', '66 uc', '4 ou', '20 mj', '3 kx', '55 vo', '42 my', '77 em', '95 uu', '4 ew', '50 sf', '31 og', '35 bz', '67 ci', '73 gj', '2 sd', '79 do', '5 vj', '85 hq', '47 ma', '6 uy', '44 ee', '58 ny', '63 wb', '48 io', '90 qo', '76 yh', '53 kn', '8 cx', '90 yk', '2 wv', '87 ht', '67 rk', '4 mx', '1 mc', '41 kj', '50 wi', '81 ov', '91 xo', '52 ac', '26 jt', '40 wf', '63 od', '91 sg', '87 jt', '75 ww', '61 fm', '16 dr', '71 mp', '50 mh', '46 pu', '69 dx', '17 oo', '53 mg', '3 sd', '74 uo', '0 qy', '39 to', '89 hb', '6 xm', '11 me', '47 lz', '6 hl', '43 on', '56 bd', '71 ig', '90 hh', '99 jn', '12 ll', '80 rv', '7 cc', '41 ol', '91 yk', '92 ms', '62 bk', '33 iy', '15 hp', '52 kw', '72 zo', '20 rl', '57 yy', '62 br', '34 nt', '29 au', '28 da', '3 ot', '50 oo', '44 bt', '97 fe', '45 vl', '86 kw', '97 pv', '9 vu', '23 rj', '83 ee', '69 ty', '89 cv', '11 mq', '39 pq', '93 lx', '25 oj', '18 gh', '71 ey', '40 xz', '55 xd', '64 bl', '21 bo', '15 gf', '98 sj', '10 oe', '2 dw', '28 rv', '31 lv', '40 yg', '72 cp', '63 dn', '45 eu', '64 sc', '63 ib', '87 ye', '43 kd', '53 jj', '41 vs', '85 kh', '39 ki', '46 zq', '32 py', '54 nn', '61 cc', '35 iy', '52 yf', '27 ya', '33 iv', '34 jx', '71 wx', '29 hj', '85 gm', '91 hc', '43 bb', '57 oq', '91 bw', '57 re', '26 hc', '13 no', '32 nm', '37 un', '44 qa', '64 jx', '99 cx', '29 wj', '37 zk', '69 ur', '61 gc', '91 wn', '33 pz', '11 el', '73 ad', '93 zk', '66 kl', '54 ky', '32 jv', '0 uz', '10 la', '97 kk', '27 co', '96 nh', '75 ze', '11 ud', '14 iv', '34 co', '80 zg', '21 qh', '58 ww', '6 cs', '61 kb', '74 mf', '5 zh', '69 wq', '62 en', '84 ad', '17 qv', '63 xu', '93 zh', '2 cd', '99 nr', '2 hr', '62 vo', '5 rt', '52 go', '54 lj', '57 bd', '0 eb', '19 qs', '53 im', '72 fu', '28 qi', '77 gd', '28 qy', '18 ej', '7 ja', '77 bd', '48 on', '76 pi', '93 wr', '94 im', '11 xz', '70 bm', '53 di', '36 zx', '15 xl', '18 es', '1 yu', '49 xj', '16 rm', '82 vk', '80 py', '94 by', '2 qo', '40 ru', '53 rl', '74 gv', '30 so', '52 ps', '82 gu', '53 rs', '35 uj', '41 os', '39 qi', '61 ed', '34 am', '89 ia', '65 ho', '90 jp', '62 vn', '91 dx', '60 ud', '69 up', '33 qb', '6 pl', '16 nt', '29 be', '7 lx', '29 co', '5 dq', '89 hz', '26 fx', '21 os', '25 pc', '25 aj', '8 vr', '56 vh', '18 is', '60 va', '10 dt', '4 aq', '62 pz', '27 gr', '25 md', '87 gu', '75 zr', '68 sh', '30 if', '95 fj', '33 pj', '74 xl', '11 nn', '2 tr', '82 wk', '69 ie', '25 ly', '61 ne', '92 dd', '47 jl', '46 ys', '5 er', '7 de', '70 hs', '59 lh', '46 xu', '22 vx', '21 jn', '48 ek', '48 op', '69 hm', '45 qi', '92 ut', '69 ta', '97 wf', '84 me', '96 wt', '90 ds', '90 rg', '22 zi', '32 oj', '10 im', '15 yl', '60 hu', '56 gw', '83 kc', '36 yv', '23 bl', '77 jn', '7 gy', '77 ug', '58 fz', '44 pi', '92 yb', '11 os', '92 kl', '1 no', '85 vy', '75 zd', '37 hj', '45 yp', '54 ep', '52 hi', '95 aq', '41 ls', '62 wc', '91 la', '56 xp', '31 cx', '32 lt', '2 zv', '12 nz', '44 wu', '51 ul', '66 bd', '29 lv', '92 sd', '24 av', '77 tc', '4 ai', '74 hc', '59 ts', '87 hz', '46 ng', '60 vn', '81 gz', '58 yc', '15 mh', '74 yj', '57 iy', '56 qf', '89 fb', '80 is', '73 za', '85 it', '81 vf', '74 pi', '88 vd', '23 xg', '40 ts', '27 xa', '67 zh', '30 zf', '48 qk', '54 sf', '9 un', '31 pz', '4 vm', '88 py', '80 hf', '77 ls', '78 uw', '73 rt', '70 or', '33 te', '13 nn', '75 ug', '0 fo', '42 du', '55 uz', '68 fc', '87 vn', '13 mr', '98 xo', '80 fv', '97 bk', '92 hq', '46 tz', '41 ho', '79 ls', '38 ft', '19 fr', '8 dk', '37 rw', '15 kp', '30 lg', '42 ut', '78 ht', '70 bu', '22 yw', '36 io', '35 fk', '52 tw', '78 bq', '56 wx', '7 cr', '92 zh', '4 ux', '24 cq', '33 lw', '38 pf', '88 go', '49 mb', '46 rk', '65 sh', '75 jg', '86 ng', '14 qd', '39 wd', '84 sp', '40 zo', '2 ev', '68 sj', '46 hk', '13 li', '16 rf', '16 gk', '84 rn', '72 ul', '7 zp', '31 cg', '90 zl', '63 pk', '69 qi', '95 bz', '24 py', '69 eu', '31 wo', '4 me', '85 jy', '92 ga', '1 wf', '99 xx', '90 dz', '63 fn', '11 xu', '89 hd', '61 tl', '89 ql', '24 up', '92 cj', '93 hf', '57 bw', '82 fj', '65 gs', '40 hv', '54 kv', '47 nv', '45 tz', '17 we', '20 wj', '7 ll']

n = 1000

Benchmark.bm do |benchmark|
  x = benchmark.report('Juan') do
    n.times do
      full_counting_sort_juan(test_arr)
    end
  end

  y = benchmark.report('Carlos') do
    n.times do
      full_counting_sort_carlos(test_arr)
    end
  end

  puts "#{(y.real / x.real) * 100}%"
  puts "#{(x.real / y.real) * 100}%"
end
