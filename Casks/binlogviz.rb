cask "binlogviz" do
  version "0.23.6"

  on_macos do
    on_intel do
      sha256 "2d9f417a2e556def5e72ba3aa77a875e721c963cf3a9536f098b47c55d37a72c"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.6/binlogviz_0.23.6_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "2ca1d1adffcee6b5b0081bcb44f1b7e1cea1f7f2cf5ce37190919f3350272d1e"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.6/binlogviz_0.23.6_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "c4b989368fc7acb29ec620b484c0b2eb02adadf4086478ad9bdbd3f679105c7c"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.6/binlogviz_0.23.6_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "ec3699533f456a357eff3cf29a8c7616254befd23676f0ba769f6a33a0057617"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.6/binlogviz_0.23.6_linux_arm64.tar.gz",
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
