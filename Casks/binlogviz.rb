cask "binlogviz" do
  version "0.20.0"

  on_macos do
    on_intel do
      sha256 "0a81720e37c6b991deec1cc08fd6307a52339a98ec36518e049c83617a76a315"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.20.0/binlogviz_0.20.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "6c2fe3320373fb93303c9c8025066f1f070709f9833d5a6b166d620f2e36d9bd"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.20.0/binlogviz_0.20.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "6227aee7285443f8532e88db3cb107b4850f70a2ac0b719d87a1bbe916651c5e"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.20.0/binlogviz_0.20.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "2f5a5490fe12a0ba6ca2c866516201535b33d43ee6039cb5d9bd8120baa98341"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.20.0/binlogviz_0.20.0_linux_arm64.tar.gz",
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
