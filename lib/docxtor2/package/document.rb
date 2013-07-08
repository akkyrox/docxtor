module Docxtor2
  class Package::Document < Package::Part
    def initialize(content, filepath = DOCUMENT_XML_PATH)
      super(filepath, self.class.render(content))
    end

    def self.render(content)
      xml = Builder::XmlMarkup.new
      
      xml.instruct! :xml, :version => "1.0", :encoding => "UTF-8", :standalone => "yes"
      xml.w :document, "xmlns:ve" => "http://schemas.openxmlformats.org/markup-compatibility/2006",
                       "xmlns:o" => "urn:schemas-microsoft-com:office:office",
                       "xmlns:r" => "http://schemas.openxmlformats.org/officeDocument/2006/relationships",
                       "xmlns:m" => "http://schemas.openxmlformats.org/officeDocument/2006/math",
                       "xmlns:v" => "urn:schemas-microsoft-com:vml",
                       "xmlns:wp" => "http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing",
                       "xmlns:w10" => "urn:schemas-microsoft-com:office:word",
                       "xmlns:w" => "http://schemas.openxmlformats.org/wordprocessingml/2006/main",
                       "xmlns:wne" => "http://schemas.microsoft.com/office/word/2006/wordml" do
        xml.w :body do
          xml << content
        end
      end

      xml.target!
    end
  end
end
