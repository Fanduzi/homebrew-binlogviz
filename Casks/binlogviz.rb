cask "binlogviz" do
  version "0.23.2"

  on_macos do
    on_intel do
      sha256 "f556421578988ef2f104ca295390ec726ec62a7ea81142995fcf8502c8a28ba1"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.2/binlogviz_0.23.2_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "f217f5c6b24fcb616d7773bdaabd5b307649b954f7bc05923c203edd96550930"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.2/binlogviz_0.23.2_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "41aa7b8e0ed8d755cd455c78edd3ea6ff887c22399902db5daa3f2c6ee5f1c88"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.2/binlogviz_0.23.2_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "c9a005eb3c7fc4af00da68214b434b8e567b1727ed605359bccc7cab9277c503"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.2/binlogviz_0.23.2_linux_arm64.tar.gz",
            verified: "github.com/Fanduzi/BinlogVisualizer/"
      end
    end
  end

  name "BinlogViz"
  desc "Local CLI for MySQL ROW binlog analysis"
  homepage "https://github.com/Fanduzi/BinlogVisualizer"

  binary "binlogviz"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path/"binlogviz"]
    end
  end
end
