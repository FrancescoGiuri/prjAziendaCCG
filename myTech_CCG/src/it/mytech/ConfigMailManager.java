package it.mytech;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class ConfigMailManager {

	private static Properties prop;
	private MimeMessage message;
	private Transport transport;
	private Session session;

	public ConfigMailManager() throws Exception {
		// Leggo le proprietà da file properties
		ReadPropertyFileFromClassPath obj = new ReadPropertyFileFromClassPath();
		prop = obj.loadProperties("config.properties");

		session = Session.getDefaultInstance(prop);
		transport = session.getTransport("smtp");
		System.out.println("Connessione al mail server");
		transport.connect(prop.getProperty("mail.smtp.host"), prop.getProperty("mail.smtp.user"),
				prop.getProperty("mail.smtp.password"));
		System.out.println("Connesso...");
	}

	public void close() throws Exception {
		System.out.println("Chiusura connessione...");
		transport.close();
	}

	// Invio della mail
	public boolean sendCredenziali(String email) {
		boolean check = true;
		message = new MimeMessage(session);
		try {
			// Impostazione del destinatario
			InternetAddress toAddress = new InternetAddress(email);
			message.addRecipient(Message.RecipientType.TO, toAddress);

			// Impostazione del mittente
			message.setFrom(new InternetAddress(prop.getProperty("mail.smtp.user"), "myTech"));

			// Impostazione dell'oggetto del messaggio
			message.setSubject("Forgot Password");

			// Prelevo la password dal database
			DBManager db = new DBManager();
			String password = db.getPassword(email);
			if (!password.equals("")) {
				// Imposto la password come testo del messaggio
				message.setText(db.getPassword(email));
				// Invio la mail
				transport.sendMessage(message, message.getAllRecipients());
				System.out.println("Mail Inviata!!!");
			} else
				check = false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	public boolean sendRegistrazione(String email) {
		boolean check = true;
		message = new MimeMessage(session);
		try {
			// Impostazione del destinatario
			InternetAddress toAddress = new InternetAddress(email);
			message.addRecipient(Message.RecipientType.TO, toAddress);

			// Impostazione del mittente
			message.setFrom(new InternetAddress(prop.getProperty("mail.smtp.user"), "myTech"));

			// Impostazione dell'oggetto del messaggio
			message.setSubject("Benvenuto nel mondo myTech!");

			// Prelevo la password dal database
			DBManager db = new DBManager();
			String password = db.getPassword(email);
			if (!password.equals("")) {
				// Imposto la password come testo del messaggio
				message.setText("Hai fatto la scelta giusta! Scegli la qualità, scegli myTech!");
				// Invio la mail
				transport.sendMessage(message, message.getAllRecipients());
				System.out.println("Mail Inviata!!!");
			} else
				check = false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	public boolean sendConfermaOrdine(String email) {
		boolean check = true;
		message = new MimeMessage(session);
		try {
			// Impostazione del destinatario
			InternetAddress toAddress = new InternetAddress(email);
			message.addRecipient(Message.RecipientType.TO, toAddress);

			// Impostazione del mittente
			message.setFrom(new InternetAddress(prop.getProperty("mail.smtp.user"), "myTech"));

			// Impostazione dell'oggetto del messaggio
			message.setSubject("Conferma ordine");

			// Prelevo la password dal database
			DBManager db = new DBManager();
			String password = db.getPassword(email);
			if (!password.equals("")) {
				// Imposto la password come testo del messaggio
				message.setText(
						"Gentile cliente,\nla informiamo che abbiamo ricevuto il suo ordine. Dovrebbe aver ricevuto in automatico il recap dell'ordine, provi a controllare nei download del suo browser web! Per eventuali problemi, ci contatti tramite il nostro sito!\n"
								+ "Riceverà una mail non appena il suo ordine sarà pronto per essere ritirato!"
								+ "La ringraziamo per aver scelto di acquistare da noi di myTech!");
				// Invio la mail
				transport.sendMessage(message, message.getAllRecipients());
				System.out.println("Mail Inviata!!!");
			} else
				check = false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}
}
