/-  osp=osprey, gop=groups, spider
/+  *strandio
=,  strand=strand:spider
::
^-  thread:spider
|=  vaz=vase
=/  m  (strand ,vase)
^-  form:m
::
=/  gro=(unit [rnk=rank:title flg=flag:osp])
  !<((unit [rank:title flag:osp]) vaz)
;<  bol=bowl:rand  bind:m  get-bowl
?~  gro  (pure:m !>(~))
?>  =(our.bol p.flg.u.gro)
;<  =groups:gop  bind:m  (scry groups:gop %gx %groups /groups/noun)
=+  group=(~(got by groups) flg.u.gro)
=+  team=~(tap in ~(key by fleet.group))
=|  bads=(set ship)
::
|-
?~  team
  ?:  =(~ bads)
    (pure:m !>(`updates:actions:osp`[%bootbot rnk.u.gro flg.u.gro]))
  =;  cad=card:agent:gall
    ;<  ~  bind:m  (send-raw-card cad)
    (pure:m !>(`updates:actions:osp`[%bootbot rnk.u.gro flg.u.gro]))
  =-  [%pass /doom %agent [our.bol %groups] %poke -]
  group-action-0+!>(`action:gop`[flg.u.gro now.bol %fleet bads [%del ~]])
::
?:  =(our.bol i.team)                 $(team t.team)
?.  =(rnk.u.gro (clan:title i.team))  $(team t.team)
$(team t.team, bads (~(put in bads) i.team))