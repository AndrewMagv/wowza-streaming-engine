package mzplus.livestream;

import com.wowza.wms.authentication.*;
import com.wowza.wms.logging.WMSLoggerFactory;

import redis.clients.jedis.*;

public class Auth extends AuthenticateUsernamePasswordProviderBase
{
    protected Jedis jedis = null;

    public Auth() {
        super();
        jedis = new Jedis("localhost", 6379);
        try {
            jedis.select(1);
        }
        catch (Exception ex) {
            WMSLoggerFactory.getLogger(null).info("bad authdb : " + ex.getMessage());
        }
    }

    public String getPassword(String username)
    {
        String passwd = null;
        try {
            passwd = jedis.get(username);
        }
        catch (Exception ex) {
            WMSLoggerFactory.getLogger(null).info("getPassword failed : " + ex.getMessage());
        }
        // return password for given username
        return passwd;
    }

    public boolean userExists(String username)
    {
        Boolean exist = Boolean.FALSE;
        try {
            exist = jedis.exists(username);
        }
        catch (Exception ex) {
            WMSLoggerFactory.getLogger(null).info("userExists failed : " + ex.getMessage());
        }
        // return true is user exists
        return exist.booleanValue();
    }
}
