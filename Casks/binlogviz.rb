cask "binlogviz" do
  version "0.23.20"

  on_macos do
    on_intel do
      sha256 "5746ff36a69286a7a94ab4b7d81b3951b55f1b30868b8d8353276433f9c8ad65"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.20/binlogviz_0.23.20_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "ee28bd1a766ccfe60c226fb7dbd8541d678c45a352df9dc04715da7c316c0b60"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.20/binlogviz_0.23.20_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "224cb35a161ef0acbd68a3f7d5e898568fd8266497029e5dad28788e30eb685b"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.20/binlogviz_0.23.20_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "99a4a7f671907361a55564ce797bb8dafc62ce941956af2f2d5425d78ecf41a4"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.20/binlogviz_0.23.20_linux_arm64.tar.gz",
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
