cask "binlogviz" do
  version "0.23.21"

  on_macos do
    on_intel do
      sha256 "e84f9bfbafe6d1d5c702297fd748d450a16c2996f21dac82dbf84145e51f6a08"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.21/binlogviz_0.23.21_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "c138e78fbeea2194ba26f9109d3543553713b585d6d1468b64ba40c224f796ae"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.21/binlogviz_0.23.21_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "201dad9cf374afef495947450464a0bb336639246a70902b386a60195aeb5c30"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.21/binlogviz_0.23.21_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "1c477e140fcb84581b5391063de52dca7880cac9a4311c9921b6270c8c71f133"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.21/binlogviz_0.23.21_linux_arm64.tar.gz",
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
