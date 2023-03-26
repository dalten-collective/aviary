::  aviary - osprey
::  a peat by other
::  name would smel
::  of four letters
::  - by quartus
/-  *osprey, cha=chat, dia=diary, hyp=heap, gop=groups
/+  verb, dbug, default-agent, ohp=osprey-http
::
|%
::
+$  versioned-state  $%(state-0)
::
+$  state-0
  $:  %0
      sched=schedule
      mails=mailslot
      kicks=on-trial
  ==
::
::  boilerplate
::
+$  card  card:agent:gall
--
::
%+  verb  &
%-  agent:dbug
=|  state-0
=*  state  -
::
^-  agent:gall
::
=<
  |_  =bowl:gall
  +*  this  .
      def  ~(. (default-agent this %|) bowl)
      eng   ~(. +> [bowl ~])
  ++  on-init
    ^-  (quip card _this)
    ~>  %bout.[0 '%osprey +on-init']
    =^  cards  state  abet:init:eng
    [cards this]
  ::
  ++  on-save
    ^-  vase
    ~>  %bout.[0 '%osprey +on-save']
    !>(state)
  ::
  ++  on-load
    |=  ole=vase
    ~>  %bout.[0 '%osprey +on-load']
    ^-  (quip card _this)
    =^  cards  state  abet:(load:eng ole)
    [cards this]
  ::
  ++  on-poke
    |=  [mar=mark vaz=vase]
    ~>  %bout.[0 '%osprey +on-poke']
    =^  cards  state  abet:(poke:eng mar vaz)
    [cards this]
  ::
  ++  on-peek
    |=  pat=path
    ~>  %bout.[0 '%osprey +on-peek']
    ^-  (unit (unit cage))
    (peek:eng pat)
  ::
  ++  on-agent
    |=  [wir=wire sig=sign:agent:gall]
    ~>  %bout.[0 '%osprey +on-agent']
    ^-  (quip card _this)
    =^  cards  state  abet:(dude:eng wir sig)
    [cards this]
  ::
  ++  on-arvo
    |=  [wir=wire sig=sign-arvo]
    ~>  %bout.[0 '%osprey +on-arvo']
    ^-  (quip card _this)
    =^  cards  state  abet:(arvo:eng wir sig)
    [cards this]
  ::
  ++  on-watch
    |=  pat=path
    ~>  %bout.[0 '%osprey +on-watch']
    ^-  (quip card _this)
    =^  cards  state  abet:(peer:eng pat)
    [cards this]
  ::
  ++  on-fail
    ~>  %bout.[0 '%osprey +on-fail']
    on-fail:def
  ::
  ++  on-leave
    ~>  %bout.[0 '%osprey +on-leave']
    on-leave:def
  --
|_  [bol=bowl:gall dek=(list card)]
+*  dat  .
    hod  [our.bol %hood]
    gok  [our.bol %groups]
    gep  /(scot %p our.bol)/groups/(scot %da now.bol)
    aem  /(scot %p our.bol)//(scot %da now.bol)
++  emit  |=(=card dat(dek [card dek]))
++  emil  |=(lac=(list card) dat(dek (welp lac dek)))
++  abet
  ^-  (quip card _state)
  [(flop dek) state]
::  +show: send to ui
::
++  show
  |=  cag=cage
  ^+  dat
  (emit %give %fact [/web-ui]~ cag)
::
++  init
  ^+  dat
  (emit %pass /init %arvo %b %wait now.bol)
::
++  load
  |=  vaz=vase
  ^+  dat
  ?>  ?=([%0 *] q.vaz)
  dat(state !<(state-0 vaz))
::  +dude: handle on-agent
::
++  dude
  |=  [wir=wire sig=sign:agent:gall]
  ?+    wir  ~|(aviary-panic-osprey-dude/[wir sig] !!)
      [%exec ~]
    ~_  'AVIARY: osprey error, failure on groups kick.'
    ?>(?=([%poke-ack *] sig) ?~(p.sig dat !!))
  ::
      [%roster @ ~]
    ?+    -.sig  !!
        %poke-ack
      %.  dat
      ?~(p.sig same (slog 'aviary-panic-fail-hood' u.p.sig))
    ==
  ==
::  +poke: handle on-poke
::
++  poke
  |=  [mar=mark vaz=vase]
  ?+    mar  ~|(aviary-panic-osprey-poke/mar !!)
      %handle-http-request
    =+  !<([id=@ta req=inbound-request:eyre] vaz)
    =/  hav=(set flag)
      (~(uni in (~(uni in chats:scry) diaries:scry)) heaps:scry)
    =/  don=[caz=(list card) id=@ta]
      =~  %.  [bol id req groups:scry hav]
          hp-abed:handle-http-request:ohp
          hp-abet:hp-hndl
      ==
    ?>(=(id id.don) (emil (flop caz.don)))
  ::
      %osprey-actions
    =+  act=!<(actions vaz)
    ?-    -.act
        %read
      ?>  =(our.bol src.bol)
      ?<  ?&  (~(has in all:scry) [our.bol wer.act])
            ::
              %-  %~  any  in
                %-  sy
                (turn wic.act |=([@ o=flag n=@tas] [our.bol n]))
              |=  f=flag
              |(!=(our.bol p.f) (~(has in all:scry) f))
          ==
      ?~  open=(~(got bi mails) who.act wat.act)
        ~|(aviary-panic-bad-read/[who wat]:act !!)
      =/  pat=path
        /refresh/(scot %p our.bol)/[wer.act]
      =+  read=u.open
      %-  emit:(show mar vaz)
      =-  [%pass pat %arvo %k %fard %aviary -]
      :+  %osprey-virtual-in
        %noun
      !>  ^-  (unit [_+.act (list @p) (list @p) (list email)])
      `[+.act member.read admins.read config.read]
    ::
        %kill
      ?>  =(our.bol src.bol)
      %.  [mar vaz]
      show(mails (~(del bi mails) who.act wat.act))
    ::
        %open
      ?>  =(our.bol src.bol)
      ?<  (~(has bi mails) who.act wat.act)
      %.  [mar vaz]
      show(mails (~(put bi mails) who.act wat.act ~))
    ::
        %mail
      ?>  =(our.bol src.bol)
      =/  pat=path
        /mail/(scot %p who.act)/flag/(scot %p p.wat.act)/[q.wat.act]
      %-  emit:(show mar vaz)
      =-  [%pass pat %arvo %k %fard %aviary -]
      [%osprey-virtual-out noun+!>(`(unit [@p flag])``+.act)]
    ::
        %take
      ?>  (~(has bi mails) src.bol wat.act)
      =.  mails
        (~(put bi mails) src.bol wat.act `+>.act)
      =;  [mem=cage adm=cage]
        %-  emil:(show [mar vaz])
        :~  [%pass /roster/mem %agent hod %poke mem]
            [%pass /roster/adm %agent hod %poke adm]
        ==
      :-
        :-  %dill-blit
        !>  ^-  dill-blit:dill
        :-  %sav
        :_  %-  of-wain:format
            %+  turn  mem.act
            |=(p=@p `@`(cat 3 (scot %p p) '\0a'))
        ;:  welp
          /(scot %p src.bol)
          /[(rap 3 (scot %p p.wat.act) '-' q.wat.act ~)]
          /members-list/txt
        ==
      :-  %dill-blit
      !>  ^-  dill-blit:dill
      :-  %sav
      :_  %-  of-wain:format
          %+  turn  adm.act
          |=(p=@p `@`(cat 3 (scot %p p) '\0a'))
      ;:  welp
        /(scot %p src.bol)
        /[(rap 3 (scot %p p.wat.act) '-' q.wat.act ~)]
        /administrator-list/txt
      ==
    ::
        %boot
      ?>  =(our.bol src.bol)
      =+  gops=.^(groups:gop %gx (welp gep /groups/noun))
      =+  group=(~(got by gops) group.act)
      =;  boots=(list ship)
        %.  [mar vaz]
        %=    show
            kicks
          %-  ~(put by kicks)
          [(sham act) [group.act [%boot rank.act] boots]]
        ==
      %+  murn  ~(tap in ~(key by fleet.group))
      |=  a=ship
      ^-  (unit ship)
      ?:(=(our.bol a) ~ ?.(=(rank.act (clan:title a)) ~ `a))
    ::
        %doom
      ?>  =(our.bol src.bol)
      =+  gops=.^(groups:gop %gx (welp gep /groups/noun))
      =+  group=(~(got by gops) group.act)
      =;  dooms=(list ship)
        %.  [mar vaz]
        %=    show
            kicks
          %-  ~(put by kicks)
          :-  (sham act)
          [group.act [%doom limit.act age.act] dooms]
        ==
      =+  guys=~(tap in ~(key by fleet.group))
      =|  malo=(list ship)
      |-  ?~  guys  malo
      ?:  =(our.bol i.guys)  $(guys t.guys)
      =/  sat=ship-state:ames
        .^(ship-state:ames %ax (welp aem /peers/(scot %p i.guys)))
      ?.  ?=(%known -.sat)  $(guys t.guys, malo [i.guys malo])
      ?:  (gte last-contact.qos.sat (sub now.bol age.act))
        $(guys t.guys)
      ?:  =(0 limit.act)  $(guys ~)
      %=  $
        guys       t.guys
        malo       [i.guys malo]
        limit.act  (dec limit.act)
      ==
    ::
        %stop
      (show(kicks (~(del by kicks) id.act)) mar vaz)
    ::
        %exec
      =+  hav=(~(got by kicks) id.act)
      =;  do-it=cage
        =.  kicks  (~(del by kicks) id.act)
        (emit:(show mar vaz) [%pass /exec %agent gok %poke do-it])
      :-  %group-action-0
      !>(`action:gop`[flag.hav now.bol %fleet (silt ships.hav) [%del ~]])
    ::
        ?(%mine %heap %diary %chat %group)
      ?>  =(our.bol src.bol)
      %-  emit:(show mar vaz)
      =-  [%pass /archive/(scot %ud (jam act)) %arvo %k %fard -]
      [%aviary %osprey-archive noun+!>(`(unit _act)``act)]
    ::
        %repeat
      ?>  =(our.bol src.bol)
      ~_  'AVIARY: osprey error, identical backup set.'
      ?~  oft.act
        %.  [mar vaz]
        show(sched (~(del by sched) arc.act))
      ::
      =+  freq=?:((lth u.oft.act ~m5) ~m5 u.oft.act)
      ?:  ?~(hav=(~(get by sched) arc.act) %| =(freq every.u.hav))  !!
      =/  pat=path
        /behn/(scot %ud (jam arc.act))/(scot %da now.bol)/(scot %dr freq)
      =/  dit=_dat
        %.  osprey-actions+!>(`actions`arc.act)
        poke(sched (~(put by sched) arc.act now.bol freq))
      %-  emit:(show:dit [mar vaz])
      [%pass pat %arvo %b %wait (add now.bol freq)]
    ==
  ==
::  +arvo: handle on-arvo
::
++  arvo
  |=  [pol=(pole knot) sig=sign-arvo]
  ^+  dat
  ?+    pol  ~|(aviary-panic-osprey-arvo/[pol sig] !!)
      [%init ~]
    ~_  'AVIARY: osprey error, failure to bind upload.'
    ?>  ?=([%behn %wake *] sig)
    %-  emit
    =-  [%pass /eyre/connect %arvo %e -]
    [%connect [[~ [%apps %aviary %osprey %upload ~]] dap.bol]]
  ::
      [%eyre %connect ~]
    ~_  'AVIARY: osprey error, failure to bind upload.'
    ?>  ?=([%eyre %bound %& *] sig)
    dat
  ::
      [%archive act=@ ~]
    ~_  'AVIARY: osprey error, archive thread failure.'
    =+  act=;;(actions (cue (slav %ud act.pol)))
    ?>  ?=([%khan %arow *] sig)
    ?:  ?=(%& -.p.+.sig)
      (show osprey-updates++.p.p.+.sig)
    %.  dat
    (slog 'aviary-panic-archive-thread-fail' tang.p.p.+.sig)
  ::
      [%restore jam=@ ~]
    ~_  'AVIARY: osprey error, restore thread failure.'
    =/  data
      ;;  $:  t=?(%dm %club %chat %heap %diary)
            g=(each term flag)
            o=frag
            c=term
            j=@ud
          ==
      (cue (slav %ud jam.pol))
    ?>  ?=([%khan %arow *] sig)
    ?:  ?=(%& -.p.+.sig)
      (show osprey-updates++.p.p.+.sig)
    %.  dat
    (slog 'aviary-panic-restore-thread-fail' tang.p.p.+.sig)
  ::
      [%mail who=@ %flag hos=@ nam=@ ~]
    ~_  'AVIARY: osprey error, discarding evil emails.'
    ?>  ?=([%khan %arow *] sig)
    ?:  ?=(%& -.p.+.sig)
      (show osprey-updates++.p.p.+.sig)
    %.  dat
    (slog 'aviary-panic-email-fail' tang.p.p.+.sig)
  ::
      [%refresh who=@ wat=@ ~]
    ~_  'AVIARY: osprey error, failed refresh attempt.'
    ?>  ?=([%khan %arow *] sig)
    ?:  ?=(%& -.p.+.sig)
      (show osprey-updates++.p.p.+.sig)
    %.  dat
    (slog 'aviary-panic-refresh-fail' tang.p.p.+.sig)
  ::
      [%behn jam=@ last=@ freq=@ ~]
    ~_  'AVIARY: osprey error, discarding evil timers.'
    =+  act=;;(archive:actions (cue (slav %ud jam.pol)))
    =+  frq=(slav %dr freq.pol)
    =+  lst=(slav %da last.pol)
    ?>  ?&  ?=([%behn %wake *] sig)
            =([lst frq] (~(got by sched) act))
        ==
    ?^  error.sig
      %-  (slog 'aviary-panic-timer-fail' u.error.sig)
      %.  osprey-actions+!>(`actions`[%repeat act ~])
      show(sched (~(del by sched) act))
    =.  sched  (~(put by sched) act [now.bol frq])
    %-  emit:(poke osprey-actions+!>(`actions`act))
    [%pass pol(last (scot %da now.bol)) %arvo %b %wait (add now.bol frq)]
  ==
::  +peer: handle on-watch
::
++  peer
  |=  pol=(pole knot)
  ^+  dat
  ?+    pol  ~|(aviary-panic-osprey-watch/pol !!)
    [%http-response @ ~]  dat
  ::
      [%web-ui ~]
    ?>  =(our.bol src.bol)
    =~  (show osprey-state-ship+!>(`(set ship)`dms:scry))
        (show osprey-state-aval+!>(`[@t (set flag)]`['EVERY' all:scry]))
        (show osprey-state-aval+!>(`[@t (set flag)]`['CHATS' chats:scry]))
        (show osprey-state-aval+!>(`[@t (set flag)]`['HEAPS' heaps:scry]))
        (show osprey-state-aval+!>(`[@t (set flag)]`['GROUPS' groups:scry]))
        (show osprey-state-aval+!>(`[@t (set flag)]`['DIARIES' diaries:scry]))
        (show osprey-state-schedule+!>(`schedule`sched))
        (show osprey-state-schedule+!>(`mailslot`mails))
        (show osprey-state-on-trial+!>(`on-trial`kicks))
    ==
  ==
::  +peek: handle on-peek
::
++  peek
  |=  pol=(pole knot)
  ?+    pol  !!
      [%x %dms ~]       
    ``osprey-state-ship+!>(`(set ship)`dms:scry)
      [%x %every ~]     
    ``osprey-state-aval+!>(`[@t (set flag)]`['EVERY' all:scry])
      [%x %chats ~]     
    ``osprey-state-aval+!>(`[@t (set flag)]`['CHATS' chats:scry])
      [%x %heaps ~]     
    ``osprey-state-aval+!>(`[@t (set flag)]`['HEAPS' heaps:scry])
      [%x %groups ~]    
    ``osprey-state-aval+!>(`[@t (set flag)]`['GROUPS' groups:scry])
      [%x %diaries ~]   
    ``osprey-state-aval+!>(`[@t (set flag)]`['DIARIES' diaries:scry])
      [%x %schedule ~]  
    ``osprey-state-schedule+!>(`schedule`sched)
      [%x %mailslot ~]
    ``osprey-state-mailslot+!>(`mailslot`mails)
      [%x %on-trial ~]
    ``osprey-state-on-trial+!>(`on-trial`kicks)
      [%x %dbug %state ~]
    =/  kex=(map @uv [flag data ?(%none %some)])
      %-  ~(rep by kicks)
      |=  $:  [k=@uv [f=flag d=data e=nade]]
              o=(map @uv [flag data ?(%none %some)])
          ==
      (~(put by o) [k f d ?~(e %none %some)])
    =/  mel=(mip @p flag @t)
      %+  roll  ~(tap bi mails)
      |=  $:  $:  p=@p
                  f=flag
                  u=(unit [m=(list @p) a=(list @p) c=(list email)])
              ==
              m=(mip @p flag @t)
          ==
      %-  ~(put bi m)
      [p f ?~(u 'awaiting-delivery' 'pending-refresh')]
    ``state+!>([%0 schedule=sched on-trial=kex mailboxes=mel])
  ==
::  +scry: scries we may want
::
++  scry
  |%
  ++  dok
    |=(d=dude:gall /(scot %p our.bol)/[d]/(scot %da now.bol))
  ++  dms  .^((set ship) %gx (welp (dok %chat) /dm/noun))
  ++  flg  |=(f=flag ?.(=(our.bol p.f) ~ `f))
  ++  all
    ^-  (set flag)
    (~(uni in chats) (~(uni in diaries) (~(uni in heaps) groups)))
  ::
  ++  chats
    %-  silt
    ^-  (list flag)
    %-  murn  :_  flg
    ~(tap in .^((set flag) %gx (welp (dok %chat) /chat/noun)))
  ::
  ++  diaries
    %-  silt
    ^-  (list flag)
    %-  murn  :_  flg
    ~(tap in ~(key by .^((map flag *) %gx (welp (dok %diary) /shelf/noun))))
  ::
  ++  heaps
    %-  silt
    ^-  (list flag)
    %-  murn  :_  flg
    ~(tap in ~(key by .^((map flag *) %gx (welp (dok %heap) /stash/noun))))
  ::
  ++  groups
    %-  silt
    ^-  (list flag)
    %-  murn  :_  flg
    ~(tap in ~(key by .^((map flag *) %gx (welp (dok %groups) /groups/noun))))
  --
--
