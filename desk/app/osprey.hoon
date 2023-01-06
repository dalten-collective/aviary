/-  *osprey, cha=chat, dia=diary, hyp=heap
/+  verb, dbug, default-agent, ohp=osprey-http
::
|%
::
+$  versioned-state  $%(state-0)
::
+$  state-0
  $:  %0
      sched=schedule
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
    =^  cards  state
      ?+    mar
        abet:(poke:eng mar vaz)
      ::
          %handle-http-request
        =+  !<([id=@ta req=inbound-request:eyre] vaz)
        =/  hav=(set flag)
          (~(uni in (~(uni in chats:scry:eng) diaries:scry:eng)) heaps:scry:eng)
        =/  don=[caz=(list card) id=@ta]
          =~  %.  [bowl id req groups:scry:eng hav]
              hp-abed:handle-http-request:ohp
              hp-abet:hp-hndl
          ==
        ?>  =(id id.don)
        [caz.don state]
      ==
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
    `this
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
++  emit  |=(=card dat(dek [card dek]))
++  emil  |=(lac=(list card) dat(dek (welp lac dek)))
++  abet
  ^-  (quip card _state)
  [(flop dek) state]
::  +show: send to ui
::
++  show
  |=  cag=cage
  ?>  =(our.bol src.bol)
  ^+  dat
  (emit %give %fact [/web-ui]~ cag)
::
++  init
  ^+  dat
  %-  emit
  [%pass /init %arvo %b %wait now.bol]
::
++  load
  |=  vaz=vase
  ^+  dat
  ?>  ?=([%0 *] q.vaz)
  dat(state !<(state-0 vaz))
::  +poke: handle on-poke
::
++  poke
  |=  [mar=mark vaz=vase]
  ?>  =(our.bol src.bol)
  ?+    mar  ~|(aviary-panic-osprey-poke/mar !!)
    %osprey-updates  (show mar vaz)
  ::
      %handle-http-request
    =+  !<([id=@ta req=inbound-request:eyre] vaz)
    =/  hav=(set flag)
      (~(uni in (~(uni in chats:scry) diaries:scry)) heaps:scry)
    =/  don=[caz=(list card) id=@ta]
      =~  %.  [bol id req groups:scry hav]
          hp-abed:handle-http-request:ohp
          hp-abet:hp-hndl
      ==
    ?>  =(id id.don)
    (emil caz.don)
    
  ::
      %osprey-actions
    =+  act=!<(actions vaz)
    ?-    -.act
        %boot
      %-  emit:(show mar vaz)
      =-  [%pass /bootbot/(scot %ud (jam act)) %arvo %k %fard -]
      :+  %aviary  %osprey-bootbot
      noun+!>(`(unit [rank:title flag])``+.act)
    ::
        %doom
      %-  emit:(show mar vaz)
      =-  [%pass /doombot/(scot %ud (jam act)) %arvo %k %fard -]
      :+  %aviary  %osprey-doombot
      noun+!>(`(unit [@ud @dr flag])``+.act)
    ::
        ?(%mine %heap %diary %chat %group)
      %-  emit:(show mar vaz)
      =-  [%pass /archive/(scot %ud (jam act)) %arvo %k %fard -]
      [%aviary %osprey-archive noun+!>(`(unit _act)``act)]
    ::
        %repeat
      ~_  'AVIARY: osprey error, identical backup set.'
      ?~  oft.act
        %.  [mar vaz]
        show(sched (~(del by sched) arc.act))
      ::
      :: =+  freq=?:((lth u.oft.act ~h12) ~h12 u.oft.act)  ::  XX: replace dbug component below
      =+  freq=?:((lth u.oft.act ~m1) ~m1 u.oft.act)
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
  ?+    pol  ~|(aviary-panic-osprey-dude/[pol sig] !!)
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
      [%doombot act=@ ~]
    ~_  'AVIARY: osprey error, doombot thread failure.'
    =+  act=;;(actions (cue (slav %ud act.pol)))
    ?>  ?=([%khan %arow *] sig)
    ?:  ?=(%& -.p.+.sig)
      (show osprey-updates++.p.p.+.sig)
    %.  dat
    (slog 'aviary-panic-doombot-thread-fail' tang.p.p.+.sig)
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
      [%behn jam=@ last=@ freq=@ ~]
    ~_  'AVIARY: osprey error, discarding evil timers.'
    =+  act=;;(archive:actions (cue (slav %ud jam.pol)))
    =+  frq=(slav %dr freq.pol)
    =+  lst=(slav %da last.pol)
    ~&  >  [[lst frq] (~(got by sched) act)]
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
      [%web-ui ~]
    ?>  =(our.bol src.bol)
    =~  (show osprey-state-ship+!>(`(set ship)`dms:scry))
        (show osprey-state-aval+!>(`[@t (set flag)]`['CHATS' chats:scry]))
        (show osprey-state-aval+!>(`[@t (set flag)]`['HEAPS' heaps:scry]))
        (show osprey-state-aval+!>(`[@t (set flag)]`['GROUPS' groups:scry]))
        (show osprey-state-aval+!>(`[@t (set flag)]`['DIARIES' diaries:scry]))
        (show osprey-state-schedule+!>(`schedule`sched))
    ==
  ==
::  +peek: handle on-peek
::
++  peek
  |=  pol=(pole knot)
  ?+    pol  !!
    [%x %dms ~]       ``osprey-state-ship+!>(`(set ship)`dms:scry)
    [%x %chats ~]     ``osprey-state-aval+!>(`[@t (set flag)]`['CHATS' chats:scry])
    [%x %heaps ~]     ``osprey-state-aval+!>(`[@t (set flag)]`['HEAPS' heaps:scry])
    [%x %groups ~]    ``osprey-state-aval+!>(`[@t (set flag)]`['GROUPS' groups:scry])
    [%x %diaries ~]   ``osprey-state-aval+!>(`[@t (set flag)]`['DIARIES' diaries:scry])
    [%x %schedule ~]  ``osprey-state-schedule+!>(`schedule`sched)
  ==
::  +scry: scries we may want
++  scry
  |%
  ++  dok
    |=(d=dude:gall /(scot %p our.bol)/[d]/(scot %da now.bol))
  ++  dms  .^((set ship) %gx (welp (dok %chat) /dm/noun))
  ++  flg  |=(f=flag ?.(=(our.bol p.f) ~ `f))
  ++  chats
    %-  silt
    ^-  (list flag)
    %-  murn  :_  flg
    ~(tap in .^((set flag) %gx (welp (dok %chat) /chat/noun)))
  ++  diaries
    %-  silt
    ^-  (list flag)
    %-  murn  :_  flg
    ~(tap in ~(key by .^((map flag *) %gx (welp (dok %diary) /shelf/noun))))
  ++  heaps
    %-  silt
    ^-  (list flag)
    %-  murn  :_  flg
    ~(tap in ~(key by .^((map flag *) %gx (welp (dok %heap) /stash/noun))))
  ++  groups
    %-  silt
    ^-  (list flag)
    %-  murn  :_  flg
    ~(tap in ~(key by .^((map flag *) %gx (welp (dok %groups) /groups/noun))))
  --
--
