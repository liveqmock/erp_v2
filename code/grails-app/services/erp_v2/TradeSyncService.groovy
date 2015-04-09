package erp_v2

class TradeSyncService {

    static transactional = true

    def addlog(session, actions) {
		def syslog = new SysLog()
	    syslog.user = session instanceof User ? session : session.user
	    syslog.userRealname = syslog.user?.realname
	    syslog.content = actions
	    syslog.timeCreate = new Date()
	    syslog.ip = syslog.user?.lastIp
	    syslog.save()
    }
}
