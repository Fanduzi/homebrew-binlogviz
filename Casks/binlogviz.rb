cask "binlogviz" do
  version "0.9.0"

  on_macos do
    on_intel do
      sha256 "691454849c6ee5d30849ed71d3504ebf68f9caa4f3b4cc0f615a819616fbf654"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.9.0/binlogviz_0.9.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "bf70de1c1f4d28651a549aea7d215e497e43ec4c0b8b9250e707560e4e0d2e7e"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.9.0/binlogviz_0.9.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "4fed487db7a748866f1551dfbaca76b930d18bab78138dc80b79e83806c2d6a9"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.9.0/binlogviz_0.9.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "316f3cbb556aae310f8ee95db3cf50b1cb29708d84e33e66acb59f3a36ae9585"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.9.0/binlogviz_0.9.0_linux_arm64.tar.gz",
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
