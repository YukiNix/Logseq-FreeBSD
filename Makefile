PORTNAME=	logseq
PORTVERSION=	0.10.9
CATEGORIES=	deskutils
MASTER_SITES=	https://github.com/logseq/logseq/releases/download/${PORTVERSION}/
DISTNAME=	Logseq-linux-x64
EXTRACT_SUFX=	-${PORTVERSION}.zip

MAINTAINER=	nixyuki@outlook.com
COMMENT=	Privacy-first, open-source knowledge management tool
WWW=		https://logseq.com

LICENSE=	AGPLv3

ONLY_FOR_ARCHS=	amd64 x64

# BUILD_DEPENDS=	\

RUN_DEPENDS=	\
		linux_base-rl9>=9.4:emulators/linux_base-rl9

NO_BUILD=	yes

LOGSEQSUBPATH=	opt/logseq
LOGSEQPATH=	${STAGEDIR}${LINUXBASE}/${LOGSEQSUBPATH}
LOGSEQEXEC=	run_logseq
DESKTOPFILE=	${STAGEDIR}${PREFIX}/share/applications/logseq.desktop

do-install:
	${MKDIR} ${LOGSEQPATH}
	${CP} -r ${WRKSRC}/* ${LOGSEQPATH}/
	${ECHO} "#! /bin/sh" > ${LOGSEQPATH}/${LOGSEQEXEC}
	${ECHO} "exec ${LINUXBASE}/${LOGSEQSUBPATH}/Logseq --no-sandbox" >> ${LOGSEQPATH}/${LOGSEQEXEC}
	${MKDIR} ${STAGEDIR}${PREFIX}/share/applications
	${MKDIR} ${STAGEDIR}${PREFIX}/share/icons
	${LN} -sf ${LINUXBASE}/${LOGSEQSUBPATH}/resources/app/icon.png ${STAGEDIR}${PREFIX}/share/icons/logseq.png
	${ECHO} "[Desktop Entry]" > ${DESKTOPFILE}
	${ECHO} "Name=Logseq" >> ${DESKTOPFILE}
	${ECHO} "Comment=A privacy-first, open-source platform for knowledge management" >> ${DESKTOPFILE}
	${ECHO} "Exec=/usr/local/bin/logseq" >> ${DESKTOPFILE}
	${ECHO} "Icon=/usr/local/share/icons/logseq.png" >> ${DESKTOPFILE}
	${ECHO} "Terminal=false" >> ${DESKTOPFILE}
	${ECHO} "Type=Application" >> ${DESKTOPFILE}
	${ECHO} "Categories=Education;Office;" >> ${DESKTOPFILE}

post-install:
	${MKDIR} -p ${STAGEDIR}${LINUXBASE}/usr/bin/
	${LN} -sf ${LINUXBASE}/${LOGSEQSUBPATH}/${LOGSEQEXEC} ${STAGEDIR}${LINUXBASE}/usr/bin/logseq
	${LN} -sf ${LINUXBASE}/${LOGSEQSUBPATH}/${LOGSEQEXEC} ${STAGEDIR}${PREFIX}/bin/logseq

.include <bsd.port.mk>
