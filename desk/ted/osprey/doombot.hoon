/-  osp=osprey, gop=groups, spider
/+  *strandio
=,  strand=strand:spider
::
^-  thread:spider
|=  vaz=vase
=/  m  (strand ,vase)
^-  form:m
::
=/  gro=(unit [id=@uv lim=@ud age=@dr flg=flag:osp])
  !<((unit [@uv @ud @dr flag:osp]) vaz)
;<  bol=bowl:rand  bind:m  get-bowl
?~  gro  (pure:m !>(~))
=?    age.u.gro
    (lth age.u.gro ~d90)
  ~d90
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
=|  olds=(set ship)
::
|-
?~  team
  ?:  =(~ olds)  (pure:m no-op)
  =/  out=cage
    :-  %osprey-updates
    !>([%kick-em id.pol (silt `(list ship)`olds)])
  ;<  ~         bind:m  (watch / [our.bol %osprey] pat)
  ;<  ~         bind:m  (poke [our.bol %osprey] out)
  ;<  cag=cage  bind:m  (take-fact /)
  ?>  ?=(%osprey-actions p.cag)
  =+  act=!<(actions:osp q.cag)
  ?+    -.act  (pure:m no-op)
    %stop  (pure:m no-op)
  ::
      %exec
    =;  do-it=cage
      ;<  ~  bind:m  (poke [our.bol %groups] do-it)
      %-  pure:m
      !>(`updates:actions:osp`[%destroy id.u.gro])
    :-  %group-action-0
    !>(`action:gop`[flg.u.gro now.bol %fleet olds [%del ~]])
  ==
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
