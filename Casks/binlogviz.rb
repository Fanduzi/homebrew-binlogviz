cask "binlogviz" do
  version "0.38.0"

  on_macos do
    on_intel do
      sha256 "a9921b065c666d35baf4375674ea68cf51bc20979371b8412818706b9f088e59"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.38.0/binlogviz_0.38.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "5941fa195790d4cf9fed9ef3a5ddd1960f9f7cfbf3ca8211ab3481e0cdc820f3"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.38.0/binlogviz_0.38.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "03453460376d2b5872ef967cc2413d32b07c6f371f32ef5c820ed5da53930338"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.38.0/binlogviz_0.38.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "651e7b639f23bf4771b4abc60952874c3bc8c326d7b231e38fe25d2a7ee9c641"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.38.0/binlogviz_0.38.0_linux_arm64.tar.gz",
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
