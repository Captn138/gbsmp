#!/usr/bin/env bash

NEOF_VERSION=21.1.180
JAVA_VERSION=21

JAVA_PATH=jre/bin/java

XMS=4G
XMX=12G

if [ ! -f $JAVA_PATH ]
then
        echo "Downloading Adoptium JRE ${JAVA_VERSION}..."
        case "$(lscpu | grep Architecture | awk '{print $2}')" in
        aarch64)
                CPU_ARCH=aarch64
                ;;
        x86_64)
                CPU_ARCH=x64
                ;;
        esac
        JAVA_TAR=jre.tar.gz        
        JAVA_URL=https://api.adoptium.net/v3/binary/latest/${JAVA_VERSION}/ga/linux/${CPU_ARCH}/jre/hotspot/normal/eclipse
        curl -sL $JAVA_URL -o $JAVA_TAR
        [[ ! -d jre ]] && mkdir jre
        tar xf $JAVA_TAR -C jre --strip-components=1
        rm $JAVA_TAR
fi

if [ ! -f libraries/net/neoforged/neoforge/${NEOF_VERSION}/neoforge-${NEOF_VERSION}-server.jar ]
then
        echo "Downloading NeoForge installer..."
        NEOF_URL=https://maven.neoforged.net/releases/net/neoforged/neoforge/${NEOF_VERSION}/neoforge-${NEOF_VERSION}-installer.jar
        curl -sOJ $NEOF_URL
        $JAVA_PATH -jar neoforge-${NEOF_VERSION}-installer.jar --install-server
        rm -f neoforge-${NEOF_VERSION}-installer.jar{,.log} user_jvm_args.txt run.{sh,bat}
fi

if [ -z $(grep "eula=true" eula.txt 2>/dev/null) ]
then
        echo "Accepting EULA..."
        echo "eula=true" > eula.txt
fi

$JAVA_PATH -Xms$XMS -Xmx$XMX @libraries/net/neoforged/neoforge/${NEOF_VERSION}/unix_args.txt nogui
