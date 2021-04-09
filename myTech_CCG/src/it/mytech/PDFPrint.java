package it.mytech;

import java.awt.Color;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDFont;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import be.quodlibet.boxable.BaseTable;
import be.quodlibet.boxable.Cell;
import be.quodlibet.boxable.Row;
import be.quodlibet.boxable.VerticalAlignment;
import be.quodlibet.boxable.line.LineStyle;

public class PDFPrint {

	private ByteArrayOutputStream output;
	private PDFont fontBold;
	private PDDocument document;
	private PDPage page;
	private PDPageContentStream cos;
	private float margin;
	private float yStartNewPage;
	private float tableWidth;
	private boolean drawContent;
	private float bottomMargin;
	private float yPosition;
	private BaseTable table;
	private Row<PDPage> headerRow;
	private Cell<PDPage> cell;
	private Row<PDPage> row;

	public PDFPrint() throws Exception {
		output = new ByteArrayOutputStream();
		// Create a new font object selecting one of the PDF base fonts
		fontBold = PDType1Font.HELVETICA_BOLD;

		// Create a document and add a page to it
		document = new PDDocument();
		page = new PDPage(PDRectangle.A4);
		// PDRectangle.LETTER and others are also possible
		// rect can be used to get the page width and height
		document.addPage(page);

		// Start a new content stream which will "hold" the to be created content
		cos = new PDPageContentStream(document, page);

		// Dummy Table
		margin = 50;
		// starting y position is whole page height subtracted by top and bottom margin
		yStartNewPage = page.getMediaBox().getHeight() - (2 * margin);
		// we want table across whole page width (subtracted by left and right margin
		// ofcourse)
		tableWidth = page.getMediaBox().getWidth() - (2 * margin);

		drawContent = true;
		bottomMargin = 70;
		// y position is your coordinate of top left corner of the table
		yPosition = 800;

		table = new BaseTable(yPosition, yStartNewPage, bottomMargin, tableWidth, margin, document, page, true,
				drawContent);

		// the parameter is the row height
		headerRow = table.createRow(50);

	}

	public ByteArrayOutputStream printOrdineRecap(int idOrdine) throws Exception {
		cell = headerRow.createCell(100, "Recap ordine n°" + idOrdine);
		cell.setFont(fontBold);
		cell.setTextColor(Color.RED);
		cell.setFontSize(20);
		// vertical alignment
		cell.setValign(VerticalAlignment.MIDDLE);
		// border style
		cell.setTopBorderStyle(new LineStyle(Color.BLACK, 10));
		table.addHeaderRow(headerRow);
		row = table.createRow(20);
		cell = row.createCell(25, "ID PRODOTTO");
		cell.setFontSize(15);
		cell.setFont(fontBold);
		cell = row.createCell(25, "NOME");
		cell.setFontSize(15);
		cell.setFont(fontBold);
		cell = row.createCell(25, "MARCA");
		cell.setFontSize(15);
		cell.setFont(fontBold);
		cell = row.createCell(25, "PREZZO");
		cell.setFontSize(15);
		cell.setFont(fontBold);
		table.addHeaderRow(row);

		DBManager db = new DBManager();
		ArrayList<Prodotto> elenco = db.getProdottibyOrdine(idOrdine);

		for (int i = 0; i < elenco.size(); i++) {
			row = table.createRow(20);
			cell = row.createCell(25, elenco.get(i).getIdProdotto() + "");
			cell.setFontSize(12);
			cell.setValign(VerticalAlignment.MIDDLE);
			cell = row.createCell(25, elenco.get(i).getNome());
			cell.setFontSize(12);
			cell = row.createCell(25, elenco.get(i).getMarca());
			cell.setFontSize(12);
			cell = row.createCell(25, elenco.get(i).getPrezzo() + "");
			cell.setFontSize(12);
		}

		table.draw();

		// close the content stream
		cos.close();

		// Save the results and ensure that the document is properly closed:
		document.save(output);
		document.close();
		return output;
	}

}
