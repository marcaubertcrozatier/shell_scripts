87c87
< + rl_ls='-rwxr-xr-x 1 nsuser swf 29021779 Jan 20 17:56 /home/nsuser/shell/old-cbs-css-rte-linux.bin'
---
> + rl_ls='-rwxr-xr-x 1 nsuser swf 29021779 Jan 20 17:39 /home/nsuser/shell/old-cbs-css-rte-linux.bin'
94,95c94,95
< + rl_ls='-rwxr-xr-x 1 nsuser swf 29021779 Jan 20 17:56 /home/nsuser/shell/old-cbs-css-rte-linux.bin'
< + set x -rwxr-xr-x 1 nsuser swf 29021779 Jan 20 17:56 /home/nsuser/shell/old-cbs-css-rte-linux.bin
---
> + rl_ls='-rwxr-xr-x 1 nsuser swf 29021779 Jan 20 17:39 /home/nsuser/shell/old-cbs-css-rte-linux.bin'
> + set x -rwxr-xr-x 1 nsuser swf 29021779 Jan 20 17:39 /home/nsuser/shell/old-cbs-css-rte-linux.bin
115,123c115,123
< + ZIPLOC=/tmp/install.dir.27578
< + INSTALLER_DATA_DIR=/tmp/install.dir.27578/InstallerData
< + INSTALL_ZIP=/tmp/install.dir.27578/InstallerData/installer.zip
< + INSTALL_PADDED_ZIP=/tmp/install.dir.27578/InstallerData/installer.padded
< + DISK1_DIR=/tmp/install.dir.27578/InstallerData/Disk1
< + INSTDATA_DIR=/tmp/install.dir.27578/InstallerData/Disk1/InstData
< + RESOURCE_ZIP=/tmp/install.dir.27578/InstallerData/Disk1/InstData/Resource1.zip
< + ENV_PROPERTIES=/tmp/install.dir.27578/env.properties
< + TMP_LAX=/tmp/install.dir.27578/temp.lax
---
> + ZIPLOC=/tmp/install.dir.25280
> + INSTALLER_DATA_DIR=/tmp/install.dir.25280/InstallerData
> + INSTALL_ZIP=/tmp/install.dir.25280/InstallerData/installer.zip
> + INSTALL_PADDED_ZIP=/tmp/install.dir.25280/InstallerData/installer.padded
> + DISK1_DIR=/tmp/install.dir.25280/InstallerData/Disk1
> + INSTDATA_DIR=/tmp/install.dir.25280/InstallerData/Disk1/InstData
> + RESOURCE_ZIP=/tmp/install.dir.25280/InstallerData/Disk1/InstData/Resource1.zip
> + ENV_PROPERTIES=/tmp/install.dir.25280/env.properties
> + TMP_LAX=/tmp/install.dir.25280/temp.lax
125c125
< + mkdir /tmp/install.dir.27578
---
> + mkdir /tmp/install.dir.25280
128c128
< + mkdir /tmp/install.dir.27578/InstallerData
---
> + mkdir /tmp/install.dir.25280/InstallerData
141,142c141,142
< + AVAIL_SPACE=124006144
< + isValidNumber 124006144
---
> + AVAIL_SPACE=120779496
> + isValidNumber 120779496
149c149
< 	     }' 124006144
---
> 	     }' 120779496
155,156c155,156
< + '[' '!' '(' -z 124006144 -o -z 10419 ')' ']'
< + '[' 124006144 -lt 10419 ']'
---
> + '[' '!' '(' -z 120779496 -o -z 10419 ')' ']'
> + '[' 120779496 -lt 10419 ']'
171c171
< + dd if=old-cbs-css-rte-linux.bin of=/tmp/install.dir.27578/InstallerData/installer.padded bs=32768 skip=3 count=155
---
> + dd if=old-cbs-css-rte-linux.bin of=/tmp/install.dir.25280/InstallerData/installer.padded bs=32768 skip=3 count=155
173c173
< + dd if=/tmp/install.dir.27578/InstallerData/installer.padded of=/tmp/install.dir.27578/InstallerData/installer.zip bs=5072515 count=1
---
> + dd if=/tmp/install.dir.25280/InstallerData/installer.padded of=/tmp/install.dir.25280/InstallerData/installer.zip bs=5072515 count=1
175,176c175,176
< + rm -f /tmp/install.dir.27578/InstallerData/installer.padded
< ++ cksum /tmp/install.dir.27578/InstallerData/installer.zip
---
> + rm -f /tmp/install.dir.25280/InstallerData/installer.padded
> ++ cksum /tmp/install.dir.25280/InstallerData/installer.zip
182c182
< + mkdir /tmp/install.dir.27578/InstallerData/Disk1
---
> + mkdir /tmp/install.dir.25280/InstallerData/Disk1
184c184
< + mkdir /tmp/install.dir.27578/InstallerData/Disk1/InstData
---
> + mkdir /tmp/install.dir.25280/InstallerData/Disk1/InstData
189c189
< + dd if=old-cbs-css-rte-linux.bin of=/tmp/install.dir.27578/InstallerData/Disk1/InstData/Resource1.zip bs=32768 skip=158 count=728
---
> + dd if=old-cbs-css-rte-linux.bin of=/tmp/install.dir.25280/InstallerData/Disk1/InstData/Resource1.zip bs=32768 skip=158 count=728
191c191
< ++ cksum /tmp/install.dir.27578/InstallerData/Disk1/InstData/Resource1.zip
---
> ++ cksum /tmp/install.dir.25280/InstallerData/Disk1/InstData/Resource1.zip
198,199c198,199
< + TMP_LAX=/tmp/install.dir.27578/temp.lax
< + echo lax.user.dir=/tmp/install.dir.27578
---
> + TMP_LAX=/tmp/install.dir.25280/temp.lax
> + echo lax.user.dir=/tmp/install.dir.25280
201c201
< + echo lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip
---
> + echo lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip
220c220
< + templaxpath=/tmp/install.dir.27578/temp.lax
---
> + templaxpath=/tmp/install.dir.25280/temp.lax
222c222
< + seLaxPath=/tmp/install.dir.27578/temp.lax
---
> + seLaxPath=/tmp/install.dir.25280/temp.lax
258d257
< ++ tr '[:upper:]' '[:lower:]'
259a259
> ++ tr '[:upper:]' '[:lower:]'
282c282
< + envPropertiesFile=/tmp/env.properties.27578
---
> + envPropertiesFile=/tmp/env.properties.25280
316c316
< + rl_ls='-rwxr-xr-x 1 nsuser swf 29021779 Jan 20 17:56 /home/nsuser/shell/old-cbs-css-rte-linux.bin'
---
> + rl_ls='-rwxr-xr-x 1 nsuser swf 29021779 Jan 20 17:39 /home/nsuser/shell/old-cbs-css-rte-linux.bin'
324,326c324,326
< + '[' '!' -z /tmp/install.dir.27578/temp.lax ']'
< + propfname=/tmp/install.dir.27578/temp.lax
< + '[' '!' -r /tmp/install.dir.27578/temp.lax ']'
---
> + '[' '!' -z /tmp/install.dir.25280/temp.lax ']'
> + propfname=/tmp/install.dir.25280/temp.lax
> + '[' '!' -r /tmp/install.dir.25280/temp.lax ']'
332c332
< ++ cat /tmp/install.dir.27578/temp.lax
---
> ++ cat /tmp/install.dir.25280/temp.lax
335c335
< + set x lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=The installer either could not find a Java VM, or the Java VM on this system is too old. The installer requires Java 1.1.5 or later. It can be downloaded from http://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main 'lax.command.line.args=$CMD_LINE_ARGUMENTS$' lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional= lax.installer.unix.internal.property.0= lax.installer.unix.ui.default=GUI
---
> + set x lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=The installer either could not find a Java VM, or the Java VM on this system is too old. The installer requires Java 1.1.5 or later. It can be downloaded from http://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main 'lax.command.line.args=$CMD_LINE_ARGUMENTS$' lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional= lax.installer.unix.internal.property.0= lax.installer.unix.ui.default=GUI
342c342
< + INPUT=' lax.user.dir=/tmp/install.dir.27578'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280'
349c349
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux'
356c356
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip'
363c363
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main'
370c370
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main'
377c377
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=The'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=The'
384c384
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=Theinstaller'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=Theinstaller'
391c391
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=Theinstallereither'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=Theinstallereither'
398c398
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=Theinstallereithercould'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=Theinstallereithercould'
405c405
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=Theinstallereithercouldnot'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=Theinstallereithercouldnot'
412c412
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=Theinstallereithercouldnotfind'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=Theinstallereithercouldnotfind'
419c419
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=Theinstallereithercouldnotfinda'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=Theinstallereithercouldnotfinda'
426c426
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJava'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJava'
433c433
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,'
440c440
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,or'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,or'
447c447
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,orthe'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,orthe'
454c454
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJava'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJava'
461c461
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVM'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVM'
468c468
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMon'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMon'
475c475
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthis'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthis'
482c482
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystem'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystem'
489c489
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemis'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemis'
496c496
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistoo'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistoo'
503c503
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.'
510c510
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.The'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.The'
517c517
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.Theinstaller'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.Theinstaller'
524c524
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.Theinstallerrequires'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.Theinstallerrequires'
531c531
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava'
538c538
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5'
545c545
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5or'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5or'
552c552
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.'
559c559
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.It'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.It'
566c566
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcan'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcan'
573c573
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbe'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbe'
580c580
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloaded'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloaded'
587c587
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfrom'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfrom'
594c594
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/'
601c601
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX'
608c608
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main'
615c615
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$'
622c622
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm='
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm='
629c629
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off'
636c636
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none'
643c643
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off'
650c650
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect='
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect='
657c657
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect='
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect='
664c664
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216'
671c671
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648'
678c678
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional='
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional='
685c685
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional= lax.installer.unix.internal.property.0='
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional= lax.installer.unix.internal.property.0='
692c692
< + INPUT=' lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional= lax.installer.unix.internal.property.0= lax.installer.unix.ui.default=GUI'
---
> + INPUT=' lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional= lax.installer.unix.internal.property.0= lax.installer.unix.ui.default=GUI'
695,696c695,696
< + test 'x lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional= lax.installer.unix.internal.property.0= lax.installer.unix.ui.default=GUI' '!=' x
< + set x lax.user.dir=/tmp/install.dir.27578 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main $'lax.nl.message.vm.not.loaded=The\017installer\017either\017could\017not\017find\017a\017Java\017VM,\017or\017the\017Java\017VM\017on\017this\017system\017is\017too\017old.\017The\017installer\017requires\017Java\0171.1.5\017or\017later.\017It\017can\017be\017downloaded\017from\017http://java.sun.com/products/jdk/1.1/jre/' lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main 'lax.command.line.args=$CMD_LINE_ARGUMENTS$' lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional= lax.installer.unix.internal.property.0= $'lax.installer.unix.ui.default=GUI\017'
---
> + test 'x lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional= lax.installer.unix.internal.property.0= lax.installer.unix.ui.default=GUI' '!=' x
> + set x lax.user.dir=/tmp/install.dir.25280 lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main $'lax.nl.message.vm.not.loaded=The\017installer\017either\017could\017not\017find\017a\017Java\017VM,\017or\017the\017Java\017VM\017on\017this\017system\017is\017too\017old.\017The\017installer\017requires\017Java\0171.1.5\017or\017later.\017It\017can\017be\017downloaded\017from\017http://java.sun.com/products/jdk/1.1/jre/' lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main 'lax.command.line.args=$CMD_LINE_ARGUMENTS$' lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional= lax.installer.unix.internal.property.0= $'lax.installer.unix.ui.default=GUI\017'
698c698
< + X=lax.user.dir=/tmp/install.dir.27578
---
> + X=lax.user.dir=/tmp/install.dir.25280
700c700
< + INPUT='lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional= lax.installer.unix.internal.property.0= lax.installer.unix.ui.default=GUI'
---
> + INPUT='lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional= lax.installer.unix.internal.property.0= lax.installer.unix.ui.default=GUI'
702c702
< + set x lax.user.dir /tmp/install.dir.27578
---
> + set x lax.user.dir /tmp/install.dir.25280
708c708
< + rhs=/tmp/install.dir.27578
---
> + rhs=/tmp/install.dir.25280
711,712c711,712
< + lax_user_dir=/tmp/install.dir.27578
< ++ echo /tmp/install.dir.27578
---
> + lax_user_dir=/tmp/install.dir.25280
> ++ echo /tmp/install.dir.25280
714,716c714,716
< + lax_user_dir=/tmp/install.dir.27578
< + test 'xlax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional= lax.installer.unix.internal.property.0= lax.installer.unix.ui.default=GUI' '!=' x
< + set x lax.resource.dir=Linux lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main $'lax.nl.message.vm.not.loaded=The\017installer\017either\017could\017not\017find\017a\017Java\017VM,\017or\017the\017Java\017VM\017on\017this\017system\017is\017too\017old.\017The\017installer\017requires\017Java\0171.1.5\017or\017later.\017It\017can\017be\017downloaded\017from\017http://java.sun.com/products/jdk/1.1/jre/' lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main 'lax.command.line.args=$CMD_LINE_ARGUMENTS$' lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional= lax.installer.unix.internal.property.0= $'lax.installer.unix.ui.default=GUI\017'
---
> + lax_user_dir=/tmp/install.dir.25280
> + test 'xlax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional= lax.installer.unix.internal.property.0= lax.installer.unix.ui.default=GUI' '!=' x
> + set x lax.resource.dir=Linux lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main $'lax.nl.message.vm.not.loaded=The\017installer\017either\017could\017not\017find\017a\017Java\017VM,\017or\017the\017Java\017VM\017on\017this\017system\017is\017too\017old.\017The\017installer\017requires\017Java\0171.1.5\017or\017later.\017It\017can\017be\017downloaded\017from\017http://java.sun.com/products/jdk/1.1/jre/' lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main 'lax.command.line.args=$CMD_LINE_ARGUMENTS$' lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional= lax.installer.unix.internal.property.0= $'lax.installer.unix.ui.default=GUI\017'
720c720
< + INPUT='lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional= lax.installer.unix.internal.property.0= lax.installer.unix.ui.default=GUI'
---
> + INPUT='lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional= lax.installer.unix.internal.property.0= lax.installer.unix.ui.default=GUI'
735,736c735,736
< + test 'xlax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional= lax.installer.unix.internal.property.0= lax.installer.unix.ui.default=GUI' '!=' x
< + set x lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main $'lax.nl.message.vm.not.loaded=The\017installer\017either\017could\017not\017find\017a\017Java\017VM,\017or\017the\017Java\017VM\017on\017this\017system\017is\017too\017old.\017The\017installer\017requires\017Java\0171.1.5\017or\017later.\017It\017can\017be\017downloaded\017from\017http://java.sun.com/products/jdk/1.1/jre/' lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main 'lax.command.line.args=$CMD_LINE_ARGUMENTS$' lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional= lax.installer.unix.internal.property.0= $'lax.installer.unix.ui.default=GUI\017'
---
> + test 'xlax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main lax.nl.message.vm.not.loaded=TheinstallereithercouldnotfindaJavaVM,ortheJavaVMonthissystemistooold.TheinstallerrequiresJava1.1.5orlater.Itcanbedownloadedfromhttp://java.sun.com/products/jdk/1.1/jre/ lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main lax.command.line.args=$CMD_LINE_ARGUMENTS$ lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional= lax.installer.unix.internal.property.0= lax.installer.unix.ui.default=GUI' '!=' x
> + set x lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip lax.main.class=com.zerog.ia.installer.Main lax.main.method=main $'lax.nl.message.vm.not.loaded=The\017installer\017either\017could\017not\017find\017a\017Java\017VM,\017or\017the\017Java\017VM\017on\017this\017system\017is\017too\017old.\017The\017installer\017requires\017Java\0171.1.5\017or\017later.\017It\017can\017be\017downloaded\017from\017http://java.sun.com/products/jdk/1.1/jre/' lax.nl.java.launcher.main.class=com.zerog.lax.LAX lax.nl.java.launcher.main.method=main 'lax.command.line.args=$CMD_LINE_ARGUMENTS$' lax.nl.current.vm= lax.nl.java.compiler=off lax.nl.java.option.verify.mode=none lax.nl.java.option.check.source=off lax.stderr.redirect= lax.stdout.redirect= lax.nl.java.option.java.heap.size.initial=16777216 lax.nl.java.option.java.heap.size.max=50331648 lax.nl.java.option.additional= lax.installer.unix.internal.property.0= $'lax.installer.unix.ui.default=GUI\017'
738c738
< + X=lax.class.path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip
---
> + X=lax.class.path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip
742c742
< + set x lax.class.path /tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip
---
> + set x lax.class.path /tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip
748c748
< + rhs=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip
---
> + rhs=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip
751c751
< + lax_class_path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip
---
> + lax_class_path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip
1041c1041
< + '[' /tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip = '' ']'
---
> + '[' /tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip = '' ']'
1053c1053
< ++ echo /tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip
---
> ++ echo /tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip
1055c1055
< + lax_class_path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip
---
> + lax_class_path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip
1061c1061
< + set x /tmp/install.dir.27578/InstallerData /tmp/install.dir.27578/InstallerData/installer.zip
---
> + set x /tmp/install.dir.25280/InstallerData /tmp/install.dir.25280/InstallerData/installer.zip
1069c1069
< + tmp_lcp=/tmp/install.dir.27578/InstallerData
---
> + tmp_lcp=/tmp/install.dir.25280/InstallerData
1073,1074c1073,1074
< + '[' /tmp/install.dir.27578/InstallerData = '' ']'
< + tmp_lcp=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip
---
> + '[' /tmp/install.dir.25280/InstallerData = '' ']'
> + tmp_lcp=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip
1077c1077
< + lax_class_path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip
---
> + lax_class_path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip
1081c1081
< + set x /tmp/install.dir.27578/InstallerData /tmp/install.dir.27578/InstallerData/installer.zip
---
> + set x /tmp/install.dir.25280/InstallerData /tmp/install.dir.25280/InstallerData/installer.zip
1089c1089
< + tmp_lcp=/tmp/install.dir.27578/InstallerData
---
> + tmp_lcp=/tmp/install.dir.25280/InstallerData
1093,1094c1093,1094
< + '[' /tmp/install.dir.27578/InstallerData = '' ']'
< + tmp_lcp=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip
---
> + '[' /tmp/install.dir.25280/InstallerData = '' ']'
> + tmp_lcp=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip
1097c1097
< + lax_class_path=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip
---
> + lax_class_path=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip
1894,1896c1894,1896
< + '[' '!' /tmp/install.dir.27578 = '' ']'
< + '[' '!' /tmp/install.dir.27578 = . ']'
< + cd /tmp/install.dir.27578
---
> + '[' '!' /tmp/install.dir.25280 = '' ']'
> + '[' '!' /tmp/install.dir.25280 = . ']'
> + cd /tmp/install.dir.25280
1906c1906
< + debugOut 'classpath............................... "/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip"'
---
> + debugOut 'classpath............................... "/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip"'
1908c1908
< + echo 'classpath............................... "/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip"'
---
> + echo 'classpath............................... "/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip"'
1912c1912
< + debugOut '.lax file path.......................... "/tmp/install.dir.27578/temp.lax"'
---
> + debugOut '.lax file path.......................... "/tmp/install.dir.25280/temp.lax"'
1914,1915c1914,1915
< + echo '.lax file path.......................... "/tmp/install.dir.27578/temp.lax"'
< + debugOut 'user directory.......................... "/tmp/install.dir.27578"'
---
> + echo '.lax file path.......................... "/tmp/install.dir.25280/temp.lax"'
> + debugOut 'user directory.......................... "/tmp/install.dir.25280"'
1917c1917
< + echo 'user directory.......................... "/tmp/install.dir.27578"'
---
> + echo 'user directory.......................... "/tmp/install.dir.25280"'
1992c1992
< + '[' localhost:10.0 = fr-par-zantafio.comverse.com:0 ']'
---
> + '[' localhost:12.0 = fr-par-zantafio.comverse.com:0 ']'
1994c1994
< + '[' localhost:10.0 = fr-par-zantafio.comverse.com:0.0 ']'
---
> + '[' localhost:12.0 = fr-par-zantafio.comverse.com:0.0 ']'
1996c1996
< + '[' localhost:10.0 = localhost:0 ']'
---
> + '[' localhost:12.0 = localhost:0 ']'
1998c1998
< + '[' localhost:10.0 = localhost:0.0 ']'
---
> + '[' localhost:12.0 = localhost:0.0 ']'
2000c2000
< + '[' localhost:10.0 = unix:0 ']'
---
> + '[' localhost:12.0 = unix:0 ']'
2002c2002
< + '[' localhost:10.0 = unix:0.0 ']'
---
> + '[' localhost:12.0 = unix:0.0 ']'
2004c2004
< + '[' localhost:10.0 = :0 ']'
---
> + '[' localhost:12.0 = :0 ']'
2006c2006
< + '[' localhost:10.0 = :0.0 ']'
---
> + '[' localhost:12.0 = :0.0 ']'
2010c2010
< + '[' -z localhost:10.0 ']'
---
> + '[' -z localhost:12.0 ']'
2014c2014
< + '[' -z localhost:10.0 -a gui = gui ']'
---
> + '[' -z localhost:12.0 -a gui = gui ']'
2019c2019
< + debugOut 'of this  shell'\''s DISPLAY (localhost:10.0) variable do not match.'
---
> + debugOut 'of this  shell'\''s DISPLAY (localhost:12.0) variable do not match.'
2021c2021
< + echo 'of this  shell'\''s DISPLAY (localhost:10.0) variable do not match.'
---
> + echo 'of this  shell'\''s DISPLAY (localhost:12.0) variable do not match.'
2049c2049
< + CLASSPATH=/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip:/home/oracle/app/oracle/product/11.2.0/dbhome_1/jdbc/lib/ojdbc6.jar
---
> + CLASSPATH=/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip:/home/oracle/app/oracle/product/11.2.0/dbhome_1/jdbc/lib/ojdbc6.jar
2051c2051
< + debugOut '[7mCLASSPATH:[0m/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip:/home/oracle/app/oracle/product/11.2.0/dbhome_1/jdbc/lib/ojdbc6.jar'
---
> + debugOut '[7mCLASSPATH:[0m/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip:/home/oracle/app/oracle/product/11.2.0/dbhome_1/jdbc/lib/ojdbc6.jar'
2053c2053
< + echo '[7mCLASSPATH:[0m/tmp/install.dir.27578/InstallerData:/tmp/install.dir.27578/InstallerData/installer.zip:/home/oracle/app/oracle/product/11.2.0/dbhome_1/jdbc/lib/ojdbc6.jar'
---
> + echo '[7mCLASSPATH:[0m/tmp/install.dir.25280/InstallerData:/tmp/install.dir.25280/InstallerData/installer.zip:/home/oracle/app/oracle/product/11.2.0/dbhome_1/jdbc/lib/ojdbc6.jar'
2066,2067c2066
< + exec /usr/local/java1.6/bin/java com.zerog.lax.LAX /tmp/install.dir.27578/temp.lax /tmp/env.properties.27578 '"-f"' '"instoldpla.conf"'
< X connection to localhost:10.0 broken (explicit kill or server shutdown).
---
> + exec /usr/local/java1.6/bin/java com.zerog.lax.LAX /tmp/install.dir.25280/temp.lax /tmp/env.properties.25280 '"-f"' '"instoldpla.conf"'
