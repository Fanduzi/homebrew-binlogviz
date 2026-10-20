cask "binlogviz" do
  version "0.33.0"

  on_macos do
    on_intel do
      sha256 "3cf2b55d2b9a9a824c01785078828996d21a201b81f91cbda3cae64e0a028844"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.33.0/binlogviz_0.33.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "e558735d2c0553c011f8e78380b408fbffd8fd5f6dd8d99e35ce7713ca1e1c39"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.33.0/binlogviz_0.33.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "beeb4a97fdb58579630671ac92c12942c8e27e5f12b27fac103f4830e315b2d0"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.33.0/binlogviz_0.33.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "914f5a16b377b7ed4bdace1a3861f5657697daadb5eb4bbdde7dfa1644452762"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.33.0/binlogviz_0.33.0_linux_arm64.tar.gz",
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
