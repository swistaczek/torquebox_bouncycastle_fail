class DemoController < ApplicationController
  def index
    @sample_pdf = SamplePdf.new
    render json: { output_path: @sample_pdf.render! }
  end
end
