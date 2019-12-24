require 'prawn'
module Saveable

	def Saveable.save_as_pdf(txt,document_id)
		Prawn::Document.generate("Desktop\\invoice#{document_id}.pdf") do
			font("#{Prawn::DATADIR}/fonts/DejaVuSans.ttf")
  			text txt
  	end
  end
end
