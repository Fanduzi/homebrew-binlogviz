cask "binlogviz" do
  version "0.7.0"

  on_macos do
    on_intel do
      sha256 "4aae9e57fcce80aeadf61fd143acbe89bfed8c631ac40b35705bcc2a0fa3a9f6"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.7.0/binlogviz_0.7.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "4546f8d1c053b20666c05624db0518512374f1a9966ab514377125a2e96a7265"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.7.0/binlogviz_0.7.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "0de5b45fd1264384c7c3cbb8bd52ab38b54884fb03d3792836bc6d4136d16f2c"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.7.0/binlogviz_0.7.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "913993579c988bffc7ad281bc431e2fbe7effb4f6ffd090a714bbe0216ac7bdf"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.7.0/binlogviz_0.7.0_linux_arm64.tar.gz",
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
