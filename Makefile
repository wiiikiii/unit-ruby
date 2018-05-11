# Created by: wiiikiii <wkaha@yahoo.com>
# $FreeBSD: $

PKGNAMESUFFIX=  -ruby${RUBY_PKGNAMESUFFIX}

COMMENT=        RUBY module for NGINX Unit

PLIST_FILES=    libexec/unit/modules/ruby${RUBY_VER}.unit.so

USE_RC_SUBR=    # reset to empty

MASTERDIR=      ${.CURDIR}/../unit

post-configure:
        cd ${CONFIGURE_WRKSRC} && \
        ./configure ruby --module=ruby${RUBY_VER}

do-install:
        ${MKDIR} ${STAGEDIR}${PREFIX}/libexec/unit/modules/
        ${INSTALL_LIB} ${WRKSRC}/build/ruby${RUBY_VER}.unit.so \
                ${STAGEDIR}${PREFIX}/libexec/unit/modules/

.include "${MASTERDIR}/Makefile"
