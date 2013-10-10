class DemoController < ApplicationController
  def index
    @sample_pdf = SamplePdf.new
    begin
      render json: { output_path: @sample_pdf.render! }
    rescue => e 
      render json: { exception: e.inspect }, status: 500
    end
  end
end
