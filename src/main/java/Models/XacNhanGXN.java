package Models;

import java.sql.Date;
import java.time.*;

public class XacNhanGXN {
	private String ID;
	private String tenDichVu;
	private String soLuong;
	private String maLoaiGiay;
	private String tenLoaiGiay;
	private String stt;
	private String Mssv;
	private LocalDateTime thoiGianDangKi;
	private LocalDateTime thoiGianPhanHoi;
	private String tieuDe;
	private String MaCTSV;
	private String noiDungPhanHoi;
	private String trangThai;
	
	public XacNhanGXN() {
		super();
	}

	public XacNhanGXN(String iD, String tenDichVu, String soLuong, String maLoaiGiay, String tenLoaiGiay, String mssv,
			LocalDateTime thoiGianDangKi, LocalDateTime thoiGianPhanHoi, String tieuDe, String maCTSV, String noiDungPhanHoi,
			String trangThai) {
		super();
		ID = iD;
		this.tenDichVu = tenDichVu;
		this.soLuong = soLuong;
		this.maLoaiGiay = maLoaiGiay;
		this.tenLoaiGiay = tenLoaiGiay;
		this.Mssv = mssv;
		this.thoiGianDangKi = thoiGianDangKi;
		this.thoiGianPhanHoi = thoiGianPhanHoi;
		this.tieuDe = tieuDe;
		MaCTSV = maCTSV;
		this.noiDungPhanHoi = noiDungPhanHoi;
		this.trangThai = trangThai;
	}

	public XacNhanGXN(String iD, String tenLoaiGiay, String mssv, LocalDateTime thoiGianDangKi, String soLuong, String stt, String trangThai) {
		super();
		this.ID = iD;
		this.tenLoaiGiay = tenLoaiGiay;
		this.Mssv = mssv;
		this.thoiGianDangKi = thoiGianDangKi;
		this.soLuong = soLuong;
		this.stt = stt;
		this.trangThai = trangThai;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getTenDichVu() {
		return tenDichVu;
	}

	public void setTenDichVu(String tenDichVu) {
		this.tenDichVu = tenDichVu;
	}

	public String getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(String soLuong) {
		this.soLuong = soLuong;
	}

	public String getMaLoaiGiay() {
		return maLoaiGiay;
	}

	public void setMaLoaiGiay(String maLoaiGiay) {
		this.maLoaiGiay = maLoaiGiay;
	}

	public String getTenLoaiGiay() {
		return tenLoaiGiay;
	}

	public void setTenLoaiGiay(String tenLoaiGiay) {
		this.tenLoaiGiay = tenLoaiGiay;
	}

	public String getStt() {
		return stt;
	}

	public void setStt(String stt) {
		this.stt = stt;
	}

	public String getMssv() {
		return Mssv;
	}

	public void setMssv(String mssv) {
		Mssv = mssv;
	}

	public LocalDateTime getThoiGianDangKi() {
		return thoiGianDangKi;
	}

	public void setThoiGianDangKi(LocalDateTime thoiGianDangKi) {
		this.thoiGianDangKi = thoiGianDangKi;
	}

	public LocalDateTime getThoiGianPhanHoi() {
		return thoiGianPhanHoi;
	}

	public void setThoiGianPhanHoi(LocalDateTime thoiGianPhanHoi) {
		this.thoiGianPhanHoi = thoiGianPhanHoi;
	}

	public String getTieuDe() {
		return tieuDe;
	}

	public void setTieuDe(String tieuDe) {
		this.tieuDe = tieuDe;
	}

	public String getMaCTSV() {
		return MaCTSV;
	}

	public void setMaCTSV(String maCTSV) {
		MaCTSV = maCTSV;
	}

	public String getNoiDungPhanHoi() {
		return noiDungPhanHoi;
	}

	public void setNoiDungPhanHoi(String noiDungPhanHoi) {
		this.noiDungPhanHoi = noiDungPhanHoi;
	}

	public String getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}
	
}
