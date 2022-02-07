<^>!{::SendInput, {{}{}}{Left}
+(::SendInput, {(}{)}{Left}
+¿::SendInput, {¿}{?}{Left}
<^>![::SendInput, {[}{]}{Left}
+2::SendInput, {"}{"}{Left}

^!s::Suspend 

^r:: ; press control+r to reload
  Msgbox, Do you really want to reload this script?
  ifMsgBox, Yes
    Reload
  return
