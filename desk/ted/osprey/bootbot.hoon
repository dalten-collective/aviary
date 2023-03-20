/-  osp=osprey, gop=groups, spider
/+  *strandio
=,  strand=strand:spider
::
^-  thread:spider
|=  vaz=vase
=/  m  (strand ,vase)
^-  form:m
::
=/  gro=(unit [id=@uv rnk=rank:title flg=flag:osp])
  !<((unit [@uv rank:title flag:osp]) vaz)
;<  bol=bowl:rand  bind:m  get-bowl
?~  gro  (pure:m !>(~))
?>  =(our.bol p.flg.u.gro)
;<  =groups:gop  bind:m  (scry groups:gop %gx %groups /groups/noun)
=/  pat=path
  =+  bot=(scot %tas %doom)
  =+  id=(scot %uv id.u.gro)
  =+  who=(scot %p p.flg.u.gro)
  =+  wat=(scot %tas q.flg.u.gro)
  =+  lim=(scot %ud lim.u.gro)
  =+  age=(scot %dr age.u.gro)
  confirm+[bot id who wat lim age ~]
=+  group=(~(got by groups) flg.u.gro)
=+  team=~(tap in ~(key by fleet.group))
=+  no-op=!>(`updates:actions:osp`[%ignored id.u.gro])
=|  bads=(set ship)
::
|-
?~  team
  ?:  =(~ bads)  (pure:m no-op)
  =/  out=cage
    :-  %osprey-updates
    !>([%kick-em id.pol (silt `(list ship)`bads)])
  ;<  ~         bind:m  (watch / [our.bol %osprey] pat)
  ;<  ~         bind:m  (poke [our.bol %osprey] out)
  ;<  cag=cage  bind:m  (take-fact /)
  ?>  ?=(%osprey-actions p.cag)
  =+  -.act  (pure:m no-op)
  ?+    -.act  (pure:m no-op)
    %stop  (pure:m no-op)
  ::
      %exec
    =;  do-it=cage
      ;<  ~  bind:m  (poke [our.bol %groups] do-it)
      %-  pure:m
      !>(`updates:actions:osp`[%destroy id.u.gro])
    :-  %group-action-0
    !>(`action:gop`[flg.u.gro now.bol %fleet bads [%del ~]])
  ==
::
?:  =(our.bol i.team)                 $(team t.team)
?.  =(rnk.u.gro (clan:title i.team))  $(team t.team)
$(team t.team, bads (~(put in bads) i.team))