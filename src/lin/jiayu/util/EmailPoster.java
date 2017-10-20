package lin.jiayu.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.AuthenticationFailedException;
import javax.mail.Message;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
/*
 * 来源weijianlee
 * 
 */
public class EmailPoster {

	final static String strHost = "smtp.163.com";//你自己邮箱的SMTP服务器地址
	final static int nPort = 0;
	final static String strUserName = "18813960106@163.com";//你自己邮箱的账号
	final static String strPassWord ="123456abcd";//你自己邮箱的密码St@)!^!)@&
	final static String strFrom = "18813960106@163.com";//你自己的邮箱
	
	/**
	 * @param email:要发送到的邮箱
	 * @param checkcode:验证码
	 * @return 返回结果
	 */
	public static boolean postCheckCode(String email, String checkcode) {
		try {
			String strToList = email;//要发送的邮箱列表，以';'分割
			String strCCList ="";
			String strBCCList = "";
			String strSubject = "[有空问答]验证码";//邮件标题
			String strMessage = "[有空问答]您的验证码是："+checkcode;//邮件内容
			//创建邮件的属性
			Properties props = new Properties();
			props.put("mail.smtp.host", strHost);
			props.put("mail.smtp.auth", "true");
			Session MailSession = Session.getInstance(props, null);
			MailSession.setDebug(true);
			//创建一个消息
			Message msg = new MimeMessage(MailSession);
			//发件人地址
			InternetAddress from = new InternetAddress(strFrom);
			msg.setFrom(from);
			//目标地址
			String[] strTo = strToList.split(";");
			for(int i=0; i<strTo.length; i++){
				if (strTo[i] != null && strTo[i].length() > 0) {
					InternetAddress[] to = { new InternetAddress(strTo[i])};
					msg.addRecipients(Message.RecipientType.TO, to);
				} else {
					throw new Exception("No Recipient");		
					}
			}
			//抄送
			if (strCCList != null && strCCList.length() > 0) {
				InternetAddress[] cc = { new InternetAddress(strCCList)};
				msg.setRecipients(Message.RecipientType.CC, cc);
				}
			//密送
			if (strBCCList != null && strBCCList.length() > 0) {
				InternetAddress[] bcc = { new InternetAddress(strBCCList)};
				msg.setRecipients(Message.RecipientType.BCC, bcc);
				}
			//添加邮件的主题
			if (strSubject != null) {
				msg.setSubject(strSubject);
			}
				//添加邮件的日期
			msg.setSentDate(new Date());
			//添加邮件的内容
			if (strMessage != null && strMessage.trim().length() > 0) {
				msg.setText(strMessage);
			} else
				msg.setText("No message to be sent!");
			msg.saveChanges();
			//发送邮件
			int nMailPort = -1;
			Transport transport = MailSession.getTransport("smtp");
			transport.connect(strHost, nMailPort, strUserName, strPassWord);
			transport.sendMessage(msg, msg.getAllRecipients());
			transport.close();
			return true;
		} catch (AuthenticationFailedException ae) {
			ae.printStackTrace();
			return false;
		} catch (SendFailedException sf) {
			sf.printStackTrace();
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
