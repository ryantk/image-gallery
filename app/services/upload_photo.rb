class UploadPhoto
  def initialize(uploaded_file)
    @uploaded_file = uploaded_file
  end

  def upload_and_attach_to(gallery)

    # generate file details

    # upload main file

    # generate thumbnail


    # file = params[:file]
    # type = file.original_filename.split('.').last

    # new_filename = [SecureRandom.uuid, type].join(".")

    # photo.file_path = File.open(Rails.root.join('storage', new_filename))

    # photo.filename = file.original_filename
    # photo.uploaded_at = DateTime.now
  end

  private
  attr_reader :uploaded_file

  def file_path
    Rails.root.join('storage', new_filename)
  end

  def new_filename
    "#{SecureRandom.uuid}.#{File.extname(uploaded_file.original_filename)}"
  end
end