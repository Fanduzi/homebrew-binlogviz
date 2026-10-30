cask "binlogviz" do
  version "0.37.0"

  on_macos do
    on_intel do
      sha256 "a4ef79b71353b1a412d831028f69318e11ce5cb997d505e5b54ab95428f95c2b"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.37.0/binlogviz_0.37.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "a94db0e4e266b9077b9c3f739891c09903cea672c36fe5c2814502bb1d87702c"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.37.0/binlogviz_0.37.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "91d7950d391edd3a28f8d5a0c202e5ea5921f002f27981b5aa404401e3668527"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.37.0/binlogviz_0.37.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "ac070ec1ffd5b4f01d50f3324c94c37d9089a6b5bb6e531144fdd8423b8a4e45"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.37.0/binlogviz_0.37.0_linux_arm64.tar.gz",
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
