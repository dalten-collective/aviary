/-  osp=osprey, cha=chat, dia=diary, hyp=heap, gop=groups, spider
/+  *strandio
=,  strand=strand:spider
=<
  ::
  ^-  thread:spider
  |=  vaz=vase
  =/  m  (strand ,vase)
  ^-  form:m
  ::
  =/  arc=(unit archive:actions:osp)
    !<((unit archive:actions:osp) vaz)
  ;<  =bowl:rand  bind:m  get-bowl
  ?~  arc  (pure:m !>(~))
  =|  don=_1
  =/  out=[deck=(list (list card)) many=@ud]
    abet:start:(abed:ark bowl u.arc)
  |-  ?~  deck.out
    =-  (pure:m !>(`updates:actions:osp`-))
    [%archive u.arc many.out many.out]
  ;<  ~  bind:m  (send-raw-cards i.deck.out)
  =/  car=card
    :^  %pass  /  %agent
    :+  [our.bowl %osprey]  %poke
    :-  %osprey-updates
    !>(`updates:actions:osp`[%archive u.arc don many.out])
  ;<  ~  bind:m  (send-raw-card car)
  $(don +(don), deck.out t.deck.out)
::
|%
::
+$  card  card:agent:gall
+$  return
  $%  [%chat-log (pair log:cha flag:osp)]
      [%heap-log (pair log:hyp flag:osp)]
      [%diary-log (pair log:dia flag:osp)]
      [%club (pair (list writs:cha) @uv)]
      [%ship (pair (list writs:cha) ship)]
      [%groups (pair (set ship) flag:osp)]
  ==
::
++  ark
  |_  $:  bol=bowl:rand
          typ=archive:actions:osp
          lam=(list return)
          pag=@ud
      ==
  +*  ark  .
      doc  /(scot %p our.bol)/chat/(scot %da now.bol)
      dod  /(scot %p our.bol)/diary/(scot %da now.bol)
      dog  /(scot %p our.bol)/groups/(scot %da now.bol)
      doh  /(scot %p our.bol)/heap/(scot %da now.bol)
      mon  |=(d=mold ((on time d) lte))
  ++  abet  [(jammer (flop lam)) pag]
  ++  abed
    |=([b=bowl:rand t=archive:actions:osp] ark(bol b, typ t))
  ::
  ++  start
    ^+  ark
    ?-    -.typ
      %mine   mine
      %heap   heap
      %diary  diary
      %chat   chat
      %group  group
    ==
  ::
  ++  group
    =;  arc=_ark
      =+  lis=mk-list:groups:scry
      |-(?~(lis arc $(lis t.lis, arc start:arc(typ i.lis))))
    %=    ark
      pag  +(pag.ark)
    ::
        lam
      :_  lam.ark
      ?>  ?=([%group @ @] typ)
      [%groups ~(key by fleet:one:groups:scry) wat.typ]
    ==
  ::
  ++  diary
    ?>  ?=([%diary @ @] typ)
    =+  mod=(mon diff:dia)
    =+  one=one:diary:scry
    =+  bap=(bap:mod one)
    =+  hav=(add (div (lent bap) 500) ?:(=(0 (^mod (lent bap) 500)) 0 1))
    %=  ark
      pag  (add pag hav)
      lam  [diary-log+one^wat.typ lam]
    ==
  ::
  ++  heap
    ?>  ?=([%heap @ @] typ)
    =+  moh=(mon diff:hyp)
    =+  one=one:heap:scry
    =+  bap=(bap:moh one)
    =+  hav=(add (div (lent bap) 500) ?:(=(0 (mod (lent bap) 500)) 0 1))
    %=  ark
      pag  (add pag hav)
      lam  [heap-log+one^wat.typ lam]
    ==
  ::
  ++  mine
    =+  arc=ark
    ?>  ?=([%mine ~] typ)
    =/  heaps=(list archive:actions:osp)
      %+  murn  ~(tap in key:heap:scry)
      |=([p=@p q=@tas] ?.(=(our.bol p) ~ `heap+p^q))
    =/  diaries
      %+  murn  ~(tap in key:diary:scry)
      |=([p=@p q=@tas] ?.(=(our.bol p) ~ `diary+p^q))
    =/  chats=(list archive:actions:osp)
      %+  murn  ~(tap in key:chat:scry)
      |=([p=@p q=@tas] ?.(=(our.bol p) ~ `chat+flag+p^q))
    =/  mines=(list archive:actions:osp)
      :(welp heaps diaries chats)
    |-(?~(mines arc $(mines t.mines, arc start:arc(typ i.mines))))
  ::
  ++  chat
    ?>  ?=([%chat @ *] typ)
    ?-  +<.typ
        %ship
      =+  one=one:ship:scry
      %=  ark
        pag  (add pag (lent one))
        lam  [ship+one^p.wat.typ lam]
      ==
    ::
        %club
      =+  one=one:club:scry
      %=  ark
        pag  (add pag (lent one))
        lam  [club+one^p.wat.typ lam]
      ==
    ::
        %flag
      =+  moc=(mon diff:cha)
      =+  one=one:chat:scry
      =+  bap=(bap:moc one)
      =+  hav=(add (div (lent bap) 500) ?:(=(0 (mod (lent bap) 500)) 0 1))
      %=  ark
        pag  (add pag hav)
        lam  [chat-log+one^p.wat.typ lam]
      ==
    ==
  ::
  ++  scry
    |%
    ++  chat
      |%
      ++  all
        ^-  (map flag:osp chat:cha)
        .^((map flag:osp chat:cha) %gx (welp doc /chats/noun))
      ++  key
        ^-  (set flag:osp)
        .^((set flag:osp) %gx (welp doc /chat/noun))
      ++  one
        ^-  log:cha
        ?>  ?=([%chat %flag *] typ)
        log:(~(got by all) p.wat.typ)
      --
    ++  ship
      |%
      ++  key
        ^-  (set ^ship)
        .^((set ^ship) %gx (welp doc /dm/noun))
      ++  one
        ::  note that we'll need to fake add feels for clubs and dms
        ^-  (list writs:cha)
        ?>  ?=([%chat %ship @] typ)
        =|  l=(list writs:cha)
        =|  d=@da
        |-
        =;  cur=writs:cha
          ?:  =(~ cur)  l
          =+  nex=(head (sort ~(tap in ~(key by cur)) gth))
          $(d +(nex), l [cur l])
        .^  writs:cha
          %gx
          %+  welp  doc
          /dm/(scot %p p.wat.typ)/writs/newer/(scot %ud d)/500/noun
        ==
      --
    ++  club
      |%
      ++  one
        ^-  (list writs:cha)
        ?>  ?=([%chat %club @] typ)
        =|  l=(list writs:cha)
        =|  d=@da
        |-
        =;  cur=writs:cha
          ?:  =(~ cur)  l
          =+  nex=(head (sort ~(tap in ~(key by cur)) gth))
          $(d +(nex), l [cur l])
        .^  writs:cha
          %gx
          %+  welp  doc
          /club/(scot %uv p.wat.typ)/writs/newer/(scot %ud d)/500/noun
        ==
      --
    ++  diary
      |%
      ++  all
        ^-  (map flag:osp diary:dia)
        .^(shelf:dia %gx (welp dod /shelf/noun))
      ++  key
        ^-  (set flag:osp)
        ~(key by all)
      ++  one
        ^-  log:dia
        ?>  ?=([%diary @ @] typ)
        log:(~(got by all) wat.typ)
      --
    ++  heap
      |%
      ++  all
        ^-  (map flag:osp heap:hyp)
        .^(stash:hyp %gx (welp doh /stash/noun))
      ++  key
        ^-  (set flag:osp)
        ~(key by all)
      ++  one
        ^-  log:hyp
        ?>  ?=([%heap @ @] typ)
        log:(~(got by all) wat.typ)
      --
    ++  groups
      |%
      ++  all
        ^-  (map flag:osp group:gop)
        .^(groups:gop %gx (welp dog /groups/noun))
      ++  key
        ^-  (set flag:osp)
        ~(key by all)
      ++  one
        ^-  group:gop
        ?>  ?=([%group @ @] typ)
        (~(got by all) wat.typ)
      ++  mk-list
        ^-  (list archive:actions:osp)
        %+  murn  ~(tap in ~(key by channels:one))
        |=  [d=dude:gall f=flag:osp]
        ?+  d  ~
          %heap   `heap+f
          %diary  `diary+f
          %chat   `chat+flag+f
        ==
      --
    --
  ::
  ++  jammer
    |=  out=(list return)
    =+  pat=`path`/osprey
    =|  biz=(list (list card))
    |^  ^-  _biz
    |-  ?~  out  biz
    ?-    -.i.out
      %club  $(out t.out, biz [(club-jam +.i.out) biz])
      %ship  $(out t.out, biz [(ship-jam +.i.out) biz])
    ::
        %heap-log
      $(out t.out, biz [(heap-jam +.i.out) biz])
    ::
        %diary-log
      $(out t.out, biz [(diar-jam +.i.out) biz])
    ::
        %chat-log
      $(out t.out, biz [(chat-jam +.i.out) biz])
    ::
        %groups
      =.  pat
        (grop-jam pat q.i.out)
      $(out t.out, biz [(ross-jam p.i.out) biz])
    ==
    ++  grop-jam  |=([p=path f=flag:osp] (weld p /groups/[q.f]))
    ++  club-jam
      |=  [liw=(list writs:cha) who=@uv]
      =+  fol=(scot %uv who)
      =|  caz=(list card)
      =|  cou=_1
      =+  moc=(mon writ:cha)
      |-  ?~  liw  caz 
      =/  fil=@tas
        (rap 3 'club_' fol '_' (scot %ud cou) ~)
      %=  $
        liw  t.liw
        cou  +(cou)
      ::
          caz
        :_  caz
        =-  [%pass /club %agent [our.bol %hood] %poke -]
        :-  %dill-blit
        !>  ^-  dill-blit:dill
        :+  %sag
          %+  welp  pat
          /club/[fol]/[fil]/jam
        %-  jam
        %-  turn  :_  writ-to-log
        ;;((list [time writ:cha]) (tap:moc i.liw))
      ==
    ++  ship-jam
      |=  [liw=(list writs:cha) who=ship]
      =+  fol=(scot %p who)
      =|  caz=(list card)
      =|  cou=_1
      =+  moc=(mon writ:cha)
      |-  ?~  liw  caz
      =/  fil=@tas
        (rap 3 'dm_' fol '_' (scot %ud cou) ~)
      %=  $
        liw  t.liw
        cou  +(cou)
      ::
          caz
        :_  caz
        =-  [%pass /club %agent [our.bol %hood] %poke -]
        :-  %dill-blit
        !>  ^-  dill-blit:dill
        :+  %sag
          %+  welp  pat
          /dm/[fol]/[fil]/jam
        %-  jam
        %-  turn  :_  writ-to-log
        ;;((list [time writ:cha]) (tap:moc i.liw))
      ==
    ++  chat-jam
      |=  [log=log:cha who=flag:osp]
      =+  fol=(rap 3 (scot %p p.who) '-' q.who ~)
      =|  caz=(list card)
      =|  cou=_1
      =+  moc=(mon diff:cha)
      =+  lis=;;((list [@da diff:cha]) (tail (tap:moc log)))
      |-  ?~  lis  caz
      =+  fil=(rap 3 'chat_' fol '_' (scot %ud cou) ~)
      %=  $
        lis  (slag 500 `(list [@da diff:cha])`lis)
        cou  +(cou)
      ::
          caz
        :_  caz
        =-  [%pass /chat %agent [our.bol %hood] %poke -]
        :-  %dill-blit
        !>  ^-  dill-blit:dill
        :+  %sag
          (welp pat /chats/[fol]/[fil]/jam)
        (scag 500 `(list [@da diff:cha])`lis)
      ==
    ++  diar-jam
      |=  [log=log:dia who=flag:osp]
      =+  fol=(rap 3 (scot %p p.who) '-' q.who ~)
      =|  caz=(list card)
      =|  cou=_1
      =+  moc=(mon diff:dia)
      =+  lis=;;((list [@da diff:dia]) (tail (tap:moc log)))
      |-  ?~  lis  caz
      =+  fil=(rap 3 'diary_' fol '_' (scot %ud cou) ~)
      %=  $
        lis  (slag 500 `(list [@da diff:dia])`lis)
        cou  +(cou)
      ::
          caz
        :_  caz
        =-  [%pass /diary %agent [our.bol %hood] %poke -]
        :-  %dill-blit
        !>  ^-  dill-blit:dill
        :+  %sag
          (welp pat /diaries/[fol]/[fil]/jam)
        (scag 500 `(list [@da diff:dia])`lis)
      ==
    ++  heap-jam
      |=  [log=log:hyp who=flag:osp]
      =+  fol=(rap 3 (scot %p p.who) '-' q.who ~)
      =|  caz=(list card)
      =|  cou=_1
      =+  moc=(mon diff:hyp)
      =+  lis=;;((list [@da diff:hyp]) (tail (tap:moc log)))
      |-  ?~  lis  caz
      =+  fil=(rap 3 'heap_' fol '_' (scot %ud cou) ~)
      %=  $
        lis  (slag 500 `(list [@da diff:hyp])`lis)
        cou  +(cou)
      ::
          caz
        :_  caz
        =-  [%pass /heap %agent [our.bol %hood] %poke -]
        :-  %dill-blit
        !>  ^-  dill-blit:dill
        :+  %sag
          (welp pat /heaps/[fol]/[fil]/jam)
        (scag 500 `(list [@da diff:hyp])`lis)
      ==
    ++  ross-jam
      |=  s=(set ship)
      ^-  (list card)
      =-  [%pass /ross %agent [our.bol %hood] %poke -]~
      ^-  cage
      :-  %dill-blit
      !>  ^-  dill-blit:dill
      :+  %sav
        (welp pat /roster/txt)
      %-  of-wain:format
      %+  turn  ~(tap in s)
      |=(p=@p `@`(cat 3 (scot %p p) '\0a'))
    ++  writ-to-log
      |=  [d=@da w=writ:cha]
      ^-  (list [time diff:cha])
      =+  add=`diff:cha`[%writs id.w [%add +.w]]
      ?:  =(~ feels.w)
        [d add]~
      %+  welp  [d add]~
      ^-  (list [time diff:cha])
      =|  lef=(list [time diff:cha])
      =|  fel=_1
      =+  feels=~(tap by feels.w)
      |-  ?~  feels  lef
      %=  $
        feels  t.feels
        fel    +(fel)
      ::
          lef
        :_  lef
        :+  (^add d fel)  %writs
        [[p.i.feels (^add d fel)] %add-feel i.feels]
      ==
    --
  --
--