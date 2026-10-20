cask "binlogviz" do
  version "0.33.1"

  on_macos do
    on_intel do
      sha256 "613bb25d6fb1cf89985fd608f77e39b730710939a124056417aaa5dfa5850b1d"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.33.1/binlogviz_0.33.1_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "b290971e5e2e84f9cf84a40de451b2d0bf3c4bd3e4bb69e5203980d64503f21d"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.33.1/binlogviz_0.33.1_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "c1672bb977d95f60783d21d96ce4ac3af88dbeb27d45982a845371e38e896616"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.33.1/binlogviz_0.33.1_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "7fbbf42216c18572ddf0aeff372dc1a311efbbe7489e8e1db3b4f5e8c69c4945"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.33.1/binlogviz_0.33.1_linux_arm64.tar.gz",
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
