package com.webtrucking.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.google.gson.Gson;
import com.webtrucking.client.TmnWalletClient;
import com.webtrucking.controller.domain.WalletCreateProfileDTO;
import com.webtrucking.controller.domain.WalletOtpDTO;
import com.webtrucking.controller.domain.WalletTokenDTO;
import com.webtrucking.util.JsonMapConverter;
import org.apache.logging.log4j.LogManager;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/wallet")
@Transactional
@PropertySource("classpath:application.properties")
public class WalletControler extends BaseController {
	static org.apache.logging.log4j.Logger log = LogManager.getLogger(WalletControler.class);

	@Autowired
	private TmnWalletClient tmnWalletClient;

    @RequestMapping(value = "/get_otp/{mobileNumber}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<WalletOtpDTO> getOtp(@PathVariable String mobileNumber) throws JsonProcessingException {
        log.info("===== Start get otp for mobile number {}", mobileNumber);

		Map otp = tmnWalletClient.getOtp(mobileNumber);
		String number = otp.get("mobile_number").toString();
		String otpReference = otp.get("otp_reference").toString();

		WalletOtpDTO walletOtpDTO = new WalletOtpDTO(number, otpReference);

		log.info("===== End get otp for mobile number {}", mobileNumber);

		return new ResponseEntity<WalletOtpDTO>(walletOtpDTO, HttpStatus.OK);
    }

	@RequestMapping(value = "/confirm_otp", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<WalletTokenDTO> confirmOtp(@RequestBody WalletOtpDTO otpDTO) {
		log.info("===== Start confirm otp for mobile number {}", otpDTO.getOtpReference());

		// TODO hardcode otp_code to 900531
		Map map = tmnWalletClient.confirmOtp("123456", "{{otp_ref}}", otpDTO.getMobileNumber());
		WalletTokenDTO walletToken = new WalletTokenDTO();
		walletToken.setToken(map.get("token").toString());

		log.info("===== End confirm otp for mobile number {}", otpDTO.getOtpReference());

		return new ResponseEntity<WalletTokenDTO>(walletToken, HttpStatus.OK);
	}

	@RequestMapping(value = "/create_wallet", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<WalletCreateProfileDTO> createWallet(@RequestBody WalletCreateProfileDTO walletCreateProfileDTO, @RequestHeader HttpHeaders headers) {
		List<String> token = headers.get("token");

		log.info("===== Start create profile. Token {}", token);

		Map<String, String> requests = new HashMap<>();
		requests.put("thai_id", walletCreateProfileDTO.getThaiId());
		requests.put("first_name", walletCreateProfileDTO.getFirstName());
		requests.put("last_name", walletCreateProfileDTO.getLastName());
		requests.put("postal_code", walletCreateProfileDTO.getPostalCode());
		requests.put("mobile_number", walletCreateProfileDTO.getMobileNumber());
		requests.put("password", walletCreateProfileDTO.getPassword());
		requests.put("email", walletCreateProfileDTO.getEmail());
		requests.put("address", walletCreateProfileDTO.getAddress());
		requests.put("occupation", walletCreateProfileDTO.getOccupation());

		Map profile = tmnWalletClient.createProfile(token.get(0), requests);
		WalletCreateProfileDTO resp = new WalletCreateProfileDTO();
		resp.setThaiId(profile.get("thai_id").toString());
		resp.setFirstName(profile.get("first_name").toString());
		resp.setLastName(profile.get("last_name").toString());
		resp.setPostalCode(profile.get("postal_code").toString());
		resp.setMobileNumber(profile.get("mobile_number").toString());
		resp.setPassword(profile.get("password").toString());
		resp.setEmail(profile.get("email").toString());
		resp.setAddress(profile.get("address").toString());
		resp.setOccupation(profile.get("occupation").toString());
		resp.setErrorMessage(profile.get("error_message").toString());

		log.info("===== End create profile. Token {}", token);
		return new ResponseEntity<WalletCreateProfileDTO>(resp, HttpStatus.OK);
	}

	@RequestMapping(value = "/sign_in", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String createWallet(@RequestBody Map<String, String> requests) {
		log.info("===== Start sign in wallet {}", requests);

		String userName = requests.get("username").toString();
		String password = requests.get("password").toString();

		Map profile = tmnWalletClient.signIn(userName, password);
		JSONObject jsonObject = JsonMapConverter.toJson(profile);

		log.info("===== End sign in wallet");
    	return jsonObject.toString();
	}

	@RequestMapping(value = "/draft_transaction", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String draftTransaction(@RequestBody Map<String, String> requests) {
		log.info("===== Start draft transaction {}", requests);

		String token = requests.get("token").toString();
		String amount = requests.get("amount").toString();
		String mobileNumber = requests.get("mobile_number").toString();

		Map draftTransaction = tmnWalletClient.draftTransaction(token, mobileNumber, amount);
		JSONObject jsonObject = JsonMapConverter.toJson(draftTransaction);

		log.info("===== End draft transaction");
		return jsonObject.toString();
	}

	@RequestMapping(value = "/get_otp_transfer", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String getOtpTransfer(@RequestBody Map<String, String> requests) {
		log.info("===== Start get otp transfer {}", requests);

		String accessToken = requests.get("token").toString();
		String draftTransactionId = requests.get("draft_transaction_id").toString();
		String personalMessage = requests.get("personal_message").toString();

		Map result = tmnWalletClient.sendOtpTransfer(accessToken, draftTransactionId, personalMessage);
		JSONObject jsonObject = JsonMapConverter.toJson(result);

		log.info("===== End get otp transfer");
		return jsonObject.toString();
	}

	@RequestMapping(value = "/confirm_otp_transfer", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String confirmOtpTransfer(@RequestBody Map<String, String> requests) {
		log.info("===== Start confirm otp transfer {}", requests);

		String accessToken = requests.get("token").toString();
		String draftTransactionId = requests.get("transaction_id").toString();
		String mobileNumber = requests.get("mobile_number").toString();
		String otpRefCode = requests.get("otp_ref_code").toString();
		String otpString = requests.get("otp_string").toString();

		Map result = tmnWalletClient.confirmOtpTransfer(accessToken, draftTransactionId, mobileNumber, otpRefCode, otpString);
		JSONObject jsonObject = JsonMapConverter.toJson(result);

		log.info("===== End confirm otp transfer");
		return jsonObject.toString();
	}

	@RequestMapping(value = "/get_transfer_status", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String getTransferStatus(@RequestBody Map<String, String> requests) {
		log.info("===== Start get transfer status {}", requests);

		String accessToken = requests.get("token").toString();
		String transactionId = requests.get("transaction_id").toString();

		Map result = tmnWalletClient.getTransferStatus(accessToken, transactionId);
		JSONObject jsonObject = JsonMapConverter.toJson(result);

		log.info("===== Start get transfer status");
		return jsonObject.toString();
	}

	@RequestMapping(value = "/get_transfer_detail", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String getTransferDetail(@RequestBody Map<String, String> requests) {
		log.info("===== Start get transfer detail {}", requests);

		String accessToken = requests.get("token").toString();
		String transactionId = requests.get("transaction_id").toString();

		Map result = tmnWalletClient.getTransferDetails(accessToken, transactionId);
		JSONObject jsonObject = JsonMapConverter.toJson(result);

		log.info("===== Start get transfer detail");
		return jsonObject.toString();
	}

	@RequestMapping(value = "/get_user_balance", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String getUserBalance(@RequestBody Map<String, String> requests) {
		log.info("===== Start get user balance {}", requests);

		String accessToken = requests.get("token").toString();

		// TODO hardcode deviceOs = "ios", appVersion = "2.0"
		Map result = tmnWalletClient.getUserBalance(accessToken, "ios", "2.0");
		JSONObject jsonObject = JsonMapConverter.toJson(result);

		log.info("===== Start get user balance");
		return jsonObject.toString();
	}
}
