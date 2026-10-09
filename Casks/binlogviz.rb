cask "binlogviz" do
  version "0.23.23"

  on_macos do
    on_intel do
      sha256 "f12e1407ad5c9e5e7a89a7bf9f1944b227b743668daea3074cbae050a0289707"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.23/binlogviz_0.23.23_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "1ca2ba8eabfc21652c32b63a2480e46d41c47e6c06a860181e1b6ae7ecd1ae1f"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.23/binlogviz_0.23.23_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "201a357dfe6dd39ef93d43a93940cc7aaf600c5ada384efec778d9b3278475a7"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.23/binlogviz_0.23.23_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "362a22bbf971097a02819c681eeec17f15192c1afe1b28f613e8eef1bdef9b74"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.23/binlogviz_0.23.23_linux_arm64.tar.gz",
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
