# encoding: utf-8
require 'itext-jruby'

class SamplePdf

  def initialize    
    @source_pdf   = Rails.root.join('lib/cert/sample.pdf')
    @sample_image = Rails.root.join('lib/cert/pug.jpg')
    @cert_file    = Rails.root.join('lib/cert/ia.p12')
    @output_pdf   = Rails.root.join('public/output.pdf')
  end

  # Read more at https://github.com/swistaczek/itext-jruby
  def render!
    @pdf_document = Itext.new(path: @source_pdf)
    @pdf_document.add_attachment @sample_image
    @pdf_document.enable_signing!(private_key_path: @cert_file)
  
    @pdf_document.save(@output_pdf) 
    # ^
    # |-> Raise error:
    # java.lang.SecurityException: class "org.bouncycastle.asn1.DEREncodable"'s signer information does not match signer information of other classes in the same package
  end

end