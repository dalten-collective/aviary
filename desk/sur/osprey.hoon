/-  cha=chat, dia=diary, hyp=heap
/+  m=multipart
|%
+$  flag      (pair ship term)
+$  frag      ?(flag @uv ship)
+$  schedule  (map archive:actions $:(prior=@da every=@dr))
::
++  actions
  =<  actions
  |%
  +$  actions  $%(archive repeats command)
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
    ==
  ::
  +$  updates
    $%  [%bootbot =rank:title gop=flag]                 ::  thread reports (bootbot)
        [%doombot sip=(set ship) gop=flag]              ::  thread reports (doombot)
        [%archive ark=archive don=@ud tot=@ud]          ::  thread reports (archive)
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