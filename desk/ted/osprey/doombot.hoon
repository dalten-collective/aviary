/-  osp=osprey, gop=groups, spider
/+  *strandio
=,  strand=strand:spider
::
^-  thread:spider
|=  vaz=vase
=/  m  (strand ,vase)
^-  form:m
::
=/  gro=(unit [lim=@ud age=@dr flg=flag:osp])
  !<((unit [@ud @dr flag:osp]) vaz)
;<  bol=bowl:rand  bind:m  get-bowl
?~  gro  (pure:m !>(~))
=?    age.u.gro
    (lth age.u.gro ~d90)
  ~d90
?>  =(our.bol p.flg.u.gro)
;<  =groups:gop  bind:m  (scry groups:gop %gx %groups /groups/noun)
=+  group=(~(got by groups) flg.u.gro)
=+  team=~(tap in ~(key by fleet.group))
=|  olds=(set ship)
::
|-
?~  team
  ?:  =(~ olds)
    (pure:m !>(`updates:actions:osp`[%doombot ~ flg.u.gro]))
  =;  cad=card:agent:gall
    ;<  ~  bind:m  (send-raw-card cad)
    (pure:m !>(`updates:actions:osp`[%doombot olds flg.u.gro]))
  =-  [%pass /doom %agent [our.bol %groups] %poke -]
  group-action-0+!>(`action:gop`[flg.u.gro now.bol %fleet olds [%del ~]])
::
?:  =(our.bol i.team)  $(team t.team)
=+  them=[%ax %$ /peers/(scot %p i.team)]
;<  =ship-state:ames  bind:m  (scry ship-state:ames them)
?.  ?=(%known -.ship-state)  $(team t.team)
?:  (gte last-contact.qos.ship-state (sub now.bol age.u.gro))
  $(team t.team)
?:  =(0 lim.u.gro)  $(team ~)
%=  $
  team       t.team
  lim.u.gro  (dec lim.u.gro)
  olds       (~(put in olds) i.team)
==