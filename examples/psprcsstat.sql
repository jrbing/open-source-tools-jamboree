select a.servername as "ps.prcs.psprcsstat.server"
     , a.srvrhostname as "ps.prcs.psprcsstat.hostname"
     , a.serverstatusdescr as "ps.prcs.psprcsstat.status"
     , a.descr2 as "ps.prcs.psprcsstat.os"
     , a.distnodename as "ps.prcs.psprcsstat.distnode"
     , a.heartbeat as "ps.prcs.psprcsstat.heartbeat"
     , a.begindttm as "ps.prcs.psprcsstat.laststarted"
     , a.lastupddttm as "ps.prcs.psprcsstat.lastupdated"
     , coalesce(( select sum(itemcount) from ps_pmn_prcsactv_vw b where a.servername = b.servername), 0) as "ps.prcs.psprcsstat.running"
  from ps_pmn_srvrlist a
    where a.lastupddttm > :sql_last_value
    and a.lastupddttm > sysdate - interval '1' day
