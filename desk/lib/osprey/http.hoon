/-  *osprey, cha=chat, dia=diary, hyp=heap
/+  verb, dbug, default-agent, m=multipart, s=server
|%
+$  card  card:agent:gall
++  handle-http-request
  |_  $:  bol=bowl:gall
          eid=@ta
          caz=(list card)
          inb=inbound-request:eyre
          pay=(unit simple-payload:http)
          gro=(set flag)
          any=(set flag)
      ==
  +*  hp  .
  ++  hp-emit  |=(c=card hp(caz [c caz]))
  ++  hp-emil  |=(lac=(list card) hp(caz (welp lac caz)))
  ++  hp-eror
    |=  msg=@t
    hp(pay `[400+~ `(hp-page ~[(cat 3 'MISSING DATA - ' msg)])])
  ++  hp-abet
    :_  eid
    %-  welp  :_  (flop caz)
    (give-simple-payload:app:s eid (need pay))
  ++  hp-abed
    |=  $:  bo=bowl:gall
            id=@ta
            ib=inbound-request:eyre
            go=(set flag)
            ay=(set flag)
        ==
    hp(bol bo, eid id, inb ib, gro go, any ay)
  ++  hp-parz
    |%
    ++  ship   ;~(pfix sig fed:ag)                      ::  a ship
    ++  flag   ;~((glue hep) ship sym)                  ::  a flag
    ++  uvee   ;~(pfix (jest '0v') viz:ag)              ::  give @uv
    ++  merm   ;~(pose ;~(pfix cen sym) sym)            ::  maybe term
    ++  dm     ;~((glue cab) (jest 'dm') ship dem)      ::  dm files
    ++  club   ;~((glue cab) (jest 'club') uvee dem)    ::  club files
    ++  chat   ;~((glue cab) (jest 'chat') flag dem)    ::  chat files
    ++  heap   ;~((glue cab) (jest 'heap') flag dem)    ::  heap files
    ++  diary  ;~((glue cab) (jest 'diary') flag dem)   ::  diary files
    ++  foldr                                           ::  dissect folder
      ;~  (glue fas)
        flag
        ;~  sfix
          ;~(pose dm club chat heap diary)
          (jest '.jam')
        ==
      ==
    --
  ++  hp-hndl
    ^+  hp
    =*  headers  header-list.request.inb
    =/  reqline  (parse-request-line:s url.request.inb)
    ?+    method.request.inb  hp(pay `[405^~ ~])
      %'GET'   hp(pay `[[200^~ `(hp-page ~)]])
      %'POST'  hp-take
    ==
  ++  hp-take
    ^+  hp
    ?~  parts=(de-request:m [header-list body]:request:inb)
      (hp-eror 'POSSIBLE FORM ERROR')
    =+  mat=(malt u.parts)
    ?~  ful=(~(get by mat) 'files')
      (hp-eror 'NO FILES FOUND')
    =/  [fol=frag [typ=?(%dm %club %chat %heap %diary) fil=frag pag=@ud]]
      ;;  [frag [?(%dm %club %chat %heap %diary) frag @ud]]
      (rash (need file:(need ful)) foldr:hp-parz)
    ?.  =(fol fil)
      (hp-eror 'FILE/FOLDER MISMATCH')
    ?~  hav=(~(get by mat) 'type')
      (hp-eror 'POSSIBLE FORM ERROR')
    ?~  neu=(~(get by mat) 'channel')
      (hp-eror 'MISSING NEW CHANNEL NAME')
    ::
    =+  new=`@tas`?>(((sane %tas) body.u.neu) body.u.neu)
    ?:  (~(has in any) [our.bol new])
      (hp-eror 'NEW NAME ALREADY IN USE')
    =/  jams=(list jam)
      %+  murn  u.parts
      |=([k=@t p=part:m] ?.(=('files' k) ~ ``jam`body.p))
    ?+    body.u.hav  (hp-eror 'POSSIBLE FORM ERROR')
        %old-group
      ?~  gru=(~(get by mat) 'group')
        (hp-eror 'MISSING EXISTING GROUP SELECTION')
      ?~  gro=(rush body:(~(got by mat) 'group') flag:hp-parz)
        (hp-eror 'INVALID EXISTING GROUP SELECTION')
      (hp-coax typ |/(need gro) fol new jams)
        %new-group
      ?~  gru=(~(get by mat) 'group')
        (hp-eror 'MISSING NEW GROUP NAME')
      ?.  ?|  ((sane %tas) body.u.gru)
              (~(has in gro) [our.bol body.u.gru])
          ==
        (hp-eror 'INVALID NEW GROUP NAME')
      (hp-coax typ &/body.u.gru fol new jams)
    ==
  ++  hp-coax
    |=  $:  type=?(%dm %club %chat %heap %diary)
            grop=(each term flag)
            olde=frag
            chan=term
            jams=(list jam)
        ==
    =/  msg=(list @t)
      ?.  =(?(%dm %club) type)  ~['REQUEST SUBMITTED']
      ~['REQUEST SUBMITTED' 'OVERRIDING NAME FOR DM/CLUB']
    %-  hp-emit(pay `[200+~ `(hp-page msg)])
    =+  pat=/restore/(scot %ud (jam type grop olde chan (lent jams)))
    =-  [%pass pat %arvo %k %fard -]
    :+  %aviary  %osprey-restore
    :-  %noun
    !>  ^-  (unit [_type _grop _olde _chan _jams])
    `[type grop olde chan jams]
  ++  hp-page
    |=  errs=(list @t)
    |^  ^-  octs
      %-  as-octt:mimes:html
      %-  en-xml:html
      ^-  manx
      ;html
        ;head
          ;title:"%osprey-import"
          ;meta(charset "utf-8");
          ;style:'* { font-family: monospace; margin-top: 1em; }'
        ==
      ::
        ;body
          ;h2:"%osprey importer"
        ::
          ;+  ?:  =(~ errs)  :/""
              :-  [%p ~]
              (join `manx`;br; (turn errs |=(m=@t `manx`:/"{(trip m)}")))
        ::
          ;ol
            ;li:"""
                %osprey can import to existing groups, or a new group.
                Select from the forms below, based on your needs.
                """
            ;li:"""
                Use the import function to select a folder containing a backup.
                Only attempt to import one channel type at a time.
                """
            ;li:"Input a name for the new channel"
            ;li:"Import!"
          ==
        ::
          ;table
            ;tr
              ;td
                ;h3:"Add to an Existing Group"
              ==
            ::
              ;td
                ;h3:"Add to New Group"
              ==
            ==
          ::
            ;tr
              ;td
                ;form(method "post", enctype "multipart/form-data")
                  ;input
                    =name   "type"
                    =value  "old-group"
                    =style  "display: none";
                ::
                  ;label
                    ;+  :/"Import Folder: "
                    ;input
                      =type             "file"
                      =name             "files"
                      =required         ""
                      =directory        ""
                      =mozdirectory     ""
                      =webkitdirectory  "";
                  ==
                ::
                  ;br;
                ::
                  ;label
                    ;+  :/"Existing Group: "
                    ;select
                      =name      "group"
                      =required  ""
                      ;option(value "", hidden ""):"Select a Group"
                      ;*  ?.  =(~ gro)  groups
                          ;=  ;option(value "", hidden ""):"Empty"
                          ==
                    ==
                  ==
                ::
                  ;br;
                ::
                  ;label
                    ;+  :/"New Channel Name: "
                    ;input
                      =name      "channel"
                      =type      "text"
                      =required  "";
                  ==
                ::
                  ;br;
                ::
                  ;button(type "submit"):"Begin Import"
                ==
              ==
            ::
              ;td
                ;form(method "post", enctype "multipart/form-data")
                  ;input
                    =name   "type"
                    =value  "new-group"
                    =style  "display: none";
                ::
                  ;label
                    ;+  :/"Import Folder: "
                    ;input
                      =type             "file"
                      =name             "files"
                      =required         ""
                      =directory        ""
                      =mozdirectory     ""
                      =webkitdirectory  "";
                  ==
                ::
                  ;br;
                ::
                  ;label
                    ;+  :/"New Group Name: "
                    ;input
                      =name      "group"
                      =type      "text"
                      =required  "";
                  ==
                ::
                  ;br;
                ::
                  ;label
                    ;+  :/"New Channel Name: "
                    ;input
                      =name      "channel"
                      =type      "text"
                      =required  "";
                  ==
                ::
                  ;br;
                ::
                  ;button(type "submit"):"Begin Import"
                ==
              ==
            ==
          ==   
        ==
      ==
    ++  groups
      ^-  marl
      %-  ~(rep in gro)
      |=  [f=flag q=marl]
      ^-  marl
      :_  q  ^-  manx
      ;option
        =name  "group"
        =value  "{(scow %p p.f)}-{(scow %tas q.f)}"
        ;+  :/"{(scow %p p.f)} %{(scow %tas q.f)}"
      ==
    --
  --
--