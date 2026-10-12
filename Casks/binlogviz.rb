cask "binlogviz" do
  version "0.23.31"

  on_macos do
    on_intel do
      sha256 "be63961f4aa52d13508b13ab3e2abd21ca7b9b1c79e2374834852baee837e9a5"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.31/binlogviz_0.23.31_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "2c58aeda9c3eea5fc0acbbafc8e57eaebb67553a8d48972ab26b71fb6ca06740"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.31/binlogviz_0.23.31_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "f7bf7ac29c6c7b565b05147a0e75aa53feb2c8a9185c00a8469a5441ea921f8a"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.31/binlogviz_0.23.31_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "cd5181124ab4ac929ab0568e6af6b9f021a106f3d04fdd6786df3f8bd532b311"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.31/binlogviz_0.23.31_linux_arm64.tar.gz",
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
