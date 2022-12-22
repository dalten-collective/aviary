|%
::
+$  area  term
+$  flag  (pair ship term)
::
+$  blok  (set flag)                                    :: prevent invites
+$  pend  (map flag invite)                             :: a map of invite (invites from some hosts)
+$  sent  (jug area [who=@p inv=invite sat=status])                 :: a jug of offers (offers is a map)
+$  flok  (map area [host=flag team=(set flag)])        :: a map of flocks 
::
:: +$  squawks
::   $%  
:: ::
::
+$  status
  $@   ?(%transmit %deleted)
  $%  [%received @da]
      [%rejected @da]
      [%affirmed @da]
  ==
::
+$  invite
  $:  area=term
      note=cord
      when=@da
  ==
::
++  actions
  =<  actions
  |%
  +$  drop  [%drop =area ~]
  ::
  +$  send
    [%send =area buds=(each [note=@t them=(set @p)] @p)]
  ::
  +$  leaves
    [wat=flag host=? drop]
  ::
  +$  denies
    [who=@p =area wen=@da]
  ::
  +$  invite
    $%  [%sent host=flag inv=^invite]
        [%took host=flag ~]
    ==
  ::
  +$  status
    [=area who=@p sat=^status]
  ::
  +$  actions
    $%  [%kick ~]
        [%test ~]
      ::
        [%blok =flag]
        [%free =flag]
        [%join host=flag join=(unit flag)]
      ::
        drop
        send
        [%form =area chat=flag]
    ==
  --
--