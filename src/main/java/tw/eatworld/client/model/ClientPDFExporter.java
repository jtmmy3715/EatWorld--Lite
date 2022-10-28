package tw.eatworld.client.model;

import java.awt.Color;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;

import com.lowagie.text.*;
import com.lowagie.text.pdf.*;

public class ClientPDFExporter {
	
	private List<ClientMember> clients;

	public ClientPDFExporter(List<ClientMember> clients) {
        this.clients = clients;
    }

	private void writeTableHeader(PdfPTable table) throws DocumentException, IOException {
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(Color.orange);
		cell.setPadding(3);
		cell.setMinimumHeight(20);
		
		BaseFont bfChinese = BaseFont.createFont("c:\\windows\\fonts\\KAIU.TTF",BaseFont.IDENTITY_H,BaseFont.NOT_EMBEDDED);
		Font font = new Font(bfChinese,12,Font.UNDEFINED);

		font.setColor(Color.black);

		cell.setPhrase(new Paragraph("ID", font));
		table.addCell(cell);
		
		cell.setPhrase(new Paragraph("會員名稱", font));
		table.addCell(cell);

		cell.setPhrase(new Paragraph("E-mail", font));
		table.addCell(cell);

		cell.setPhrase(new Paragraph("會員生日", font));
		table.addCell(cell);

		cell.setPhrase(new Paragraph("連絡電話", font));
		table.addCell(cell);

		cell.setPhrase(new Paragraph("加入日期", font));
		table.addCell(cell);
	}

	private void writeTableData(PdfPTable table) throws DocumentException, IOException {
		
		
		BaseFont bfChinese = BaseFont.createFont("c:\\windows\\fonts\\KAIU.TTF",BaseFont.IDENTITY_H,BaseFont.NOT_EMBEDDED);
		Font font = new Font(bfChinese,12,Font.UNDEFINED);
		
		for (ClientMember client : clients) {
			PdfPCell cell = new PdfPCell();
			cell.setPadding(3);
			cell.setMinimumHeight(20);
			cell.setPhrase(new Paragraph(String.valueOf(client.getClientId()), font));
			table.addCell(cell);
			table.addCell(new PdfPCell(new Phrase(client.getClientName(),font)));
			table.addCell(client.getClientEmail());
			table.addCell(client.getClientMemberDetail().getClientBirthday());
			table.addCell(client.getClientMemberDetail().getClientPhone());
			table.addCell(String.valueOf(client.getClientMemberDetail().getClientAdddate()));
		}
	}

	public void export(HttpServletResponse response) throws DocumentException, IOException {
		Document document = new Document(PageSize.A4);
		PdfWriter.getInstance(document, response.getOutputStream());

		document.open();
		BaseFont bfChinese = BaseFont.createFont("c:\\windows\\fonts\\KAIU.TTF",BaseFont.IDENTITY_H,BaseFont.NOT_EMBEDDED);
		Font font = new Font(bfChinese,12,Font.UNDEFINED);
		font.setSize(18);
		font.setColor(Color.BLACK);

		Paragraph p = new Paragraph("會員名單", font);
		p.setAlignment(Paragraph.ALIGN_CENTER);
		document.add(p);

		PdfPTable table = new PdfPTable(6);
		table.setWidthPercentage(100f);
		table.setWidths(new float[] { 0.5f, 1.5f, 4.0f, 1.5f, 1.5f, 1.5f });
		table.setSpacingBefore(10);
		writeTableHeader(table);
		writeTableData(table);

		document.add(table);
		document.close();

	}
}
