/-  cha=chat, dia=diary, hyp=heap
/+  m=multipart, *mip
|%
+$  flag      (pair ship term)
+$  frag      ?(flag @uv ship)
+$  nade      $@(%calculating (list ship))
+$  schedule  (map archive:actions $:(prior=@da every=@dr))
+$  mailslot
  %^  mip  @p
    flag
  %-  unit
  $:  member=(list @p)
      admins=(list @p)
      config=(list email)
  ==
+$  on-trial
  %+  map
    @uv
  $:  =flag
      pending=_|
      data=$%([%doom lim=@ud age=@dr] [%boot ran=rank:title])
      ships=nade
  ==
::
+$  email
  $%  [%chat-log (pair flag log:cha)]
      [%heap-log (pair flag log:hyp)]
      [%note-log (pair flag log:dia)]
  ==
::
++  actions
  =<  actions
  |%
  +$  actions  $%(archive command repeats virtual)
  ::
  +$  virtual
    $%  [%mail who=@p wat=flag]
        [%open who=@p wat=flag]
        [%kill who=@p wat=flag]
      ::
        $:  %take
            wat=flag
            mem=(list @p)
            adm=(list @p)
            wic=(list email)
        ==
      ::
        $:  %read
            who=@p
            wat=flag
            wer=@tas
            wit=[mem=? adm=?]
            wic=(list [hed=?(%chat %heap %note) wat=flag wer=@tas])
        ==
    ==
  ::
  +$  repeats
    [%repeat arc=archive oft=(unit @dr)]
  ::
  +$  archive
    $%  [%mine ~]                                       ::  archive your flags
        [%heap wat=flag]                                ::  archive a heap
        [%diary wat=flag]                               ::  archive a diary
        [%chat wat=whom:cha]                            ::  archive a chat/dm/club
        [%group wat=flag]                               ::  archive a group
    ==
  ::
  +$  command
    $%  [%doom limit=@ud age=@dr group=flag]            ::  kick people we haven't seen in a while
        [%boot =rank:title group=flag]                  ::  boot everyone of a specific rank
        [%exec id=@uv]                                  ::  execute order 66
        [%stop id=@uv]                                  ::  ignores order 66
    ==
  ::
  +$  updates
    $%  [%bootbot id=@uv]                               ::  thread reports (bootbot) initialize
        [%doombot id=@uv]                               ::  thread reports (doombot) initialize
        [%kick-em id=@uv sip=(set ship)]                ::  thread reports (boot/doom) who will be kicked
        [%destroy id=@uv]                               ::  thread reports (boot/doom) omg u killed them!
        [%ignored id=@uv]                               ::  thread reports (boot/doom) apathy. yuge cope!
        [%archive ark=archive don=@ud tot=@ud]          ::  thread reports (archive)
      ::
        $:  %sending                                    ::  thread reports (virtual-out)
            gro=flag
            mem=(list @p)
            adm=(list @p)
            con=(list email)
        ==
      ::
        $:  %refresh                                    ::  thread reports (virtual-in)
            new=flag
            and=(list flag)
            wit=[mem=? adm=?]
        ==
      ::
        $:  %restore                                    ::  thread reports (restore)
            typ=?(%dm %club %chat %heap %diary)
            gro=(each term flag)
            ole=frag
            new=frag
            don=_|
        ==
    ==
  --
--