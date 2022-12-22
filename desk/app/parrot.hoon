/-  cha=chat, *parrot
/+  verb, dbug, default-agent
::
|%
::
+$  versioned-state  $%(state-0)
::
+$  state-0
  [%0 =blok =pend =sent =flok]
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
  |=  =path
  ~>  %bout.[0 '%parrot +on-watch']
  ^-  (quip card _this)
  `this
  ::
  ++  on-fail
    ~>  %bout.[0 '%parrot +on-fail']
    on-fail:def
  ::
  ++  on-leave
    ~>  %bout.[0 '%parrot +on-init']
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
::  +look: watch cards we may want
::
++  look
  |_  [aru=area fug=(unit flag)]
  ++  chat  `card`[%pass /chat/ui %agent dok %watch /ui]
  ++  chats
    ^-  card
    =+  flg=`flag`(need fug)
    =+  aer=?>(!=(%$ aru) aru)
    =+  pat=`path`/chat/(scot %p p.flg)/[q.flg]
    [%pass aer^pat %agent dok %watch (snoc pat %ui)]
  ::
  ++  birds
    ^-  card
    =+  flg=(need fug)
    =+  aer=?>(!=(%$ aru) aru)
    =+  wir=`path`/[aer]/(scot %p p.flg)/[q.flg]
    =+  pat=(snoc wir %updates)
    [%pass fren+wir %agent [p.flg %parrot] %watch pat]
  --
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
  (emit chat:look)
::  +load: handle on-load
::
++  load
  |=  vaz=vase
  ^+  dat
  ?>  ?=([%0 *] q.vaz)
  =.  state  !<(state-0 vaz)
  ?~  hav=(~(get by wex.bol) [/chat/ui our.bol %chat])
  (emit chat:look)  ?:(acked.u.hav dat (emit chat:look))
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
        %kick  dat
        %test  ~&  >>  chats:scry  dat
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
    %-  show(flok (~(put by flok) a [c ~]))
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
      ::  if it's a `[%& *]`, invite some birds.
      =+  inv=[a note.p.b now.bol]
      =+  cag=parrot-invite+!>(`invite:actions`[%sent host.fok inv])     ::  XX: Todo: handle /[area]/(scot %p p) for invite, bloks
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
          :+  %pass  /send/[a]/(scot %p p)
          [%agent [p %parrot] %poke cag]
      ?.  (~(has by sen) p)
        (~(put ju s) a p inv %transmit)                       ::  XX: Todo: handle [%received, %affirmed]
      %+  ~(put by s)  a
      (~(put by (~(del by sen) p)) p inv %transmit)
    ::  if its a `[%| @p]`, kick the bird
    ~_  'AVIARY: parrot error, invite some bird first.'
    =+  hav=(~(got by sent) a)
    ?>  (~(has by hav) p.b)
    =+  cag=parrot-invite+!>(`invite:actions`[%took host.fok ~])
    %-  emit(sent (~(put by sent) a (~(del by hav) p.b)))
    [%pass /[a]/(scot %p p.b) %agent [p.b %parrot] %poke cag]
  ::
  ++  drop
    |=  [a=area ~]
    =+  fok=(~(got by flok) a)
    ?:  =(our.bol src.bol)
      ~_  'AVIARY: parrot error, first join that flok.'
      ::  if we're poking ourselves, clean flok, forward
      =+  seen=`_dat`(show parrot-action+!>(`actions`[%drop a ~]))
      ^+  dat
      %-  dupe:seen(flok (~(del by flok) a))
      =-  [a - parrot-action+!>(`actions`[%drop a ~])]
      ?:  =(our.bol p.host.fok)  host.fok
      [our.bol (~(got by team.fok) our.bol)]
    ::
    ?.  =(p.host.fok src.bol)
      ::  if it's the host, clean flok
      %-  show(flok (~(del by flok) a))
      parrot-leaves+!>(`leaves:actions`[host.fok %& [%drop a ~]])
    ::
    ::  if it's a bird, clean team
    =+  dem=(~(got by team.fok) src.bol)
    %.  parrot-leaves+!>(`leaves:actions`[[src.bol dem] %| [%drop a ~]])
    %=    show
        flok
      %+  ~(put by flok)  a
      [host.fok (~(del in team.fok) src.bol dem)]
    ==
  ::
  ++  join
    |=  [h=flag j=(unit flag) a=(unit area)]
    ^+  dat
    ?~  j
      ::  if it's a decline then...
      =+  cag=parrot-action+!>(`actions`[%join h ~])
      =+  dot=(show cag)
      ?:  =(our.bol src.bol)
        ::  if we're the source, tell host, clean pend; or
        =+  hav=(~(got by pend) h)
        %-  emit:dot(pend (~(del by pend) h))
        [%pass /(scot %p p.h)/[q.h] %agent [p.h %parrot] %poke cag]        ::  XX: Todo: handle failures on /? kill the group? how do you know which?
      ::  if we're the host, clean sent.
      ?>  =(our.bol p.h)
      =/  aer=area
        %-  need
        ^-  (unit area)
        %-  ~(rep by flok)
        |=  [[a=area [ho=flag t=(set flag)]] o=(unit area)]
        ?:(=(h ho) o `a)
      =+  sen=(~(get ju sent) aer)
      =+  dem=(~(got by sen) src.bol)
      %.  parrot-denies+!>(`denies:actions`[src.bol aer now.bol])
      %=    show
          sent
        %.  [aer src.bol dem(sat [%rejected now.bol])]
        ~(put ju (~(del ju sent) aer src.bol dem))
      ==
    :: ::  if it's not declined, check source
    ?:  =(our.bol src.bol)
      ::  if we're the source, forward to the host; or
      =+  hav=(~(got by pend) h)
      =+  cag=parrot-action+!>(`actions`[%join h j])
      =+  dit=(show cag)
      %.  :-  [%pass / %agent [p.h %parrot] %poke cag]
          ::  also, watch the host
          `(list card)`[~(birds look area.hav `h) ~]
      %=  emil.dit
        pend  (~(del by pend) h)
        flok  (~(put by flok) area.hav [h (silt [(need j)]~)])
      ==
    ::  if it's foreign, check if we're the host
    =/  aer=area
      %-  need
      ^-  (unit area)
      %-  ~(rep by flok)
      |=([[a=area ho=flag t=*] o=(unit area)] ?:(=(h ho) `a o))
    =+  fok=(~(got by flok) aer)
    ?.  =(our.bol p.h)
      ::  if we're a bird, just put em in the team; or
      %.  parrot-action+!>(`actions`[%join h j])
      %=    show
          flok
        (~(put by flok) aer fok(team (~(put in team.fok) (need j))))
      ==
    ::  if we're the host, tell the birds.
    =+  sen=(~(get ju sent) aer)
    =+  dem=(~(got by sen) src.bol)
    =+  act=parrot-action+!>(`actions`[%join h j])
    ?>  =(src.bol -:(need j))
    =-  (dupe:- aer h act)
    %.  act
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
::  +dude: handle on-agent
::
++  dude
  |=  [pol=(pole knot) sig=sign:agent:gall]
  ?+    pol  ~|(aviary-panic-parrot-dude-wire/pol !!)
      [%chat %ui ~]
    ?+    -.sig  ~|(aviary-panic-parrot-dude/[pol sig] !!)
      %kick  (emit chat:look)
    ::
        %fact
      =^  cards  state
        ch-abet:(ch-dude:chor cage.sig)
      (emil cards)
    ::
        %watch-ack
      %.  dat
      ?~(p.sig same (slog 'parrot-fail-watch-chat' u.p.sig))
    ==
  ::
      [%send aer=@ who=@ ~]
    ::  this is an invite getting responded to
    =+  who=(slav %p who.pol)
    ?.  ?=(%poke-ack -.sig)
      ~|(aviary-panic-parrot-dude/[pol sig] !!)
    =+  sen=(~(get ju sent) aer.pol)
    =+  dem=(~(got by sen) who)
    =+  sat=?~(p.sig [%received now.bol] [%rejected now.bol])
    %.  parrot-status+!>(`status:actions`[aer.pol who sat])
    show(sent (~(put ju sent) aer.pol who dem(sat sat)))
  ::
      [%fren aer=@ who=@ wat=@ %updates ~]
    =+  who=(slav %p who.pol)
    ?+  -.sig  ~|(aviary-panic-parrot-dude/[pol sig] !!)
      %kick  (emit ~(birds look aer.pol ~ who wat.pol))
    ==
  ==
::  |chor: chat engine
::
++  chor
  |_  $:  =flag
          caz=(list card)
      ==
  +*  ch-core  .
  ++  ch-emit  |=(c=card ch-core(caz [c caz]))
  ++  ch-emil  |=(lc=(list card) ch-core(caz (welp lc caz)))
  ++  ch-abet  ^-((quip card _state) [(flop caz) state])
  ++  ch-dude
    |=  [mar=mark vaz=vase]
    ?+    mar  ~|(aviary-panic-parrot-chat-dude-mark/mar !!)
      %chat-action-0      ~&  >>>  [mar !<(action:cha vaz)]  ch-core
      %chat-action-1      ~&  >>>  [mar !<(action:cha vaz)]  ch-core
      %chat-brief-update  ~&  >>>  [mar !<(update:briefs:cha vaz)]  ch-core
      %chat-briefs        ~&  >>>  [mar !<(briefs:cha vaz)]  ch-core
      %chat-leave         ~&  >>>  [mar !<(flag:g:cha vaz)]  ch-core
    ==
  --
--