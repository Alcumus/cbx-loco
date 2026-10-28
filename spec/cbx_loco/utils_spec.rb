require "spec_helper"

describe CbxLoco::Utils do
  describe ".create_directory" do
    let(:path) { "folder1/folder2" }

    def delete_path(path)
      File.delete(path + "/.keep")
      Dir.rmdir(path)
    end

    before(:each) { suppress_console_output }

    it "should create directory" do
      CbxLoco::Utils.create_directory path
      expect(File.directory?("folder1")).to be true
      expect(File.directory?("folder1/folder2")).to be true

      delete_path(path)
    end

    it "should create keep file" do
      CbxLoco::Utils.create_directory path
      expect(File.file?(path + "/.keep")).to be true

      delete_path(path)
    end
  end

  describe "console messages" do
    around do |example|
      was_enabled = Rainbow.enabled
      Rainbow.enabled = true
      example.run
    ensure
      Rainbow.enabled = was_enabled
    end

    it "prints errors in bold red" do
      expect { CbxLoco::Utils.print_error("error") }.
        to output("\n\n#{Rainbow('error').red.bold}\n").to_stdout
    end

    it "prints success in bold green" do
      expect { CbxLoco::Utils.print_success("success") }.
        to output("\n\n#{Rainbow('success').green.bold}\n").to_stdout
    end
  end
end
