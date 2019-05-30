package STR;

public class CDTO {

	private String date;
	private String c_num;

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getc_num() {
		return c_num;
	}

	public void setc_num(String c_num) {
		this.c_num = c_num;
	}

	// 기본생성자
	public CDTO() {
		// TODO Auto-generated constructor stub
	}

	// 매개변수가 있는 생성자
	public CDTO(String date, String c_num) {
		super();
		this.date = date;
		this.c_num = c_num;
	}

}
