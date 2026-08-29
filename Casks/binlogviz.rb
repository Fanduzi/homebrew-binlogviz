cask "binlogviz" do
  version "0.22.1"

  on_macos do
    on_intel do
      sha256 "6016fa4b63ffe5be04be85e9c85e785e7e52f82d35d6f4d323b37132c2d94e0d"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.22.1/binlogviz_0.22.1_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "b03a52efc3d1cd15978b87b027f41487826f16f06a0230e780fc6f8d2aef293a"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.22.1/binlogviz_0.22.1_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "d8bb705ad7e7cc13223393f0752190b3ac0d4fccedc6073e7afc8cf4a6477f4f"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.22.1/binlogviz_0.22.1_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "6f923f5d896314636aab610e74c51a114e828a1c889dee9df76d7fd88e788163"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.22.1/binlogviz_0.22.1_linux_arm64.tar.gz",
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
