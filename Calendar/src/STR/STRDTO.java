package STR;

public class STRDTO {
	private String str_status;
    private String userNum;
    private String str_name;
	private String count;
    private String check;
    private String date;
    
	public String getStr_status() {
		return str_status;
	}
	public void setStr_status(String str_status) {
		this.str_status = str_status;
	}
	public String getUserNum() {
		return userNum;
	}
	public void setUserNum(String userNum) {
		this.userNum = userNum;
	}
	public String getStr_name() {
		return str_name;
	}
	public void setStr_name(String str_name) {
		this.str_name = str_name;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getCheck() {
		return check;
	}
	public void setCheck(String check) {
		this.check = check;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}

	// 기본생성자
    public STRDTO() {
        // TODO Auto-generated constructor stub
    }
 
    // 매개변수가 있는 생성자
    public STRDTO(String str_status, String userNum, String str_name, String count,String check, String date) {
        super();
        this.str_status = str_status;
        this.userNum = userNum;
        this.str_name = str_name;
        this.count = count;
        this.check = check;
        this.date = date;
    }
 
}
