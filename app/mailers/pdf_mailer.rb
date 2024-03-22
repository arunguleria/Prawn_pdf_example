class PdfMailer < ApplicationMailer
	def send_report
		@message = "Hey this is a result from your test suite."
		pdf_content = generate_pdf_content

    attachments['test_result_report.pdf'] = File.read(pdf_content)

    mail(to: 'email@gmail.com', subject: 'Test Report Results.')
	end

	private
  def generate_pdf_content
		pdf_service = PdfGeneratorService.new
    pdf = pdf_service.generate_pdf
    pdf_file = Tempfile.new(['test_result_report', '.pdf'], Rails.root.join('tmp'))
    pdf_file.binmode
    pdf_file.write(pdf)
    pdf_file.rewind
    pdf_file.close
  	pdf_file.path
  end
end