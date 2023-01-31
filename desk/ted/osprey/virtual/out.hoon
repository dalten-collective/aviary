/-  osp=osprey, cha=chat, dia=diary, hyp=heap, gop=groups, spider
/+  *strandio
=,  strand=strand:spider
=<
  ::
  ^-  thread:spider
  |=  vaz=vase
  =/  m  (strand ,vase)
  ^-  form:m
  =/  fug=(unit [@p flag:osp])
    !<((unit [@p flag:osp]) vaz)
  ;<  =bowl:rand  bind:m  get-bowl
  ?~  fug  (pure:m !>(~))
  =;  out=[flag:osp (list @p) (list @p) (list email:osp)]
    =+  cag=osprey-actions+!>(`actions:osp`take+out)
    ;<  ~  bind:m  (poke [-.u.fug %osprey] -)
    (pure:m !>(`updates:actions:osp`sending+out))
  abet:mk-mail:groups:scry:(abed:sen bowl u.fug)
|%
+$  card  card:agent:gall
++  sen
  |_  $:  bol=bowl:rand
          who=@p
          wat=flag:osp
          lam=(list email:osp)
          mem=(list @p)
          adm=(list @p)
      ==
  +*  sen  .
      mon  |=(d=mold ((on time d) lte))
      doc  /(scot %p our.bol)/chat/(scot %da now.bol)
      doh  /(scot %p our.bol)/heap/(scot %da now.bol)
      dod  /(scot %p our.bol)/diary/(scot %da now.bol)
      dog  /(scot %p our.bol)/groups/(scot %da now.bol)
  ++  abet
    ^-  [flag:osp (list @p) (list @p) (list email:osp)]
    [wat mem adm lam]
  ++  abed
    |=  [b=bowl:rand hu=@p wa=flag:osp]
    ^+(sen sen(bol b, who hu, wat wa))
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
        |=  f=flag:osp
        ^-  email:osp
        ?>  (~(has in key) f)
        [%chat-log f log:(~(got by all) f)]
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
        |=  f=flag:osp
        ^-  email:osp
        ?>  (~(has in key) f)
        [%note-log f log:(~(got by all) f)]
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
        |=  f=flag:osp
        ^-  email:osp
        ?>  (~(has in key) f)
        [%heap-log f log:(~(got by all) f)]
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
        (~(got by all) wat)
      ++  mk-mail
        ^+  sen
        %=    sen
          mem  ~(tap in ~(key by fleet:one))
        ::
            adm
          ^-  (list @p)
          %+  murn  ~(tap by fleet:one)
          |=  [k=@p v=vessel:fleet:gop]
          ?.((~(has in sects:v) %admin) ~ `k)
        ::
            lam
          ^-  (list email:osp)
          %+  murn  ~(tap in ~(key by channels:one))
          |=  [d=dude:gall f=flag:osp]
          ?+  d  ~
            %chat   `(one:chat f)
            %heap   `(one:heap f)
            %diary  `(one:diary f)
          ==
        ==
      --
    --
  --
--