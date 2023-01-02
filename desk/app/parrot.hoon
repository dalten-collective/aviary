/-  cha=chat, *parrot
/+  verb, dbug, default-agent
::
|%
::
+$  versioned-state  $%(state-0)
::
+$  state-0
  [%0 =blok =pend =sent =flok =echo]
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
    ~>  %bout.[0 '%parrot +on-init']
    =^  cards  state  abet:init:eng
    [cards this]
  ::
  ++  on-save
    ^-  vase
    ~>  %bout.[0 '%parrot +on-save']
    !>(state)
  ::
  ++  on-load
    |=  ole=vase
    ~>  %bout.[0 '%parrot +on-load']
    ^-  (quip card _this)
    =^  cards  state  abet:(load:eng ole)
    [cards this]
  ::
  ++  on-poke
    |=  cag=cage
    ~>  %bout.[0 '%parrot +on-poke']
    ^-  (quip card _this)
    =^  cards  state  abet:(poke:eng cag)
    [cards this]
  ::
  ++  on-peek
    |=  =path
    ~>  %bout.[0 '%parrot +on-peek']
    ^-  (unit (unit cage))
    [~ ~]
  ::
  ++  on-agent
    |=  [wir=wire sig=sign:agent:gall]
    ~>  %bout.[0 '%parrot +on-agent']
    ^-  (quip card _this)
    =^  cards  state  abet:(dude:eng wir sig)
    [cards this]
  ::
  ++  on-arvo
    |=  [wir=wire sig=sign-arvo]
    ~>  %bout.[0 '%parrot +on-arvo']
    ^-  (quip card _this)
    `this
  ::
  ++  on-watch
  |=  pat=path
  ~>  %bout.[0 '%parrot +on-watch']
  ^-  (quip card _this)
  =^  cards  state  abet:(peer:eng pat)
  [cards this]
  ::
  ++  on-fail
    ~>  %bout.[0 '%parrot +on-fail']
    on-fail:def
  ::
  ++  on-leave
    ::  XX: clean up team?
    ~>  %bout.[0 '%parrot +on-leave']
    on-leave:def
  --
|_  [bol=bowl:gall dek=(list card)]
+*  dat  .
    dok  [our.bol %chat]
    cah  /(scot %p our.bol)/chat/(scot %da now.bol)
++  emit  |=(=card dat(dek [card dek]))
++  emil  |=(lac=(list card) dat(dek (welp lac dek)))
++  abet  ^-((quip card _state) [(flop dek) state])
::  +show: send to ui
::
++  show
  |=  cag=cage
  ^+  dat
  (emit %give %fact [/web-ui]~ cag)
::  +dupe: send to subscribers
::
++  dupe
  |=  [aer=area flg=flag cag=cage]
  ^+  dat
  =-  (emit [%give %fact [-]~ cag])
  `path`/[aer]/(scot %p p.flg)/[q.flg]/updates
::  +scry: scries we may want
::
++  scry
  |%
  ++  chats  .^((set flag) %gx (welp cah /chat/noun))
  --
::  +init: handle on-init
::
++  init
  ^+  dat
  dat
::  +load: handle on-load
::
++  load
  |=  vaz=vase
  ^+  dat
  ?>  ?=([%0 *] q.vaz)
  ::  XX: check for missing subs?
  dat(state !<(state-0 vaz))
::  +peek: handles on-peek
::
++  peek
  |=  pol=(pole knot)
  ^-  (unit (unit cage))
  ?+    pol  !!
    [%blok ~]  ``parrot-state-blok+!>(`_blok`blok)      ::  get blocked hosts
    [%pend ~]  ``parrot-state-pend+!>(`_pend`pend)      ::  get pending invites
    [%sent ~]  ``parrot-state-sent+!>(`_sent`sent)      ::  get sent invitations
    [%flok ~]  ``parrot-state-flok+!>(`_flok`flok)      ::  get current flocks
  ::
      [%aval ~]                                         ::  get available hosts
    =;  used=(set flag)
      ``parrot-state-aval+!>(`(set flag)`(~(dif in chats:scry) used))
    %-  ~(rep by flok)
    |=  [[@ h=flag t=(set flag)] o=(set flag)]
    ?:  =(our.bol p.h)  (~(put in o) h)
    ?~(h=(~(get by t) our.bol) o (~(put in o) our.bol u.h))
  ==
::  +peer: handles on-watch
::
++  peer
  |=  pol=(pole knot)
  ^+  dat
  ?+    pol  ~|(aviary-panic-parrot-watch/pol !!)
      [%web-ui ~]
    ?>  =(our.bol src.bol)
    =~  (show parrot-state-blok+!>(`_blok`blok))
        (show parrot-state-pend+!>(`_pend`pend))
        (show parrot-state-sent+!>(`_sent`sent))
        (show parrot-state-flok+!>(`_flok`flok))
        =;  used=(set flag)
          %-  show
          parrot-state-aval+!>(`(set flag)`(~(dif in chats:scry) used))
        %-  ~(rep by flok)
        |=  [[@ h=flag t=(set flag)] o=(set flag)]
        ?:  =(our.bol p.h)  (~(put in o) h)
        ?~(h=(~(get by t) our.bol) o (~(put in o) our.bol u.h))
    ==
  ::
      [aer=@ who=@ wat=@ %updates ~]
    =+  who=(scot %p who.pol)
    =+  fok=(~(got by flok) aer.pol)
    ?.  =(our.bol p.host.fok)  dat
    %-  emil
    %+  turn  ~(tap in team.fok)
    |=  f=flag
    [%give %fact ~ parrot-action+!>(`actions`[%join host.fok `f])]
  ==
::  +dude: handle on-agent
::
++  dude
  |=  [pol=(pole knot) sig=sign:agent:gall]
  ?+    pol  ~|(aviary-panic-parrot-dude-wire/pol !!)
    ~  dat
  ::
      [%squawk @ ~]
    ?.  ?=(%poke-ack -.sig)
      ~|(aviary-panic-parrot-dude/[pol sig] !!)
    %.  dat
    ?~(p.sig same (slog 'aviary-panic-parrot-squawk-failed' ~))
  ::
      [%fren aer=@ who=@ wat=@ ~]
    ::  other birds
    =+  who=(slav %p who.pol)
    ?+  -.sig  ~|(aviary-panic-parrot-dude/[pol sig] !!)
      %kick  (emit ~(birds look aer.pol ~ who wat.pol))
    ::
        %watch-ack
      %.  dat
      ?~(p.sig same (slog 'aviary-panic-parrot-fren-failed' ~))
    ::
        %fact
      ?+  -.cage.sig  ~|(aviary-panic-parrot-dude/[pol sig] !!)
        %parrot-action   (poke cage.sig)
          %parrot-squawks
        =+  saq=!<(squawks:actions q.cage.sig)
        =^  cards  state
          ch-abet:(ch-sqak:(ch-abed:chor aer.pol who wat.pol) saq)
        (emil cards)
      ==
    ==
  ::
      [%took aer=@ who=@ ~]
    ::  take invite
    =+  who=(slav %p who.pol)
    ?.  ?=(%poke-ack -.sig)
      ~|(aviary-panic-parrot-dude/[pol sig] !!)
    %.  dat
    ?~(p.sig same (slog 'aviary-panic-parrot-took-failed' ~))
  ::
      [%join aer=@ ~]
    ::  join response
    ?.  ?=(%poke-ack -.sig)
      ~|(aviary-panic-parrot-dude/[pol sig] !!)
    ?~  p.sig  dat
    =+  fok=(~(got by flok) aer.pol)
    =+  lev=~(leave look aer.pol ~)
    =/  dit=_dat
      (emil (birds:lev [host.fok ~(tap by team.fok)]))
    %-  show.dit(flok (~(del by flok) aer.pol))
    parrot-action+!>(`actions`[%drop aer.pol ~])
  ::
      [%sent aer=@ who=@ ~]
    ::  send invite
    =+  who=(slav %p who.pol)
    ?.  ?=(%poke-ack -.sig)
      ~|(aviary-panic-parrot-dude/[pol sig] !!)
    =+  sen=(~(get ju sent) aer.pol)
    =+  dem=(~(got by sen) who)
    =+  sat=?~(p.sig [%received now.bol] [%rejected now.bol])
    %.  parrot-status+!>(`status:actions`[aer.pol who sat])
    %=    show
        sent
      %+  ~(put by sent)  aer.pol
      (~(put by (~(del by sen) who)) who dem(sat sat))
    ==
  ::
      [aer=@ %chat who=@ wat=@ ~]
    ::  chats /ui/writs path
    =+  who=(slav %p who.pol)
    =+  lev=~(leave look aer.pol ~)
    ?~  fok=(~(get by flok) aer.pol)
      (emil (birds:lev [who wat.pol]~))
    ?+    -.sig  ~|(aviary-panic-parrot-dude/[pol sig] !!)
      %kick  (emit ~(chats look aer.pol ~ who wat.pol))
    ::
        %watch-ack
      %.  dat
      ?~  p.sig  same
      (slog 'aviary-panic-parrot-watch-failed' u.p.sig)
    ::
        %fact
      =^  cards  state
        ch-abet:(ch-dude:(ch-abed:chor aer.pol [who wat.pol]) cage.sig)
      (emil cards)
    ==
  ==
::  |chor: chat engine
::
++  chor
  |_  $:  =area
          were=flag
          host=flag
          from=flag
          bork=_|
          caz=(list card)
      ==
  +*  ch-core  .
      ch-chat  [our.bol %chat]
  ++  ch-emit  |=(c=card ch-core(caz [c caz]))
  ++  ch-emil  |=(lc=(list card) ch-core(caz (welp lc caz)))
  ++  ch-abet  ^-((quip card _state) [(flop caz) state])
  ::  +ch-sqak: handle incoming squawks
  ::
  ++  ch-sqak
    |=  s=squawks:actions
    %-  ch-emit(echo (~(put in echo) s))
    =-  [%pass /squawk/(scot %da now.bol) %agent ch-chat -]
    [%poke chat-action-0+!>(`action:cha`[were q.p.s %writs s])]
  ++  ch-dupe
    |=  =diff:writs:cha
    %-  ch-emit
    :^  %give  %fact
      [/[area]/(scot %p p.were)/[q.were]/updates]~
    parrot-squawks+!>(`squawks:actions`diff)
  ++  ch-dude
    |=  [mar=mark vaz=vase]
    ?:  ?=(%& bork)
      ((slog 'aviary-panic-parrot-bork' ~) ch-core)
    ?+    mar  ~|(aviary-panic-parrot-chat-dude-mark/mar !!)
        %writ-diff
      =+  diff=!<(diff:writs:cha vaz)
      ?:  (~(has in echo) diff)
        ch-core(echo (~(del in echo) diff))
      ?-  -.q.diff
        %add       (ch-dupe diff)
        %del       (ch-dupe diff)
        %add-feel  (ch-dupe diff)
        %del-feel  (ch-dupe diff)
      ==
    ==
  ++  ch-abed
    |=  [a=^area f=flag]
    ?~  fok=(~(get by flok) a)
      =+  lev=~(leave look a `f)
      %.  chats:lev
      ch-emit(bork %&, area a, from f)
    %=  ch-core
      area  a
      from  f
      host  host.u.fok
    ::
        were
      ?:  =(our.bol -.host.u.fok)  host.u.fok
      [our.bol (~(got by team.u.fok) our.bol)]
    ==
  --
::  +look: watch cards we may want
::
++  look
  |_  [aru=area fug=(unit flag)]
  +*  look  .
  ++  chats
    ^-  card
    =+  flg=`flag`(need fug)
    =+  aer=?>(!=(%$ aru) aru)
    =+  pat=`path`/chat/(scot %p p.flg)/[q.flg]
    [%pass aer^pat %agent dok %watch (welp pat /ui/writs)]
  ::
  ++  birds
    ^-  card
    =+  flg=(need fug)
    =+  aer=?>(!=(%$ aru) aru)
    =+  wir=`path`/[aer]/(scot %p p.flg)/[q.flg]
    =+  pat=(snoc wir %updates)
    [%pass fren+wir %agent [p.flg %parrot] %watch pat]
  ::
  ++  leave
    |%
    ++  chats
      ^-  card
      =+  flg=`flag`(need fug)
      =+  aer=?>(!=(%$ aru) aru)
      =+  pat=/[aer]/chat/(scot %p p.flg)/[q.flg]
      [%pass pat %agent dok %leave ~]
    ++  birds
      |=  l=(list flag)
      ^-  (list card)
      =+  aer=?>(!=(%$ aru) aru)
      %-  zing  %+  turn  l
      |=  f=flag
      =;  car=card
        ^-  (list card)
        ?.  =(our.bol p.f)  [car ~]
        =+  lev=~(leave look aer `f)
        [car chats:lev ~]
      =+  pat=`path`/fren/[aer]/(scot %p p.f)/[q.f]
      [%pass pat %agent [p.f %parrot] %leave ~]
    --
  --
::  +poke: handle on-poke, some of on-dude
::
++  poke
  =<  poke
  |%
  ++  poke
    |=  [mar=mark vaz=vase]
    ^+  dat
    ?+    mar  ~|(aviary-panic-parrot-poke/mar !!)
      %parrot-leaves  ~|(aviary-panic-parrot-got-ui/mar !!)
      %parrot-denies  ~|(aviary-panic-parrot-got-ui/mar !!)
        %parrot-action
      =+  act=!<(actions vaz)
      ?-  -.act
        %kick  dat                                      ::  XX: remove kick and test
        %blok  (stop +.act)
        %free  (free +.act)
        %form  (form +.act)
        %drop  (drop +.act)
        %join  (join host.act join.act ~)
        %send  (send +.act)
      ==
    ::
        %parrot-invite
      =+  inv=!<(invite:actions vaz)
      ?-  -.inv
        %sent  (rcvd +.inv)
        %took  (stol +.inv)
      ==
    ::
    ==
  ::
  ++  rcvd
    |=  [h=flag i=invite]
    ?>  !(~(has in blok) h)
    %-  show(pend (~(put by pend) h i))
    parrot-invite+!>(`invite:actions`[%sent h i])
  ::
  ++  stol
    |=  [h=flag ~]
    %-  show(pend (~(del by pend) h))
    parrot-invite+!>(`invite:actions`[%took h ~])
  ::
  ++  free
    |=  f=flag
    %-  show(blok (~(del in blok) f))
    parrot-action+!>(`actions`[%free f])
  ::  +stop: handles blok, avoid namespace overlap
  ::
  ++  stop
    |=  f=flag
    %.  parrot-action+!>(`actions`[%blok f])
    show(blok (~(put in blok) f), pend (~(del by pend) f))
  ::
  ++  form
    |=  [a=area c=flag]
    ~_  'AVIARY: parrot error, pre-existing flok area.'
    ?>  !(~(has by flok) a)
    ~_  'AVIARY: parrot error, only one flok per chat.'
    ?>  %-  ~(all by flok)
        |=  [h=flag t=(set flag)]
        &(!=(h c) !(~(has in t) c))
    =/  dit=_dat
      (emit ~(chats look a `c))
    %-  show.dit(flok (~(put by flok) a [c ~]))
    parrot-action+!>(`actions`[%form a c])
  ::
  ++  send
    |=  [a=area b=(each [note=@t them=(set @p)] @p)]
    =+  fok=(~(got by flok) a)
    ~_  'AVIARY: parrot error, only hosts make invite.'
    ?>  ?&  =(our.bol src.bol)
            =(our.bol -.host.fok)
        ==
    ?:  ?=(%& -.b)
      ~_  'AVIARY: parrot error, already part of team.'
      ?<  (~(any in team.fok) |=(f=flag (~(has in them.p.b) p.f)))
      ::  if it's a `[%& *]`, invite some birds.
      ::
      =+  inv=[a note.p.b now.bol]
      =+  cag=parrot-invite+!>(`invite:actions`[%sent host.fok inv])
      =/  sen=(map @p [inv=invite sat=status])
        ?~(hav=(~(get by sent) a) ~ u.hav)
      =;  [lac=(list card) s=_sent]
        =.  sent  s
        %.  lac
        emil:(show parrot-action+!>(`actions`[%send a b]))
      %-  ~(rep in `(set @p)`them.p.b)
      |=  [p=@p [l=(list card) s=_sent]]
      :-  :_  l
          ^-  card
          :+  %pass  /sent/[a]/(scot %p p)
          [%agent [p %parrot] %poke cag]
      ?.  (~(has by sen) p)
        (~(put ju s) a p inv %transmit)
      %+  ~(put by s)  a
      (~(put by (~(del by sen) p)) p inv %transmit)
    ::  if its a `[%| @p]`, yank the invite
    ::
    ~_  'AVIARY: parrot error, invite some bird first.'
    =+  hav=(~(got by sent) a)
    ?>  (~(has by hav) p.b)
    =+  cag=parrot-invite+!>(`invite:actions`[%took host.fok ~])
    =+  dit=(show parrot-status+!>(`status:actions`[a p.b %deleted]))
    %-  emit.dit(sent (~(put by sent) a (~(del by hav) p.b)))
    [%pass /took/[a]/(scot %p p.b) %agent [p.b %parrot] %poke cag]
  ::
  ++  drop
    |=  [a=area ~]
    =+  fok=(~(got by flok) a)
    =+  lev=~(leave look a ~)
    ~_  'AVIARY: parrot error, maybe you already left.'
    ::  if we're the actor, then...
    ::
    ?:  =(our.bol src.bol)
      ::  show and tell, and clean; or
      ::
      =/  us=flag
        ?:  =(our.bol p.host.fok)  host.fok
        [our.bol (~(got by team.fok) our.bol)]
      =;  dit=_dat
          %-  dupe:dit(flok (~(del by flok) a))
          [a us parrot-action+!>(`actions`[%drop a ~])]
      %-  show:(emil (birds:lev [host.fok ~(tap in team.fok)]))
      parrot-leaves+!>(`leaves:actions`[host.fok %& [%drop a ~]])
    ::  else, if they're the host, then...
    ::
    ?:  =(p.host.fok src.bol)
      ::  clean the flok, leave everyone; or
      ::
      =-  (emil:- (birds:lev [host.fok ~(tap in team.fok)]))
      %-  show(flok (~(del by flok) a))
      parrot-leaves+!>(`leaves:actions`[host.fok %& [%drop a ~]])
    ::  else, just leave the bird.
    ::
    =+  them=[src.bol (~(got by team.fok) src.bol)]
    =-  (emil:- (birds:lev [them]~))
    %.  parrot-leaves+!>(`leaves:actions`[them %| [%drop a ~]])
    show(flok (~(put by flok) a fok(team (~(del in team.fok) them))))
  ::
  ++  join
    |=  [h=flag j=(unit flag) a=(unit area)]
    ^+  dat
    =+  cag=parrot-action+!>(`actions`[%join h j])
    ::  if we're the actor, then...
    ::
    ?:  =(our.bol src.bol)
      ::  if we're declining, then...
      ::
      ?~  j
        ::  clean up and notify; or
        ::
        %-  emit:(show(pend (~(del by pend) h)) cag)
        [%pass / %agent [p.h %parrot] %poke cag]
      ::  else, notify, prepare and subscribe.
      ::
      =+  hav=(~(got by pend) h)
      =-  (show:- cag)
      %-  %=  emil
            pend  (~(del by pend) h)
            flok  (~(put by flok) area.hav [h (silt [(need j)]~)])
          ==
      :~  ~(birds look area.hav `h)
          ~(chats look area.hav j)
          [%pass /join/[area.hav] %agent [p.h %parrot] %poke cag]
      ==
    ::  else, detect area; and
    ::
    =/  aer=area
      %-  need
      ^-  (unit area)
      %-  ~(rep by flok)
      |=([[a=area ho=flag *] o=(unit area)] ?.(=(h ho) o `a))
    =+  fok=(~(got by flok) aer)
    ::  if we're a bird, then...
    ::
    ?.  =(our.bol p.h)
      ::  add the new team member and subscribe; or
      ::
      =-  (emit:- ~(birds look aer j))
      %.  cag
      %=    show
          flok
        (~(put by flok) aer fok(team (~(put in team.fok) (need j))))
      ==
    ::  
    =+  sen=(~(get ju sent) aer)
    =+  dem=(~(got by sen) src.bol)
    ::  if they're declining, then...
    ::
    ?~  j
      ::  update their status; or
      ::
      %.  parrot-denies+!>(`denies:actions`[src.bol aer now.bol])
      %=    show
          sent
        %.  [aer src.bol dem(sat [%rejected now.bol])]
        ~(put ju (~(del ju sent) aer src.bol dem))
      ==
    ::  else, tell the birds and subscribe.
    ::
    ?>  =(src.bol -:(need j))
    =-  (dupe:(emit:- ~(birds look aer j)) aer h cag)
    %.  cag
    %=    show
        sent
      %-  ~(put ju (~(del ju sent) aer src.bol dem))
      [aer src.bol dem(sat [%affirmed now.bol])]
    ::
        flok
      %-  ~(put by flok)
      [aer fok(team (~(put in team.fok) (need j)))]
    ==
  --
--